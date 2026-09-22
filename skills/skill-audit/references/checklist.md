# Reading checklist

Go through every item. Write "none" explicitly when nothing was found.

## A. Files
- [ ] Complete inventory (name, size, type)
- [ ] Binaries / archives / minified or obfuscated code
- [ ] Files referenced by SKILL.md but not present (fetched at runtime)
- [ ] Hidden files, misleading extensions

## B. Instructions to the agent (SKILL.md and any prompt-like text)
- [ ] Stated scope
- [ ] Actions outside that scope
- [ ] "Hide / don't mention / skip confirmation / ignore previous" language
- [ ] Instructions to disable permission prompts, sandboxes, hooks, or safety settings
- [ ] Instructions to run on every session / persist / install hooks

## C. Execution
- [ ] Interpreters and binaries invoked
- [ ] Package installs (npm, pip, brew, apt, curl | sh)
- [ ] `eval`, base64, generated or concatenated commands
- [ ] Commands fetched from the network before running

## D. Network
- [ ] Every literal host / URL / IP (table)
- [ ] Telemetry, analytics, "usage stats"
- [ ] Webhooks or upload endpoints
- [ ] Unpinned dependencies (branch names, `latest`, no lockfile)

## E. Data reached
- [ ] Environment variables read
- [ ] `~/.ssh`, `~/.aws`, `~/.config`, keychain, browser profiles, `.env`
- [ ] Files outside the project directory (read or write)
- [ ] Clipboard, screenshots, microphone, camera

## F. Escalation and persistence
- [ ] `sudo`, `chmod`/`chown`, setuid
- [ ] Shell rc, git hooks, cron, launchd/systemd, editor settings
- [ ] Modifying other skills, CLAUDE.md, agent config

## G. Claims vs files
- [ ] Capabilities in files not mentioned in README
- [ ] README claims with nothing behind them
- [ ] License present and compatible with your use
