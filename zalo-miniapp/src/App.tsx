import { useState } from 'react';
import Login from './pages/Login';
import AppSelector from './pages/AppSelector';
import BranchSelector from './pages/BranchSelector';
import POS from './pages/POS';
import type { ZaloUser, AppModule, Branch } from './config';

type Page = 'login' | 'apps' | 'branches' | 'pos';

export default function App() {
  const [page, setPage] = useState<Page>('login');
  const [user, setUser] = useState<ZaloUser | null>(null);
  const [apps, setApps] = useState<AppModule[]>([]);
  const [selectedApp, setSelectedApp] = useState<AppModule | null>(null);
  const [selectedBranch, setSelectedBranch] = useState<Branch | null>(null);

  const handleLogin = (u: ZaloUser, a: AppModule[]) => {
    setUser(u);
    setApps(a);
    if (a.length === 1 && a[0].branches.length === 1) {
      setSelectedApp(a[0]);
      setSelectedBranch(a[0].branches[0]);
      setPage('pos');
    } else if (a.length === 1) {
      setSelectedApp(a[0]);
      setPage('branches');
    } else {
      setPage('apps');
    }
  };

  const handleSelectApp = (app: AppModule) => {
    setSelectedApp(app);
    if (app.branches.length === 1) {
      setSelectedBranch(app.branches[0]);
      setPage('pos');
    } else {
      setPage('branches');
    }
  };

  const handleSelectBranch = (branch: Branch) => {
    setSelectedBranch(branch);
    setPage('pos');
  };

  const handleBack = () => {
    if (page === 'pos') {
      if (apps.length === 1) setPage('login');
      else setPage('apps');
      setSelectedBranch(null);
      setSelectedApp(null);
    } else if (page === 'branches') {
      if (apps.length === 1) setPage('login');
      else setPage('apps');
      setSelectedApp(null);
    } else if (page === 'apps') {
      setPage('login');
    }
  };

  if (page === 'login') {
    return <Login onSuccess={handleLogin} />;
  }

  if (page === 'apps') {
    return <AppSelector apps={apps} onSelect={handleSelectApp} onBack={handleBack} />;
  }

  if (page === 'branches' && selectedApp) {
    return (
      <BranchSelector
        app={selectedApp}
        onSelect={handleSelectBranch}
        onBack={handleBack}
      />
    );
  }

  if (page === 'pos' && selectedApp && selectedBranch && user) {
    return (
      <POS
        user={user}
        app={selectedApp}
        branch={selectedBranch}
        onBack={handleBack}
      />
    );
  }

  return <Login onSuccess={handleLogin} />;
}
