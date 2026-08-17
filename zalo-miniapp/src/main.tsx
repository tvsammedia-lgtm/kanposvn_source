import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './style.css';

function mount() {
  let root = document.getElementById('app');
  if (!root) {
    root = document.createElement('div');
    root.id = 'app';
    document.body.appendChild(root);
  }

  const errorEl = document.createElement('div');
  errorEl.style.cssText = 'color:red;padding:16px;font-family:monospace;white-space:pre-wrap;word-break:break-all;';

  window.addEventListener('error', (e) => {
    errorEl.textContent += 'ERROR: ' + e.message + '\n' + e.filename + ':' + e.lineno + '\n';
    if (!root!.contains(errorEl)) root!.appendChild(errorEl);
  });

  window.addEventListener('unhandledrejection', (e) => {
    errorEl.textContent += 'PROMISE ERROR: ' + String(e.reason) + '\n';
    if (!root!.contains(errorEl)) root!.appendChild(errorEl);
  });

  try {
    ReactDOM.createRoot(root).render(
      <React.StrictMode>
        <App />
      </React.StrictMode>,
    );
  } catch (e: any) {
    errorEl.textContent += 'RENDER ERROR: ' + String(e) + '\n';
    root!.appendChild(errorEl);
  }
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', mount);
} else {
  mount();
}
