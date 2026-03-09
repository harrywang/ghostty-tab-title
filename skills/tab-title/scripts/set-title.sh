#!/bin/bash
# Set Ghostty tab title via AppleScript
# Usage: set-title.sh "My Title"
# Requires: macOS, Ghostty 1.3+, Accessibility permissions for System Events

TITLE="${1:?Usage: set-title.sh \"title\"}"

osascript -e "
tell application \"Ghostty\"
    set t to selected tab of front window
    set term to focused terminal of t
    perform action \"prompt_tab_title\" on term
end tell
delay 0.3
tell application \"System Events\"
    tell process \"Ghostty\"
        set theSheet to sheet 1 of front window
        set value of text field 1 of theSheet to \"$TITLE\"
        delay 0.1
        click button \"OK\" of theSheet
    end tell
end tell"
