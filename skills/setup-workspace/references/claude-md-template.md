# {{PROJECT_NAME}}

> Read this first. It tells any AI agent, in any session, how to work in this folder.
> Keep this file short. For each line, ask: would removing it cause mistakes? If not, cut it.
> New to working this way? The official guide: https://code.claude.com/docs/en/common-workflows

## What this folder is

{{One paragraph from the setup interview: what work happens here, for whom, on what cadence.}}

## How to work here

- Keep the folder organized per `index.md`, and update `index.md` whenever files are added or moved.
- Source files the user gives you go in `inputs/`, finished work goes in `outputs/`, plans and handoffs go in `plans/`. Treat `inputs/` as read-only.
- Match the format of the example in `reference/` for recurring outputs.
- Before big or ambiguous work, make a plan first and confirm it with the user.

## Agents

- Delegate to the corridor-cookbook **researcher** and **indexer** agents; they run on Sonnet.
- Use 1 to 3 agents at most. If you are confused about the work, ask the user instead of delegating.

## Learnings

When the user asks for the same thing repeatedly, hits the same friction twice, or corrects you the same way twice, append a short dated note to `learnings.md`. These notes become future skills.

## About the user

{{From the setup interview: role, what they care about, how they like to receive work.}}
