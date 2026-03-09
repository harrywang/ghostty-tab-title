---
name: tab-title
description: Set the Ghostty terminal tab title based on the current conversation context. Use when the user wants to rename or label their terminal tab, or asks to set the tab title.
---

# Ghostty Tab Title

Set your Ghostty terminal tab title to reflect what you're working on in the current session.

## How it works

When invoked, this skill:

1. Summarizes the current conversation context in 3-6 words
2. Uses Ghostty's AppleScript API to set the tab title programmatically
3. The title persists even when the terminal application normally overrides it

## Title format

`<folder-name>: <context>`

Where `folder-name` is the basename of the current working directory.

Examples:
- `paperfox: Fix auth bug in proxy`
- `myapp: Add Stripe webhooks`
- `dotfiles: Refactor zsh config`

## Instructions

When the user invokes `/tab-title`, summarize what the current session is about in 3-6 words.

Then run this bash command to set the Ghostty tab title, replacing TITLE with the formatted title:

```bash
osascript -e '
tell application "Ghostty"
    set t to selected tab of front window
    set term to focused terminal of t
    perform action "prompt_tab_title" on term
end tell
delay 0.3
tell application "System Events"
    tell process "Ghostty"
        set theSheet to sheet 1 of front window
        set value of text field 1 of theSheet to "TITLE"
        delay 0.1
        click button "OK" of theSheet
    end tell
end tell'
```

After running, confirm the title was set.

## Requirements

- **macOS only** — uses AppleScript and System Events
- **Ghostty 1.3+** — requires AppleScript support (added in Ghostty 1.3)
- **Accessibility permissions** — System Events needs accessibility access to interact with Ghostty's UI
