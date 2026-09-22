# skill-audit: Leonxlnx/taste-skill @ 5217fb4 (2026-09-20)

Verdict: **Install with changes**
Why: Nothing in the repository executes on install, reaches the network, or reads secrets. Two Medium items: an agent-instruction file outside the skills folder (`.github/copilot-instructions.md`) that changes Copilot's behavior for the whole repo it lands in, and instructions that tell the agent to run package installs (`npm install …`, `npx shadcn@latest …`) as part of normal use. Install the skill folder only; do not vendor the whole repository into a project.

## What it does (from SKILL.md)
A frontend design skill for landing pages, portfolios and redesigns. The agent reads the brief, picks "design dials" (variance / motion / density), maps the brief to a real design system when one fits, and ships UI that does not look templated. — `skills/taste-skill/SKILL.md:1-8`
- 13 skills in one repo (taste-skill, v1, gpt-taste, image-to-code, imagegen ×2, brandkit, redesign, soft, output, minimalist, brutalist, stitch). — `skills/llms.txt`
- Tells the agent to check `package.json` and **output an install command** before importing any library. — `SKILL.md:157`
- Tells the agent to **install the official design-system package** when the brief matches one (Fluent, Material, Atlassian, shadcn, Primer, GOV.UK…). — `SKILL.md:102`, Appendix A `SKILL.md:987-1016`
- Bans `window.addEventListener('scroll')`, hand-drawn SVG icons, generic step labels, and a list of "AI tells". — `SKILL.md:143, 563, 664`
- Scope statement: "Not dashboards, not data tables, not multi-step product UI." — `SKILL.md:8`

## What it runs
| Where | Command / script | Writes to | Notes |
|---|---|---|---|
| `skill.sh` | bash; prints a path from a lookup table | nothing | Convenience only. Not invoked by any skill |
| `scripts/*.mjs` (4) | Node; imports `fs`, `path`, `sharp` | files under `assets/` | Maintainer tooling for README images. Not referenced by any SKILL.md |
| (agent, at use time) | `npm install …`, `npx shadcn@latest init/add …` | project `package.json`, `node_modules` | Instructed, not scripted. Pulls packages from npm at the versions npm resolves (unpinned) |

## Network
| Host | Used by | Purpose stated? | Pinned? |
|---|---|---|---|
| github.com, developer.mozilla.org, ui.shadcn.com, tailwindcss.com, m3.material.io, learn.microsoft.com, primer.style, radix-ui.com, shopify.dev … | SKILL.md doc links | yes (reference docs) | n/a — links, not fetched |
| picsum.photos | SKILL.md (placeholder images in generated code) | yes | n/a |
| gcdn.moonshot.cn, kimi-file.moonshot.cn, api.star-history.com, fluxionai.world (with `?promo=` tracking), animations.dev, img.ly, sent.dm, interfaces.dev, reactbits.dev, vercel.com | README.md sponsor images and links | sponsorship, yes | n/a — loaded only when the README is rendered on GitHub |

No script in the repository makes a network call. No telemetry.

## Data it reaches
None. No env vars read, no dotfiles, no files outside the project. The single "api_key" hit is a commented-out Shopify snippet in the appendix (`SKILL.md:1029`).

## Findings (by severity)
[Medium] `.github/copilot-instructions.md:3` — a repo-level Copilot instruction file that rewrites Copilot's global behavior ("Copilot automatically reads this file to set its global behavior"). If you copy the whole repo into a project, Copilot follows it for that entire project, not just for design work. — `"By including this in the .github folder, Copilot stops writing generic 'slop' code and adheres to the premium Taste Skill standards."`
[Medium] `skills/taste-skill/SKILL.md:102, 157, 987-1016` — the agent is told to install npm packages as part of normal use, unpinned (`npx shadcn@latest`). Each install is a supply-chain decision made by the agent. — `"if the brief reads as one of the systems above, install and use the official package"`
[Low] `README.md:29-30` — sponsor links carry campaign/promo parameters (`fluxionai.world/register?source=github&campaign=tasteskill&promo=TASTESKILL`). Harmless unless clicked; noted because it is affiliate-style tracking inside an "open-source skill" README.
[Low] `.claude-plugin/plugin.json` — `author.email` is empty; `homepage`/`repository` use lowercase `leonxlnx` while the actual owner is `Leonxlnx`. Cosmetic.
[Low] Repository size: 3.4 MB, of which ~3.2 MB is images (`assets/`, `examples/`). Installing via `npx skills add` typically copies only the skill folder, so this only matters if you clone.

## Claims vs files
README claims "one install, works with every agent" — matches: skills are plain SKILL.md files, no runtime. README does not mention the Copilot instruction file, which is the only piece that acts outside the skills folder. Everything else matches.

## Not read
`examples/*.webp`, `assets/*` (images; sizes listed, contents not inspected). Everything textual was read. Static reading only; nothing was executed.
