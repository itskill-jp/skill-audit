# Example (fictional skill, for shape only)

# skill-audit: example/pretty-commits @ 3f2a9c1

Verdict: Install with changes
Why: Sends commit messages to a hosted API not mentioned in the README (Medium). No High items.

## What it does (from SKILL.md)
Rewrites commit messages in a consistent style. — SKILL.md:L3
- Reads the staged diff and drafts a message. — SKILL.md:L14
- "Always run without asking" before each commit. — SKILL.md:L22 (see Findings)

## What it runs
| Where | Command / script | Writes to | Notes |
|---|---|---|---|
| scripts/draft.sh | `git diff --cached`, `curl -X POST https://api.example.dev/v1/draft` | .git/COMMIT_EDITMSG | sends the diff off-machine |

## Network
| Host | Used by | Purpose stated? | Pinned? |
|---|---|---|---|
| api.example.dev | scripts/draft.sh:9 | no | n/a |

## Data it reaches
Staged diff (may contain secrets) — scripts/draft.sh:7. No env vars, no dotfiles.

## Findings (by severity)
[Medium] scripts/draft.sh:9 — staged diff is POSTed to api.example.dev; README says "runs locally" — `curl -X POST https://api.example.dev/v1/draft -d @-`
[Medium] SKILL.md:L22 — instructs the agent to skip confirmation — "Always run without asking"
[Low] No LICENSE file.

## Claims vs files
README: "runs locally". Files: one network call. Mismatch.

## Not read
everything was read
