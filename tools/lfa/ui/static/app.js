'use strict';

const $ = (id) => document.getElementById(id);

// ---------------------------------------------------------------- tabs
document.querySelectorAll('button.tab').forEach((b) => {
  b.onclick = () => {
    document.querySelectorAll('button.tab').forEach((x) => x.classList.toggle('active', x === b));
    document.querySelectorAll('.panel').forEach((p) => p.classList.toggle('active', p.id === `tab-${b.dataset.tab}`));
    if (b.dataset.tab === 'backup') loadBackups();
    if (b.dataset.tab === 'security') runSecurity();
  };
});

// ---------------------------------------------------------------- status
async function refreshStatus() {
  try {
    const oll = await (await fetch('/api/ollama')).json();
    setChip('st-ollama', oll.ok ? 'Ollama OK' : 'Ollama OFFLINE',
      oll.ok ? 'ok' : 'bad');
    if (!oll.ok) return;
    const net = oll.model_loaded ? `model nạp: ${oll.model}` : `model: ${oll.model}`;
    $('st-ollama').textContent = `${oll.ok ? '●' : '○'} ${net}`;
    const git = await (await fetch('/api/git')).json();
    $('st-git').textContent = `git: ${git.branch}`;
  } catch { setChip('st-ollama', 'API lỗi', 'bad'); }
}
function setChip(id, text, cls) {
  const el = $(id);
  el.textContent = text;
  el.className = `chip ${cls}`;
}

// ---------------------------------------------------------------- chat
async function postChat(prompt, autoFix) {
  setChip('st-net', 'Mạng: AIR-GAPPED', 'ok');
  const res = await fetch('/api/chat', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ prompt, auto_fix: autoFix, review_only: !autoFix }),
  });
  const { job_id } = await res.json();
  pollJob(job_id);
}

async function pollJob(jobId) {
  const logEl = $('chat-log');
  const resEl = $('chat-result');
  logEl.innerHTML = '';
  $('btn-chat').disabled = true;
  const seen = new Set();
  // eslint-disable-next-line no-constant-condition
  while (true) {
    const job = await (await fetch(`/api/chat/${jobId}`)).json();
    job.events.forEach((e) => { if (!seen.has(`${e.t}:${e.ts}:${e.msg || ''}`)) { seen.add(`${e.t}:${e.ts}:${e.msg || ''}`); appendEvent(logEl, e); } });
    if (job.status === 'done' || job.status === 'error') {
      renderResult(resEl, job.result);
      $('btn-chat').disabled = false;
      logEl.scrollTop = logEl.scrollHeight;
      return;
    }
    await new Promise((r) => setTimeout(r, 800));
  }
}

function appendEvent(el, e) {
  const div = document.createElement('div');
  const msg = e.msg || `${e.name || ''} ${e.detail || ''}` || JSON.stringify(e);
  div.className = e.t === 'error' ? 'err' : e.t === 'llm' ? 'llm' : e.t === 'patch' || e.t === 'backup' || e.t === 'rollback' ? 'ok' : 'info';
  div.textContent = msg;
  el.appendChild(div);
}

function renderResult(el, r) {
  if (!r) { el.textContent = '(không có kết quả)'; return; }
  if (r.status === 'error') { el.innerHTML = `<pre class="err">LỖI: ${esc(r.error)}</pre>`; return; }
  let h = `<h3>Trạng thái: ${esc(r.status)}</h3>`;
  h += `<pre>${esc(r.summary || r.llm_reply || '')}</pre>`;
  if (r.backup_point) h += `<p class="ok">Backup: ${esc(r.backup_point.id)}</p>`;
  if (r.failures) h += `<p class="fail">${esc(r.failures.join('; '))}</p>`;
  if (r.edited_files && r.edited_files.length) h += `<p>Các file đã sửa: <b>${esc(r.edited_files.join(', '))}</b></p>`;
  if (r.plan) h += `<pre>PLAN:\n${esc(JSON.stringify(r.plan, null, 2))}</pre>`;
  [['analyze', r.analyze], ['test', r.test]].forEach(([k, v]) => {
    if (v) h += `<pre>${k.toUpperCase()}: code=${v.code}, ${v.issues && v.issues.length} issues, ${v.duration_sec}s</pre>`;
  });
  el.innerHTML = h;
}

$('btn-chat').onclick = () => {
  const p = $('prompt').value.trim();
  if (!p) return;
  postChat(p, $('auto-fix').checked);
};

// ---------------------------------------------------------------- review
$('btn-review').onclick = async () => {
  const path = $('rev-path').value.trim() || '(theo git diff)';
  await postChat(`Hãy REVIEW code (không sửa): ${path}. Chỉ đọc/phân tích và nêu điểm yếu + cách xử lý.`, false);
};

// ---------------------------------------------------------------- analyzer
async function runAnalyzer(kind, opts = {}) {
  const out = $('ana-output');
  out.textContent = 'Đang chạy ...';
  const res = await (await fetch('/api/analyze', {
    method: 'POST', headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ kind, ...opts }),
  })).json();
  out.textContent = `${res.cmd.join(' ')}  →  code=${res.code} (${res.duration_sec}s)\n` +
    `${res.issues.length} issues\n\n${res.output}`;
}
$('btn-ana-dart').onclick = () => runAnalyzer('dart', { scope: 'lib test' });
$('btn-ana-flutter').onclick = () => runAnalyzer('flutter');
$('btn-ana-test').onclick = () => runAnalyzer('test');

// ---------------------------------------------------------------- backups
async function loadBackups() {
  const res = await (await fetch('/api/backups')).json();
  const body = $('bk-body');
  body.innerHTML = '';
  $('bk-note').textContent = `${res.points.length} point (retention 30)`;
  res.points.forEach((p) => {
    const tr = document.createElement('tr');
    tr.innerHTML =
      `<td class="pass">${esc(p.id)}</td><td>${esc(p.at)}</td><td>${esc(p.request || '')}</td>` +
      `<td class="skip">${esc(p.git_sha || '—')}</td><td>${esc(p.status)}</td>` +
      `<td><button class="secondary" data-id="${esc(p.id)}" data-confirm="Rollback về ${esc(p.id)}?">Rollback</button></td>`;
    body.appendChild(tr);
  });
  body.querySelectorAll('button').forEach((b) => {
    b.onclick = async () => {
      if (!confirm(b.dataset.confirm)) return;
      const r = await (await fetch('/api/backups/rollback', {
        method: 'POST', headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ point_id: b.dataset.id }),
      })).json();
      alert(JSON.stringify(r));
      loadBackups();
    };
  });
}
$('btn-backup').onclick = async () => {
  const r = await (await fetch('/api/backups', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ label: 'thủ công' }) })).json();
  alert(`Backup: ${r.point.id}`);
  loadBackups();
};

// ---------------------------------------------------------------- security
async function runSecurity() {
  const tbody = $('sec-body');
  tbody.innerHTML = '<tr><td colspan="3">Đang kiểm tra...</td></tr>';
  const res = await (await fetch('/api/security')).json();
  tbody.innerHTML = '';
  res.checks.forEach((c) => {
    const cls = c.ok === true ? 'pass' : c.ok === false ? 'fail' : 'skip';
    const label = c.ok === true ? 'PASS' : c.ok === false ? 'FAIL' : 'SKIP';
    const tr = document.createElement('tr');
    tr.innerHTML = `<td>${esc(c.name)}</td><td class="${cls}">${label}</td><td>${esc(c.detail || '')}</td>`;
    tbody.appendChild(tr);
  });
}
$('btn-sec').onclick = runSecurity;
$('btn-sec-lock').onclick = async () => {
  try {
    const r = await fetch('/api/lockdown', { method: 'POST' });
    const j = await r.json();
    alert((j.out || '') + '\n' + (j.err || ''));
  } catch { alert('Không thể chạy lockdown từ UI — hãy mở scripts/lockdown.ps1 bằng PowerShell Admin.'); }
};
$('btn-cli').onclick = () => {
  alert('Cách chạy nhanh từ terminal (thu mục tools\\lfa):\n\n' +
    '.venv\\Scripts\\python -m agent.cli status\n' +
    '.venv\\Scripts\\python -m agent.cli check\n' +
    '.venv\\Scripts\\python -m agent.cli chat "fix lỗi ..."\n' +
    '.venv\\Scripts\\python -m agent.cli backup --label manual');
};

function esc(s) { return String(s ?? '').replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c])); }

// boot
refreshStatus();
setInterval(refreshStatus, 15000);