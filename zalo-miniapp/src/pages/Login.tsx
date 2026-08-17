import { useState } from 'react';
import { API_BASE } from '../config';
import type { LoginResponse, ZaloUser, AppModule } from '../config';

interface Props {
  onSuccess: (user: ZaloUser, apps: AppModule[]) => void;
}

export default function Login({ onSuccess }: Props) {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleLogin = async () => {
    setLoading(true);
    setError('');

    try {
      // In real Zalo Mini App, use zmp-sdk to get user info
      // For dev/testing, use mock data
      const zaloId = import.meta.env.VITE_ZALO_ID || 'dev_' + Date.now();
      const zaloName = import.meta.env.VITE_ZALO_NAME || 'Khach Test';

      const res = await fetch(`${API_BASE}/api/zalo/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          zalo_id: zaloId,
          name: zaloName,
        }),
      });

      const data: LoginResponse = await res.json();

      if (data.error) {
        setError(data.error);
        return;
      }

      onSuccess(data.user, data.apps);
    } catch (e) {
      setError('Loi ket noi: ' + String(e));
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-blue-500 to-blue-700 text-white p-6">
      <div className="text-center mb-8">
        <div className="text-6xl mb-4">🏪</div>
        <h1 className="text-3xl font-bold mb-2">KanPOS</h1>
        <p className="text-blue-100 text-sm">He thong ban hang tren Zalo</p>
      </div>

      <div className="bg-white rounded-2xl shadow-xl p-6 w-full max-w-sm text-gray-800">
        <h2 className="text-lg font-bold text-center mb-4">Dang nhap Zalo</h2>
        <p className="text-sm text-gray-500 text-center mb-6">
          Nhan "Dang nhap" de ket noi tai khoan Zalo cua ban.
          <br />
          Neu chua co tai khoan, he thong se tao moi (dung thu 30 ngay).
        </p>

        {error && (
          <div className="bg-red-50 text-red-600 text-sm p-3 rounded-lg mb-4">
            {error}
          </div>
        )}

        <button
          onClick={handleLogin}
          disabled={loading}
          className="w-full bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white font-bold py-3 rounded-xl text-lg transition"
        >
          {loading ? 'Dang xu ly...' : 'Dang nhap voi Zalo'}
        </button>
      </div>

      <p className="text-blue-200 text-xs mt-6 text-center">
        KanPOS v1.0 · Phien ban dung thu
      </p>
    </div>
  );
}
