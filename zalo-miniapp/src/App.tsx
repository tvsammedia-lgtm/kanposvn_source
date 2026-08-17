import { useState } from 'react';
import Login from './pages/Login';
import Home from './pages/Home';
import SoftwareList from './pages/SoftwareList';
import MyLicenses from './pages/MyLicenses';
import Download from './pages/Download';
import type { ZaloUser, UserLicense } from './config';

import { API_BASE } from './config';

type Page = 'login' | 'home' | 'software' | 'licenses' | 'download';

export default function App() {
  const [page, setPage] = useState<Page>('login');
  const [user, setUser] = useState<ZaloUser | null>(null);
  const [licenses, setLicenses] = useState<UserLicense[]>([]);

  const handleLogin = (u: ZaloUser, l: UserLicense[]) => {
    setUser(u);
    setLicenses(l);
    setPage('home');
  };

  const handleTrial = async (appCode: string) => {
    if (!user) return;
    try {
      const res = await fetch(`${API_BASE}/api/zalo/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ zalo_id: user.zalo_id, name: user.full_name, phone: user.phone, app_code: appCode }),
      });
      const data = await res.json();
      if (data.error) throw new Error(data.error);
      if (data.licenses) {
        setLicenses(data.licenses);
        setPage('licenses');
      }
    } catch (e: any) {
      throw e;
    }
  };

  const handleLogout = () => {
    setUser(null);
    setLicenses([]);
    setPage('login');
  };

  if (page === 'login' || !user) {
    return <Login onSuccess={handleLogin} />;
  }

  if (page === 'home') {
    return (
      <Home
        user={user}
        licenses={licenses}
        onBrowseSoftware={() => setPage('software')}
        onMyLicenses={() => setPage('licenses')}
        onDownload={() => setPage('download')}
        onLogout={handleLogout}
      />
    );
  }

  if (page === 'software') {
    return (
      <SoftwareList
        user={user}
        licenses={licenses}
        onBack={() => setPage('home')}
        onTrial={handleTrial}
        onRefresh={setLicenses}
      />
    );
  }

  if (page === 'licenses') {
    return (
      <MyLicenses
        user={user}
        licenses={licenses}
        onRefresh={setLicenses}
        onBack={() => setPage('home')}
      />
    );
  }

  if (page === 'download') {
    return <Download onBack={() => setPage('home')} />;
  }

  return <Login onSuccess={handleLogin} />;
}
