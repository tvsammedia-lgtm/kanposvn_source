'use client';
import { useState, useEffect } from 'react';

type MenuItem = {
  id: string;
  name: string;
  price: string | number;
  description: string;
  image_url: string;
  category_id: string;
};

type CartItem = MenuItem & {
  quantity: number;
  note: string;
};

export default function OrderClient({ token }: { token: string }) {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [tableInfo, setTableInfo] = useState<any>(null);
  const [categories, setCategories] = useState<any[]>([]);
  const [items, setItems] = useState<MenuItem[]>([]);
  
  const [cart, setCart] = useState<CartItem[]>([]);
  const [isCartOpen, setIsCartOpen] = useState(false);
  
  const [orderStatus, setOrderStatus] = useState<'idle' | 'submitting' | 'success'>('idle');
  const [orderInfo, setOrderInfo] = useState<any>(null);

  useEffect(() => {
    async function fetchData() {
      try {
        // 1. Verify QR
        const qrRes = await fetch(`/api/public/qr/${token}`);
        if (!qrRes.ok) {
          throw new Error('Mã QR không hợp lệ hoặc đã bị khóa.');
        }
        const qrData = await qrRes.json();
        setTableInfo(qrData);

        // 2. Fetch Menu
        const menuRes = await fetch(`/api/public/menu/${token}`);
        if (!menuRes.ok) {
          throw new Error('Lỗi khi tải thực đơn.');
        }
        const menuData = await menuRes.json();
        setCategories(menuData.categories);
        setItems(menuData.items);
      } catch (err: any) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    }
    fetchData();
  }, [token]);

  const addToCart = (item: MenuItem) => {
    setCart((prev) => {
      const existing = prev.find((i) => i.id === item.id);
      if (existing) {
        return prev.map((i) => i.id === item.id ? { ...i, quantity: i.quantity + 1 } : i);
      }
      return [...prev, { ...item, quantity: 1, note: '' }];
    });
  };

  const updateQuantity = (id: string, delta: number) => {
    setCart((prev) => {
      return prev.map((i) => {
        if (i.id === id) {
          const newQ = Math.max(0, i.quantity + delta);
          return { ...i, quantity: newQ };
        }
        return i;
      }).filter(i => i.quantity > 0);
    });
  };

  const updateNote = (id: string, note: string) => {
    setCart((prev) => prev.map((i) => i.id === id ? { ...i, note } : i));
  };

  const submitOrder = async () => {
    if (cart.length === 0) return;
    setOrderStatus('submitting');
    try {
      const payload = {
        qr_token: token,
        items: cart.map(i => ({
          menu_item_id: i.id,
          quantity: i.quantity,
          note: i.note
        })),
        idempotency_key: crypto.randomUUID()
      };

      const res = await fetch('/api/public/orders', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      const data = await res.json();

      if (res.ok && data.success) {
        setOrderStatus('success');
        setOrderInfo(data);
        setCart([]);
        setIsCartOpen(false);
      } else {
        throw new Error(data.error || 'Đặt món thất bại');
      }
    } catch (err: any) {
      alert(err.message);
      setOrderStatus('idle');
    }
  };

  if (loading) return <div className="p-8 text-center">Đang tải...</div>;
  if (error) return <div className="p-8 text-center text-red-500">{error}</div>;

  if (orderStatus === 'success') {
    return (
      <div className="p-8 max-w-md mx-auto text-center flex flex-col justify-center items-center h-screen bg-gray-50">
        <div className="bg-white p-8 rounded-2xl shadow-sm w-full">
          <div className="w-16 h-16 bg-green-100 text-green-500 rounded-full flex items-center justify-center mx-auto mb-4 text-3xl">✓</div>
          <h2 className="text-2xl font-bold text-gray-900 mb-6">Đặt món thành công!</h2>
          
          <div className="bg-gray-50 rounded-lg p-4 mb-6 text-left border border-gray-100">
            <p className="flex justify-between mb-2">
              <span className="text-gray-500">Bàn:</span> 
              <span className="font-semibold text-gray-900">{tableInfo?.table_name}</span>
            </p>
            <p className="flex justify-between mb-2">
              <span className="text-gray-500">Mã đơn:</span> 
              <span className="font-semibold text-gray-900">#{orderInfo?.order_no}</span>
            </p>
            <p className="flex justify-between font-bold text-lg border-t pt-2 mt-2">
              <span>Tổng tiền:</span>
              <span className="text-blue-600">{orderInfo?.total?.toLocaleString()} đ</span>
            </p>
          </div>

          <button 
            onClick={() => setOrderStatus('idle')}
            className="w-full bg-gray-900 text-white font-semibold py-3 rounded-xl shadow-md transition-transform hover:scale-[1.02]"
          >
            Tiếp tục gọi món
          </button>
        </div>
      </div>
    );
  }

  const cartTotal = cart.reduce((acc, i) => acc + (Number(i.price) * i.quantity), 0);

  return (
    <div className="pb-24 max-w-md mx-auto bg-gray-50 min-h-screen font-sans">
      {/* Header */}
      <div className="bg-white shadow-sm p-4 sticky top-0 z-10 flex justify-between items-center backdrop-blur-sm bg-white/90">
        <div>
          <h1 className="font-extrabold text-xl text-gray-900">{tableInfo?.store_name}</h1>
          <p className="text-sm font-medium text-blue-600 bg-blue-50 px-2 py-0.5 rounded-md inline-block mt-1">
            {tableInfo?.table_name}
          </p>
        </div>
        <button className="text-gray-600 font-medium text-sm border border-gray-300 px-3 py-1.5 rounded-lg hover:bg-gray-50">
          Gọi phục vụ
        </button>
      </div>

      {/* Menu */}
      <div className="p-4 space-y-8">
        {categories.map(cat => {
          const catItems = items.filter(i => i.category_id === cat.id);
          if (catItems.length === 0) return null;
          return (
            <div key={cat.id}>
              <h2 className="font-bold text-xl text-gray-800 mb-4 px-1">{cat.name}</h2>
              <div className="space-y-4">
                {catItems.map(item => {
                  const cartItem = cart.find(c => c.id === item.id);
                  return (
                    <div key={item.id} className="flex bg-white p-3 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow">
                      {item.image_url ? (
                        <img src={item.image_url} alt={item.name} className="w-24 h-24 object-cover rounded-xl mr-4" />
                      ) : (
                        <div className="w-24 h-24 bg-gray-100 rounded-xl mr-4 flex items-center justify-center text-gray-400">
                          Hình ảnh
                        </div>
                      )}
                      <div className="flex-1 flex flex-col justify-between py-1">
                        <div>
                          <h3 className="font-semibold text-gray-900 leading-tight">{item.name}</h3>
                          {item.description && <p className="text-xs text-gray-500 mt-1.5 line-clamp-2">{item.description}</p>}
                        </div>
                        <div className="flex justify-between items-end mt-2">
                          <span className="font-bold text-blue-600 text-lg">{Number(item.price).toLocaleString()}đ</span>
                          
                          {cartItem ? (
                            <div className="flex items-center gap-3 bg-blue-50 rounded-full px-2 py-1 border border-blue-100">
                              <button onClick={() => updateQuantity(item.id, -1)} className="w-7 h-7 flex items-center justify-center font-bold text-blue-700 bg-white rounded-full shadow-sm">-</button>
                              <span className="text-sm font-bold w-4 text-center text-blue-900">{cartItem.quantity}</span>
                              <button onClick={() => updateQuantity(item.id, 1)} className="w-7 h-7 flex items-center justify-center font-bold text-white bg-blue-600 rounded-full shadow-sm">+</button>
                            </div>
                          ) : (
                            <button 
                              onClick={() => addToCart(item)}
                              className="bg-gray-900 text-white px-5 py-2 rounded-full text-sm font-semibold shadow-md active:scale-95 transition-transform"
                            >
                              Thêm
                            </button>
                          )}
                        </div>
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>
          );
        })}
      </div>

      {/* Cart FAB */}
      {cart.length > 0 && (
        <div className="fixed bottom-0 left-0 right-0 p-4 bg-white/90 backdrop-blur-md border-t flex justify-between items-center shadow-[0_-10px_15px_-3px_rgba(0,0,0,0.05)] z-20">
          <div>
            <p className="text-gray-500 text-sm font-medium">{cart.reduce((a, b) => a + b.quantity, 0)} món đã chọn</p>
            <p className="font-bold text-xl text-gray-900">{cartTotal.toLocaleString()} đ</p>
          </div>
          <button 
            onClick={() => setIsCartOpen(true)}
            className="bg-blue-600 text-white font-bold px-8 py-3.5 rounded-2xl shadow-[0_8px_15px_-3px_rgba(37,99,235,0.4)] transition-transform active:scale-95 flex items-center gap-2"
          >
            <span>Thanh toán</span>
            <span>→</span>
          </button>
        </div>
      )}

      {/* Cart Modal */}
      {isCartOpen && (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex flex-col justify-end animate-in fade-in duration-200">
          <div className="bg-white rounded-t-3xl w-full max-h-[90vh] flex flex-col shadow-2xl animate-in slide-in-from-bottom duration-300">
            <div className="p-5 border-b border-gray-100 flex justify-between items-center sticky top-0 bg-white rounded-t-3xl z-10">
              <h2 className="font-extrabold text-xl text-gray-900">Giỏ hàng của bạn</h2>
              <button onClick={() => setIsCartOpen(false)} className="bg-gray-100 w-8 h-8 rounded-full flex items-center justify-center text-gray-500 font-bold hover:bg-gray-200">✕</button>
            </div>
            
            <div className="p-5 overflow-y-auto flex-1 space-y-5 bg-gray-50/50">
              {cart.map(item => (
                <div key={item.id} className="bg-white p-4 rounded-2xl border border-gray-100 shadow-sm">
                  <div className="flex justify-between items-start mb-3">
                    <div className="flex-1 pr-4">
                      <h3 className="font-semibold text-gray-900">{item.name}</h3>
                      <p className="font-bold text-blue-600 mt-0.5">{Number(item.price).toLocaleString()}đ</p>
                    </div>
                    <div className="flex items-center gap-3 bg-gray-50 rounded-full px-2 py-1.5 border border-gray-100">
                      <button onClick={() => updateQuantity(item.id, -1)} className="w-8 h-8 flex items-center justify-center font-bold text-gray-700 bg-white rounded-full shadow-sm border border-gray-200">-</button>
                      <span className="text-sm font-bold w-5 text-center">{item.quantity}</span>
                      <button onClick={() => updateQuantity(item.id, 1)} className="w-8 h-8 flex items-center justify-center font-bold text-gray-700 bg-white rounded-full shadow-sm border border-gray-200">+</button>
                    </div>
                  </div>
                  <div className="relative">
                    <input 
                      type="text" 
                      placeholder="Ghi chú (Không hành, ít đá...)" 
                      className="w-full text-sm border-0 bg-gray-50 rounded-xl p-3 text-gray-700 placeholder-gray-400 focus:ring-2 focus:ring-blue-100 focus:bg-white transition-all"
                      value={item.note}
                      onChange={(e) => updateNote(item.id, e.target.value)}
                    />
                  </div>
                </div>
              ))}
            </div>

            <div className="p-5 bg-white border-t border-gray-100 pb-safe shadow-[0_-10px_20px_-10px_rgba(0,0,0,0.1)]">
              <div className="flex justify-between font-bold text-xl mb-5 text-gray-900">
                <span>Tổng cộng:</span>
                <span className="text-blue-600">{cartTotal.toLocaleString()} đ</span>
              </div>
              <button 
                onClick={submitOrder}
                disabled={orderStatus === 'submitting'}
                className="w-full bg-gray-900 disabled:bg-gray-400 text-white font-bold text-lg py-4 rounded-2xl shadow-xl shadow-gray-900/20 transition-transform active:scale-[0.98] flex justify-center items-center"
              >
                {orderStatus === 'submitting' ? (
                  <span className="flex items-center gap-2">
                    <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"><circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle><path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg>
                    Đang gửi...
                  </span>
                ) : 'GỬI ĐƠN HÀNG'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
