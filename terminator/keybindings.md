# Terminator window keys

`borderless = True` is set, so there is no titlebar: no drag bar, no close
button, no double-click to maximise. These do that work instead.

GNOME bindings below were read from this machine's own `gsettings`
(`org.gnome.desktop.wm.keybindings` and `.preferences`), Terminator's from its
defaults in `/usr/share/terminator/terminatorlib/config.py` — the
`[keybindings]` section of `terminator/config` is empty, so the defaults apply.

## Move and resize the window — GNOME

| Do | Key |
|---|---|
| Move | `Super` + drag, anywhere in the window |
| Move, keyboard | `Alt`+`F7`, then arrows — `Enter` confirms, `Esc` cancels |
| Resize | `Super` + **middle**-drag, from near the edge you want to move |
| Resize, keyboard | `Alt`+`F8`, then arrows — `Enter` / `Esc` as above |

`mouse-button-modifier` is `<Super>` and `resize-with-right-button` is `false`,
which is why resize is the middle button. Swap it to the right button with
`gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true`.

## Maximise, monitors, close — GNOME

| Do | Key |
|---|---|
| Maximise | `Ctrl`+`Super`+`Up` |
| Unmaximise | `Ctrl`+`Super`+`Down` |
| Toggle maximise | `Ctrl`+`Alt`+`KP_5` (numpad 5) |
| Send to next monitor | `Super`+`Shift`+`Left` / `Right` |
| Close window | `Alt`+`F4` |

Half-screen snap (`Super`+`Left`/`Right`) is untested: those two keys read back
empty here rather than with a value, so it may or may not be bound.

## Terminator's own

| Do | Key |
|---|---|
| Fullscreen | `F11` — GNOME's own `toggle-fullscreen` is `disabled`, so this is Terminator's |
| New tab | `Ctrl`+`Shift`+`T` |
| Split left/right | `Ctrl`+`Shift`+`E` |
| Split top/bottom | `Ctrl`+`Shift`+`O` |
| Resize the split | `Ctrl`+`Shift`+ arrows |
| Next / previous tab | `Ctrl`+`PageDown` / `Ctrl`+`PageUp` |
| Close terminal | `Ctrl`+`Shift`+`W` |
| Quit Terminator | `Ctrl`+`Shift`+`Q` |
| Font bigger / smaller / reset | `Ctrl`+`+` / `Ctrl`+`-` / `Ctrl`+`0` |

Panes have no draggable handle either — `handle_size = 0` and the separators are
collapsed in `terminator/terminator.css` — so `Ctrl`+`Shift`+arrows is the only
way to resize a split.
