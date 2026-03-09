---
name: tab-title
description: Set the Ghostty terminal tab title based on the current conversation context. Use when the user wants to rename or label their terminal tab, or asks to set the tab title.
---

# Ghostty Tab Title

Set your Ghostty terminal tab title to reflect what you're working on.

## Instructions

When the user invokes `/tab-title`, summarize the current session in 3-6 words.

**Title format:** `<folder-name>: <context>` where folder-name is the basename of the current working directory.

Examples:
- `paperfox: Fix auth bug in proxy`
- `myapp: Add Stripe webhooks`
- `dotfiles: Refactor zsh config`

Then run the bundled script to set the title:

```bash
bash "${CLAUDE_SKILL_DIR}/scripts/set-title.sh" "TITLE"
```

Replace TITLE with the formatted title. After running, confirm the title was set.

## Requirements

- **macOS only** — uses AppleScript and System Events
- **Ghostty 1.3+** — requires AppleScript support
- **Accessibility permissions** — System Events needs accessibility access
