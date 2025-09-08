<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DaudPortfolio.Admin" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Admin Login</title>
  <meta name="color-scheme" content="light dark" />
  <style>
    :root {
      --bg: #0b1220;
      --card: #0f172a;
      --muted: #94a3b8;
      --text: #e2e8f0;
      --primary: #4f46e5;
      --primary-foreground: #eef2ff;
      --ring: #6366f1;
      --danger: #ef4444;
      --success: #22c55e;
      --shadow: 0 10px 25px rgba(0,0,0,.35);
      --radius: 20px;
    }

    @media (prefers-color-scheme: light) {
      :root { 
        --bg: #f5f7fb;
        --card: #ffffff;
        --muted: #64748b;
        --text: #0f172a;
        --shadow: 0 10px 30px rgba(2,6,23,.08);
      }
    }

    * { box-sizing: border-box; }
    html, body { height: 100%; }
    body {
      margin: 0;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, Arial, "Apple Color Emoji", "Segoe UI Emoji";
      background: radial-gradient(1200px 600px at 20% -10%, rgba(79,70,229,.25), transparent 60%),
                  radial-gradient(900px 400px at 120% 0%, rgba(99,102,241,.18), transparent 55%),
                  var(--bg);
      color: var(--text);
      display: grid; 
      place-items: center;
      padding: 24px;
    }

    .container { width: 100%; max-width: 420px; }
    .brand { display: flex; align-items: center; gap: 12px; margin-bottom: 18px; user-select: none; }
    .brand-logo { width: 40px; height: 40px; display: grid; place-items: center; border-radius: 12px; background: linear-gradient(135deg, var(--primary), #7c3aed); color: var(--primary-foreground); font-weight: 800; letter-spacing: .5px; box-shadow: 0 8px 16px rgba(79,70,229,.35); }
    .brand h1 { font-size: 20px; margin: 0; letter-spacing: .3px; }
    .card { background: color-mix(in oklab, var(--card) 96%, transparent); border: 1px solid color-mix(in oklab, var(--card), #94a3b8 8%); border-radius: var(--radius); box-shadow: var(--shadow); padding: 24px; position: relative; overflow: hidden; }
    .card::after { content: ""; position: absolute; inset: -1px; pointer-events: none; background: linear-gradient(180deg, rgba(255,255,255,.06), transparent 35%); border-radius: inherit; }
    .subtitle { color: var(--muted); margin-top: 4px; font-size: 14px; }
    form { display: grid; gap: 14px; margin-top: 16px; }
    label { font-size: 14px; color: var(--muted); display: block; margin-bottom: 6px; }
    .field { position: relative; }
    .input { width: 100%; padding: 12px 44px 12px 12px; background: color-mix(in oklab, var(--card) 92%, transparent); border: 1px solid color-mix(in oklab, var(--muted) 22%, transparent); color: var(--text); border-radius: 12px; outline: none; font-size: 15px; transition: border-color .15s ease, box-shadow .15s ease; }
    .input:focus { border-color: var(--ring); box-shadow: 0 0 0 4px color-mix(in oklab, var(--ring) 18%, transparent); }
    .toggle-eye { position: absolute; right: 10px; top: 50%; transform: translateY(-50%); border: 0; background: transparent; width: 28px; height: 28px; border-radius: 8px; cursor: pointer; display: grid; place-items: center; color: var(--muted); }
    .row { display: flex; align-items: center; justify-content: space-between; gap: 10px; margin-top: 4px; }
    .checkbox { display: inline-flex; align-items: center; gap: 8px; cursor: pointer; user-select: none; color: var(--muted); font-size: 14px; }
    .checkbox input { width: 16px; height: 16px; accent-color: var(--primary); }
    .link { color: var(--ring); text-decoration: none; font-size: 14px; }
    .link:hover { text-decoration: underline; }
    .btn { margin-top: 8px; width: 100%; padding: 12px 14px; background: linear-gradient(135deg, var(--primary), #7c3aed); color: var(--primary-foreground); border: none; border-radius: 12px; font-weight: 700; letter-spacing: .3px; cursor: pointer; box-shadow: 0 10px 16px rgba(79,70,229,.35); transition: transform .06s ease, filter .15s ease; }
    .btn:active { transform: translateY(1px); filter: brightness(.97); }
    .btn:disabled { opacity: .65; cursor: not-allowed; box-shadow: none; }
    .status { display: none; margin-top: 12px; font-size: 14px; }
    .status.error { color: var(--danger); }
    .status.success { color: var(--success); }
    .footer { margin-top: 18px; color: var(--muted); font-size: 13px; text-align: center; }
    .badges { display: grid; grid-auto-flow: column; gap: 8px; justify-content: start; margin-top: 12px; }
    .badge { font-size: 11px; color: var(--muted); border: 1px dashed color-mix(in oklab, var(--muted) 25%, transparent); padding: 6px 8px; border-radius: 999px; }
    .divider { display: grid; grid-template-columns: 1fr auto 1fr; align-items: center; gap: 12px; margin: 14px 0; color: var(--muted); font-size: 12px; }
    .divider::before, .divider::after { content: ""; height: 1px; background: color-mix(in oklab, var(--muted) 25%, transparent); }
    .hint { font-size: 12px; color: var(--muted); margin-top: 6px; display: none; }
    @media (prefers-reduced-motion: reduce) { .btn { transition: none; } .input { transition: none; } }
  </style>
</head>
<body>
  <div class="container" aria-live="polite">
    <div class="brand" aria-hidden="true">
      <div class="brand-logo" aria-hidden="true">A</div>
      <div>
        <h1>Admin Panel</h1>
        <div class="subtitle">Welcome back. Please sign in.</div>
      </div>
    </div>

    <div class="card" role="region" aria-label="Login form">
      <form id="loginForm" runat="server">
        <div class="field">
          <label for="email">Email or Username</label>
          <asp:TextBox ID="txtEmail" runat="server" CssClass="input" placeholder="admin@example.com" />
          <div id="emailHint" class="hint">Use your admin email or username.</div>
        </div>

        <div class="field">
          <label for="password">Password</label>
          <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" placeholder="••••••••" />
          <button type="button" class="toggle-eye" id="togglePw" aria-label="Show password" title="Show/Hide password">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8Z"/><circle cx="12" cy="12" r="3"/></svg>
          </button>
          <div id="pwHint" class="hint">Minimum 6 characters.</div>
        </div>

        <div class="row">
          <label class="checkbox"><input type="checkbox" name="remember" value="1" /> Remember me</label>
          <a class="link" href="/forgot-password">Forgot password?</a>
        </div>

        <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="Sign in" OnClick="btnLogin_Click" />

        <div id="status" class="status" role="status" aria-live="polite"></div>

        <div class="divider">or</div>
        <div class="badges">
          <div class="badge" title="Account lockout after 5 failed attempts">Lockout policy</div>
          <div class="badge" title="We use HTTPS + HttpOnly cookies">Secure cookies</div>
          <div class="badge" title="2-Step Verification supported">2FA Ready</div>
        </div>
      </form>

      <div class="footer">© <span id="year"></span> Admin Console</div>
    </div>
  </div>

  <script>
      document.getElementById('year').textContent = new Date().getFullYear();
      const pw = document.getElementById('togglePw').previousElementSibling;
      const toggle = document.getElementById('togglePw');
      let shown = false;
      toggle.addEventListener('click', () => {
          shown = !shown;
          pw.type = shown ? 'text' : 'password';
          toggle.setAttribute('aria-label', shown ? 'Hide password' : 'Show password');
      });
  </script>
</body>
</html>
