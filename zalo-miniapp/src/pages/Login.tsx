import { useState } from 'react';
import { login, getAccessToken } from 'zmp-sdk';
import { API_BASE } from '../config';
import type { LoginResponse, ZaloUser, UserLicense } from '../config';

declare const zmp: any;

interface Props {
  onSuccess: (user: ZaloUser, licenses: UserLicense[]) => void;
}

export default function Login({ onSuccess }: Props) {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleLogin = async () => {
    setLoading(true);
    setError('');

    try {
      await login();
      const accessToken = await getAccessToken();

      let zalo_id = '';
      let name = '';
      let phone = '';
      let avatar = '';

      try {
        const infoRes = await fetch(
          `https://graph.zalo.me/v2.0/me?access_token=${accessToken}&fields=id,name,phone,avatar`,
        );
        const infoData = await infoRes.json();
        if (infoData.id) {
          zalo_id = String(infoData.id);
          name = infoData.name || '';
          phone = infoData.phone || '';
          avatar = infoData.avatar || '';
        }
      } catch (_) {}

      if (!zalo_id) {
        try {
          const userInfo = await (zmp as any).getUserInfo();
          if (userInfo) {
            zalo_id = String(userInfo.id || userInfo.userID || '');
            name = userInfo.name || '';
            phone = userInfo.phone || userInfo.phoneNumber || '';
            avatar = userInfo.avatar || '';
          }
        } catch (_) {}
      }

      if (!zalo_id && accessToken) {
        try {
          const infoRes = await fetch(
            `https://graph.zalo.me/v2.0/me?access_token=${accessToken}&fields=id,name,phone,avatar`,
          );
          const infoData = await infoRes.json();
          if (infoData.id) {
            zalo_id = String(infoData.id);
            name = infoData.name || '';
            phone = infoData.phone || '';
            avatar = infoData.avatar || '';
          }
        } catch (_) {}
      }

      if (!zalo_id) {
        setError('Khong lay duoc zalo_id. Vui long thu lai.');
        return;
      }

      const res = await fetch(`${API_BASE}/api/zalo/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ zalo_id, name, phone, avatar, access_token: accessToken }),
      });

      const data: LoginResponse = await res.json();

      if (data.error) {
        setError(data.error);
        return;
      }

      onSuccess(data.user, data.licenses || []);
    } catch (e: any) {
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
          Neu chua co tai khoan, he thong se tao moi (dung thu 7 ngay).
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
