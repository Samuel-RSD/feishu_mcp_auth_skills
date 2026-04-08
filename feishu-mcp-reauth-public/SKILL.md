---
name: feishu-mcp-reauth-public
description: Automate Feishu MCP reauthorization for open.feishu.cn/page/mcp links. Use when the user needs to click 重新授权, complete the 授权 dialog, verify the temporary success state, and confirm the expiry date refreshes correctly. Public-safe edition with no personal auth state or local private paths.
---

# Feishu MCP Reauthorization (Public Edition)

Use this skill to automate Feishu MCP reauthorization flows for MCP pages under `open.feishu.cn/page/mcp/...`.

## What This Skill Does

1. Open the target Feishu MCP page.
2. Wait for `重新授权`.
3. Click `重新授权`.
4. Wait for the Feishu authorization dialog.
5. Click `授权`.
6. Wait for the temporary `重新授权成功` state.
7. Confirm the page returns to the MCP config view.
8. Confirm the expiry date matches `today + 7 days`.

## Notes

- This public edition intentionally excludes any personal browser session, cookies, auth state, screenshots, logs, and run history.
- You must create your own local browser auth state before running headless mode.
- Replace any local Python path with your own environment path.

## Recommended Layout

- `scripts/run_feishu_mcp_reauth.py`
- `flows/feishu_mcp_reauth.json`
- optional local-only `state/` directory (not committed)

## Typical Command

```bash
python scripts/run_feishu_mcp_reauth.py --url https://open.feishu.cn/page/mcp/XXXXXXXXXXXX
```

## Headed First Run

```bash
python scripts/run_feishu_mcp_reauth.py --headed --url https://open.feishu.cn/page/mcp/XXXXXXXXXXXX
```

Use the headed run once to log in manually and save your own local browser state. Do not commit that state file.
