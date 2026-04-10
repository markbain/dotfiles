# Dictation (nerd-dictation push-to-talk)

Toggle-based push-to-talk dictation for X11/GNOME using [nerd-dictation](https://github.com/ideasman42/nerd-dictation) (VOSK speech recognition).

**Press Pause** to start recording. **Press Pause again** to stop and type the recognised text into the window that was focused when you started.

## How it works

- `nerd-dictation` runs continuously in the background, suspended until needed
- `xbindkeys` binds the Pause key to `nerd-ptt.sh`
- On first press: saves the active window ID, sends `SIGCONT` to wake nerd-dictation
- On second press: sends `SIGUSR1` to finalise and output the text
- A custom `~/bin/xdotool` wrapper intercepts the typing call and targets the saved window ID, so text always goes to the window where dictation was started

## Files

| File | Purpose |
|------|---------|
| `nerd-ptt.sh` | Pause key handler (toggle on/off) |
| `nerd-dictation-start.sh` | Starts nerd-dictation at login |
| `xbindkeys-start.sh` | Starts xbindkeys at login |
| `bin/xdotool` | Wrapper to target typing at the correct window |
| `xbindkeysrc` | xbindkeys config (binds Pause key) |
| `autostart/` | GNOME autostart desktop entries |

## Setup on a new machine

1. Run `~/.dotfiles/setup` — installs `xbindkeys`, `xdotool`, `nerd-dictation`, and downloads the VOSK small English model
2. Run `~/.dotfiles/symlinks` — creates all symlinks

Then log out and back in (or start the two autostart scripts manually).

## Known issues

**Switching contexts between presses:** Text is typed into the window that was active on the *first* press, not the second. If you switch windows mid-dictation it will work correctly, but the window refocus may be briefly visible.

**Missing spaces between sessions:** When you stop dictation and start again, no space is inserted before the new text. If your cursor is mid-sentence you will need to add a space manually before pressing Pause.

## Model

Uses the VOSK small English model (`vosk-model-small-en-us-0.15`). Accuracy is reasonable for everyday use. For better accuracy, replace `~/.config/nerd-dictation/model/` with a larger VOSK model from https://alphacephei.com/vosk/models — no other changes needed.
