'use client';
import { useState } from 'react';

export default function QrTestPage() {
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<any>(null);

  const handleSeed = async () => {
    setLoading(true);
    try {
      const res = await fetch('/api/seed-qr', { method: 'POST' });
      const data = await res.json();
      setResult(data);
    } catch (err: any) {
      alert(err.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="p-8 max-w-xl mx-auto bg-white shadow rounded mt-10">
      <h1 className="text-2xl font-bold mb-4">Công cụ Test QR Order</h1>
      <p className="mb-6 text-gray-600">
        Bấm nút bên dưới để tạo 1 Bàn, 1 Danh mục và 2 Món ăn mẫu, sau đó lấy link để test chức năng tự gọi món.
      </p>

      <button
        onClick={handleSeed}
        disabled={loading}
        className="bg-blue-600 text-white font-bold py-2 px-6 rounded disabled:bg-gray-400"
      >
        {loading ? 'Đang tạo...' : 'Tạo Dữ liệu Test'}
      </button>

      {result && result.success && (
        <div className="mt-8 p-4 bg-green-50 border border-green-200 rounded">
          <h2 className="font-bold text-green-700 mb-2">{result.message}</h2>
          <p className="mb-4">Link đặt món (dùng đt quét QR hoặc click trực tiếp):</p>
          <a
            href={result.url}
            target="_blank"
            rel="noreferrer"
            className="text-blue-600 underline font-bold text-lg break-all"
          >
            http://localhost:3000{result.url}
          </a>
        </div>
      )}

      {result && result.error && (
        <div className="mt-8 p-4 bg-red-50 border border-red-200 rounded text-red-700">
          {result.error}
        </div>
      )}
      
      <div className="mt-10 pt-6 border-t">
        <h3 className="font-bold mb-2">Hướng dẫn kiểm tra:</h3>
        <ol className="list-decimal pl-5 space-y-2 text-sm text-gray-700">
          <li>Mở terminal, chạy <code className="bg-gray-100 px-1 rounded">npm run dev</code> ở thư mục <b>admin-web</b>.</li>
          <li>Chạy thử API migrate <a href="/api/migrate" target="_blank" className="text-blue-500 underline">/api/migrate</a> để khởi tạo database.</li>
          <li>Bấm nút Tạo dữ liệu test phía trên.</li>
          <li>Nhấn vào đường link được cung cấp để giả lập làm khách hàng đặt món.</li>
        </ol>
      </div>
    </div>
  );
}
