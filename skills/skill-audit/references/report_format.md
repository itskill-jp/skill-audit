# Report format

```
# skill-audit: <owner/name> @ <commit or tag>

Verdict: Install / Install with changes / Do not install
Why (1–2 lines):

## What it does (from SKILL.md)
<scope in one paragraph, then bullet list of instructions, each with "— SKILL.md:L12">

## What it runs
| Where | Command / script | Writes to | Notes |
|---|---|---|---|

## Network
| Host | Used by | Purpose stated? | Pinned? |
|---|---|---|---|
(none)

## Data it reaches
<env vars, files outside the project, secrets — with file:line, or "none">

## Findings (by severity)
[High] <file:line> — <what happens> — <quoted line>
[Medium] …
[Low] …

## Claims vs files
<mismatches, or "README matches files">

## Not read
<files or sections that could not be obtained, or "everything was read">
```

Keep it to one screen. A reader should be able to decide in 30 seconds and verify any line in 2 minutes.
