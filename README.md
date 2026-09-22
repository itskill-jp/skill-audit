# skill-audit

**Read a skill before you install it.**

`npx skills add someone/some-skill` is one line. It is also one line that drops
someone else's instructions and scripts into your coding agent. This skill makes
your agent read a skill *before* installing it and report, in plain language:

- what the skill tells the agent to do (and whether any of it is out of scope),
- every script or command it can run,
- every network call it can make and where to,
- what it asks for (secrets, tokens, sudo, write access outside the project),
- whether the published files match what the README claims.

It never installs, runs, or modifies the skill under review.

## Install

```
npx skills add itskill-jp/skill-audit
```

Works with any agent that reads `SKILL.md` files (Claude Code, Codex, Cursor, Gemini CLI, OpenCode, …).

## Use

Point your agent at a skill you are thinking about installing:

```
Audit the skill at https://github.com/Leonxlnx/taste-skill before I install it.
```

or a local folder:

```
Audit ./downloads/some-skill
```

You get a one-page report with a verdict: **Install / Install with changes / Do not install**.
See [`skills/skill-audit/references/report_format.md`](skills/skill-audit/references/report_format.md) for the exact shape.

## Example reports

See [`reports/`](reports/) — real audits of public skills, in the shape this skill produces.

## Why this exists

I write software for a living, alone, in Japan. In 2026 I wrote up a case where a
`git pull` and `npm run build` were enough to get infected, through a forged merge
commit that edited a build config. Skills are the same shape of risk with a friendlier
name: text and scripts that your agent executes with your permissions. Reading them
first costs two minutes.

## What it will not do

- It does not run the skill in a sandbox. Static reading only. Use a throwaway VM for dynamic checks.
- It does not judge whether a skill is *good*. It reports what the skill *does*.
- It is not a security certification. A clean report means "nothing found by reading", not "safe".

## License

MIT. Use it, fork it, ship it with your own skills.

---

Made by [IT.Skill](https://it-skill.jp/en/) — solo full-stack developer in Japan.
Fixed-price prototypes, read-only system check-ups, and overnight development for agencies.
If you want the same "will it break, can we roll it back, can someone else take it over"
reading applied to your own code before release, that's the paid
[Ship-Solo Review](https://it-skill.jp/skills/ship-solo-review/) skill.
