# {{PROJECT_NAME}}

> Read `NOW.md` first, and rewrite it as the last act of any turn that changes state.

## What this folder is

{{One paragraph from start: the work, for whom, how often, and what a finished run produces.}}

## Check with the user first

{{From the user, in their words: the steps that stay with them and what needs their yes before it happens (for example sending, paying, posting, or changing a system of record). Ask if start did not cover it.}}

## Which source wins

{{One line per number or fact from start. The full table is `rules/source-of-truth.csv`.}}
When a source is missing or two disagree past the rule, write UNSURE, name the gap, and ask.

## How a run works

1. New material lands in `inbox/`. File it into `inputs/<period>/` with a clear name and leave filed inputs as they are. A screenshot belongs to the day it was taken; each fact in it keeps its own date.
2. Check `sources.md`: every source due this period is present, or the output says which is missing.
3. Search every place an item could live before calling it a mismatch.
4. For work that produces numbers, write them as data first (`outputs/<period>/numbers.csv`: metric, item, value, source_file, status), then write the prose from that file. Compare periods from the data.
5. Run the checks: {{the job's `<job>-checks` skill once the verifier builds it; until then, the tie-outs from start}}.

## Words

{{From start: the headline word and what counts, for example "revenue" always as contracted, billed, or collected.}}

## Skills

{{One line per skill this folder owns: name, what it does, where it is installed. Write "none yet" until make-a-skill adds one.}}
The master copy of each is `skills/<name>/SKILL.md` in this folder. After editing it, install it again; in a new tool, install it into that tool's personal skills first.

## Agents

Delegate crisp, independent work to the bundled agents; in a tool without agents, do the steps yourself.

## Learnings

`learnings.md` holds only lessons that changed a file or a rule, each naming what it changed. Open questions live in `NOW.md`.

## About the user

{{From start: role, what they care about, how they like to receive work.}}
