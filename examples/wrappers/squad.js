// squad.js <all|yoda|vader|luke|check> — komanda Star Wars Squad v TUI herdr.
// Mehkanika: workspace "Star Wars Squad" -> tab create -> agent start -> tab rename.
// Zhivost: herdr agent list (TUI). Dubley ne sozdaet. Author: K.ai (ZCode).
"use strict";
const { execFileSync } = require("child_process");
const path = require("path");

const WS_LABEL = "Star Wars Squad";
const ROOT = process.env.SQUAD_ROOT || process.cwd(); // ili zaday put v etoj stroke
const AGENTS = [
  { name: "yoda", kind: "hermes", dir: "agents\\yoda", tab: "Йода · Hermes" },
  { name: "vader", kind: "opencode", dir: "agents\\vader", tab: "Вейдер · OpenCode" },
  { name: "luke", kind: "codex", dir: "agents\\luke", tab: "Люк · Codex" },
];

function run(args) {
  try {
    return execFileSync("herdr", args, { encoding: "utf8", stdio: ["ignore", "pipe", "pipe"], timeout: 120000 });
  } catch (e) {
    return (e.stdout || "") + (e.stderr || "");
  }
}
function j(out) { try { return JSON.parse(out); } catch { return null; } }

function wsId() {
  const d = j(run(["workspace", "list"]));
  const list = d && d.result && d.result.workspaces || [];
  const hit = list.find((w) => w.label === WS_LABEL);
  if (hit) return hit.workspace_id;
  const c = j(run(["workspace", "create", "--label", WS_LABEL, "--cwd", ROOT]));
  return c && c.result && c.result.workspace ? c.result.workspace.workspace_id : null;
}

function agentsNow() {
  const d = j(run(["agent", "list"]));
  const list = d && d.result && d.result.agents || [];
  const map = {};
  for (const a of list) if (a.name) map[a.name] = a;
  return map;
}

function raise(a, ws) {
  const c = j(run(["tab", "create", "--workspace", ws, "--cwd", path.join(ROOT, a.dir)]));
  const pane = c && c.result && c.result.root_pane ? c.result.root_pane.pane_id : null;
  if (!pane) { console.log("[squad] " + a.name + ": tab create NE udalsya"); return 1; }
  const s = j(run(["agent", "start", a.name, "--kind", a.kind, "--pane", pane, "--timeout", "90000"]));
  const ok = s && s.result && s.result.agent;
  if (!ok) { console.log("[squad] " + a.name + ": agent start NE udalsya (sm. tab v TUI)"); return 1; }
  run(["tab", "rename", ok.tab_id, a.tab]);
  console.log("[squad] " + a.name + ": zapuschen (" + ok.agent_status + ", tab " + ok.tab_id + ")");
  return 0;
}

function check() {
  const now = agentsNow();
  for (const a of AGENTS) {
    const hit = now[a.name];
    console.log("[check] " + a.name + " (" + a.kind + "): " + (hit ? hit.agent_status + ", tab " + hit.tab_id : "NET v TUI"));
  }
  return 0;
}

const what = (process.argv[2] || "all").toLowerCase();
if (what === "check") process.exit(check());
const ws = wsId();
if (!ws) { console.log("[squad] Workspace ne nayden/sozdan"); process.exit(1); }
const now = agentsNow();
let rc = 0;
for (const a of AGENTS) {
  if (what !== "all" && what !== a.name) continue;
  if (now[a.name]) { console.log("[squad] " + a.name + ": uzhe rabotaet (" + now[a.name].agent_status + ", tab " + now[a.name].tab_id + ")"); continue; }
  rc = raise(a, ws) || rc;
}
console.log("[squad] Gotovo. Workspace: " + WS_LABEL);
process.exit(rc);
