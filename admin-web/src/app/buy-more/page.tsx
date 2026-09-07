'use client';
import { useEffect, useState } from 'react';
import Link from 'next/link';

type ModuleOption = { id: string; app_code: string; app_name: string; description: string; price: number | null };
type BranchInput = { name: string; phone: string; address: string };
type PickedModule = { app_code: string; app_name: string; branches: BranchInput[] };
type RequestRow = {
  id: string;
  payload: string;
  status: string;
  plan: string | null;
  requested_at: string;
  resolved_at: string | null;
  note: string;
};

export default function BuyMorePage() {
  const [token, setToken] = useState('');
  const [user, setUser] = useState<{ full_name?: string; name?: string; phone?: string; storeName?: string } | null>(null);
  const [modules, setModules] = useState<ModuleOption[]>([]);
  const [picked, setPicked] = useState<PickedModule[]>([]);
  const [history, setHistory] = useState<RequestRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  useEffect(() => {
    const tok = localStorage.getItem('store_token') || '';
    const raw = localStorage.getItem('store_user');
    setToken(tok);
    let u: any = {};
    try { u = raw ? JSON.parse(raw) : {}; } catch { u = {}; }
    setUser(u);

    fetch('/api/apps?registration=1')
      .then((r) => r.json())
      .then((data: ModuleOption[]) => setModules(Array.isArray(data) ? data : []))
      .catch(() => setModules([]));

    if (tok) {
      fetch('/api/user/addon-request', { headers: { Authorization: `Bearer ${tok}` } })
        .then((r) => r.json())
        .then((data) => {
          if (Array.isArray(data)) setHistory(data as RequestRow[]);
        })
        .catch(() => {})
        .finally(() => setLoading(false));
    } else {
      setLoading(false);
    }
  }, []);

  const parsePayload = (p?: string | null): { modules?: PickedModule[] } => {
    if (!p) return {};
    try { return JSON.parse(p); } catch { return {}; }
  };

  const moduleLabel = (m: { app_name: string; description?: string }) =>
    m.description && m.description.trim() ? m.description.trim() : m.app_name;

  const toggleModule = (m: ModuleOption) => {
    const exists = picked.some((x) => x.app_code === m.app_code);
    if (exists) {
      setPicked(picked.filter((x) => x.app_code !== m.app_code));
    } else {
      setPicked([...picked, { app_code: m.app_code, app_name: moduleLabel(m), branches: [{ name: '', phone: '', address: '' }] }]);
    }
  };

  const updateBranch = (mi: number, bi: number, field: keyof BranchInput, value: string) => {
    setPicked(picked.map((m, i) => {
      if (i !== mi) return m;
      const branches = m.branches.map((b, j) => (j === bi ? { ...b, [field]: value } : b));
      return { ...m, branches };
    }));
  };

  const addBranch = (mi: number) => {
    setPicked(picked.map((m, i) => (i === mi ? { ...m, branches: [...m.branches, { name: '', phone: '', address: '' }] } : m)));
  };

  const removeBranch = (mi: number, bi: number) => {
    setPicked(picked.map((m, i) => (i === mi ? { ...m, branches: m.branches.filter((_, j) => j !== bi) } : m)));
  };

  const submit = async () => {
    setError('');
    setSuccess('');
    if (!token || !user) { setError('Vui lòng đăng nhập trước.'); return; }
    if (picked.length === 0) { setError('Vui lòng chọn ít nhất 1 module cần mua thêm.'); return; }
    const payload = {
      modules: picked.map((m) => ({
        app_code: m.app_code,
        branches: m.branches.filter((b) => b.name && b.name.trim()).map((b) => ({ name: b.name.trim(), phone: b.phone, address: b.address })),
      })),
    };
    if (payload.modules.every((m) => m.branches.length === 0)) {
      setError('Nhập tên chi nhánh cho ít nhất 1 chi nhánh mỗi module.');
      return;
    }
    setSubmitting(true);
    try {
      const res = await fetch('/api/user/addon-request', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
        body: JSON.stringify(payload),
      });
      const data = await res.json();
      if (!res.ok) { setError(data.error || 'Lỗi gửi yêu cầu'); return; }
      setSuccess(data.message || 'Yêu cầu đã gửi.');
      setPicked([]);
      const h = await fetch('/api/user/addon-request', { headers: { Authorization: `Bearer ${token}` } }).then((r) => r.json());
      if (Array.isArray(h)) setHistory(h as RequestRow[]);
    } catch (e) {
      setError('Lỗi mạng, vui lòng thử lại.');
    } finally {
      setSubmitting(false);
    }
  };

  if (!loading && !token) {
    return (
      <div style={{ fontFamily: 'system-ui', maxWidth: 640, margin: '48px auto', padding: '0 16px', textAlign: 'center' }}>
        <h2>Bạn chưa đăng nhập</h2>
        <p>Đăng nhập cửa hàng để gửi yêu cầu mua thêm module / chi nhánh.</p>
        <Link href="/login" style={{ color: '#0d6efd' }}>Về trang đăng nhập</Link>
      </div>
    );
  }

  return (
    <div style={{ fontFamily: 'system-ui', maxWidth: 760, margin: '40px auto', padding: '0 16px' }}>
      <h2>Mua thêm Module / Chi nhánh</h2>
      <p style={{ color: '#555' }}>
        Chào <b>{user?.full_name || user?.name || user?.phone || 'cửa hàng'}</b>. Chọn các module muốn mua thêm, nhập tên các chi
        nhánh mới rồi gửi yêu cầu — admin sẽ duyệt và cấp gói dùng.
      </p>

      {error && <div style={{ background: '#f8d7da', color: '#842029', padding: 10, borderRadius: 6, marginBottom: 14 }}>{error}</div>}
      {success && <div style={{ background: '#d1e7dd', color: '#0f5132', padding: 10, borderRadius: 6, marginBottom: 14 }}>{success}</div>}

      <h3>1. Chọn module</h3>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill,minmax(180px,1fr))', gap: 8, marginBottom: 20 }}>
        {modules.map((m) => {
          const on = picked.some((x) => x.app_code === m.app_code);
          return (
            <button
              key={m.app_code}
              onClick={() => toggleModule(m)}
              style={{
                padding: '10px 12px', borderRadius: 8, border: `2px solid ${on ? '#0d6efd' : '#ccc'}`,
                background: on ? '#e7f0ff' : '#fff', cursor: 'pointer', textAlign: 'left',
              }}
            >
              <div style={{ fontWeight: 600 }}>{moduleLabel(m)}</div>
              {on ? <div style={{ color: '#0d6efd', fontSize: 13 }}>Đã chọn · bấm để bỏ</div> : null}
            </button>
          );
        })}
      </div>

      {picked.length > 0 && (
        <div style={{ marginBottom: 20 }}>
          <h3>2. Chi nhánh mới</h3>
          {picked.map((m, mi) => (
            <div key={m.app_code} style={{ border: '1px solid #ddd', borderRadius: 8, padding: 12, marginBottom: 12 }}>
              <div style={{ fontWeight: 600, marginBottom: 8 }}>{m.app_name}</div>
              {m.branches.map((b, bi) => (
                <div key={bi} style={{ display: 'flex', gap: 8, flexWrap: 'wrap', marginBottom: 8 }}>
                  <input
                    style={inputStyle}
                    placeholder="Tên chi nhánh (vd: Gara chi nhánh 01)"
                    value={b.name}
                    onChange={(e) => updateBranch(mi, bi, 'name', e.target.value)}
                  />
                  <input style={{ ...inputStyle, flex: '0 1 130px' }} placeholder="SĐT" value={b.phone} onChange={(e) => updateBranch(mi, bi, 'phone', e.target.value)} />
                  <input style={{ ...inputStyle, flex: '2 1 180px' }} placeholder="Địa chỉ (tuỳ chọn)" value={b.address} onChange={(e) => updateBranch(mi, bi, 'address', e.target.value)} />
                  <button type="button" onClick={() => removeBranch(mi, bi)} style={smallDangerBtn}>✕</button>
                </div>
              ))}
              <button type="button" onClick={() => addBranch(mi)} style={{ fontSize: 13, color: '#0d6efd', background: 'none', border: 'none', cursor: 'pointer' }}>
                + Thêm chi nhánh
              </button>
            </div>
          ))}
          <button onClick={submit} disabled={submitting} style={{ ...primaryBtn, opacity: submitting ? 0.6 : 1 }}>
            {submitting ? 'Đang gửi...' : 'Gửi yêu cầu mua thêm'}
          </button>
        </div>
      )}

      <h3>Lịch sử yêu cầu</h3>
      {history.length === 0 ? (
        <p style={{ color: '#888' }}>Chưa có yêu cầu nào.</p>
      ) : (
        <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 14 }}>
          <thead>
            <tr>
              {['Module / Chi nhánh', 'Trạng thái', 'Gói', 'Ngày gửi', 'Ghi chú'].map((h) => (
                <th key={h} style={{ textAlign: 'left', borderBottom: '2px solid #ddd', padding: 8 }}>{h}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {history.map((r) => {
              const payload = parsePayload(r.payload);
              const statusLabel =
                r.status === 'approved' ? 'Đã duyệt' : r.status === 'rejected' ? 'Đã từ chối' : 'Đang chờ duyệt';
              const statusColor = r.status === 'approved' ? '#0f5132' : r.status === 'rejected' ? '#842029' : '#664d03';
              const planLabel = r.plan === 'trial' ? 'Dùng thử' : r.plan === 'yearly' ? 'Theo năm' : r.plan === 'forever' ? 'Vĩnh viễn' : (r.plan || '—');
              return (
                <tr key={r.id}>
                  <td style={{ padding: 8, borderBottom: '1px solid #eee' }}>
                    {(payload.modules || []).map((m) => (
                      <div key={m.app_code}>
                        <b>{m.app_code}</b> — {m.branches.map((b) => b.name).join(', ') || '(chi nhánh mặc định)'}
                      </div>
                    ))}
                  </td>
                  <td style={{ padding: 8, borderBottom: '1px solid #eee', color: statusColor, fontWeight: 600 }}>{statusLabel}</td>
                  <td style={{ padding: 8, borderBottom: '1px solid #eee' }}>{planLabel}</td>
                  <td style={{ padding: 8, borderBottom: '1px solid #eee', whiteSpace: 'nowrap' }}>
                    {new Date(r.requested_at).toLocaleString('vi-VN')}
                  </td>
                  <td style={{ padding: 8, borderBottom: '1px solid #eee' }}>{r.note || ''}</td>
                </tr>
              );
            })}
          </tbody>
        </table>
      )}

      <p style={{ marginTop: 20 }}>
        <Link href="/login" style={{ color: '#0d6efd' }}>← Về trang chủ</Link>
      </p>
    </div>
  );
}

const inputStyle: React.CSSProperties = {
  padding: '8px 10px', border: '1px solid #ccc', borderRadius: 6, fontSize: 14, flex: '1 1 150px',
};
const primaryBtn: React.CSSProperties = {
  padding: '10px 20px', background: '#0d6efd', color: '#fff', border: 'none', borderRadius: 8, cursor: 'pointer',
  fontSize: 15, fontWeight: 600,
};
const smallDangerBtn: React.CSSProperties = {
  background: '#f8d7da', border: 'none', color: '#842029', borderRadius: 4, cursor: 'pointer', padding: '4px 8px',
};
