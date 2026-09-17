# {{PROJECT_NAME}}

> Read this first. It tells any AI agent, in any session, how to work in this folder.
> Keep it short. For each line, ask: would removing it cause a mistake? If not, cut it.
> New to working this way? The official guide: https://code.claude.com/docs/en/common-workflows

## What this folder is

{{One paragraph from the start interview: what work happens here, for whom, on what cadence, and what a finished run produces.}}

## How to work here

- Keep the folder organized per `index.md`, and update `index.md` whenever files are added or moved.
- Source files the user gives you go in `inputs/`, finished work in `outputs/`, plans and handoffs in `plans/`. Treat `inputs/` as read-only.
- Match the format of the example in `reference/` for recurring outputs.
- Work in a copy, never on the live or shared file.
- Before big or ambiguous work, make a plan first and confirm it with the user. You get step one and step ten from the user; the plan is the nine in between.

## File naming

{{The convention for this folder, e.g. date-prefix everything: 2026-08_subject.md. State it once here so every agent follows it.}}

## How to validate a run

{{From the start interview's "what good looks like": the checks that prove a run is correct, the totals that must tie out, the prior output to compare against, and the judgment calls a human signs off on.}}

## Agents

- Delegate to the bundled agents: researcher for gathering, indexer for the catalog, designer for anything visual. They run on Sonnet.
- Use one to three agents at most; do not over-delegate. If you are confused about the work, ask the user instead of delegating.

## Learnings

`learnings.md` is written by the learn skill, not by hand. It captures a rule only when the rule would change the next run, with the evidence for it. The work teaches the folder, and over time those rules become the skills that live in `skills/`.

## About the user

{{From the start interview: role, what they care about, how they like to receive work.}}
