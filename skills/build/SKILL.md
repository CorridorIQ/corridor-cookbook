---
name: build
description: Run an approved plan into finished outputs, routing each step to the right agents and model. Use when the user says "build this", "run the plan", "make it", or points at an approved plan in plans/ and wants the work done.
---

# build

Read an approved plan and produce the outputs it describes. You set up the work and pull the result together. You get step one and step ten, not the nine in between; the agents do the middle.

## Start from an approved plan

Read the plan in `plans/`. Check the front matter: if `status` is not `approved`, stop and tell the user the plan needs their sign-off first. A draft is a proposal, not a job to run.

## Run the steps

Read the steps. Some depend on each other and run in order. Independent ones run at the same time through the bundled agents, one dispatch each:

- **researcher** for reading and facts: files in the folder, prior outputs, the web.
- **indexer** to catalog what the folder now holds.
- **designer** for visual work: mockups, page layouts, diagrams.

One level of agents only. A dispatched agent cannot dispatch its own, because Cowork child tasks cannot spawn children. Keep the fan-out small: one to three agents, don't over-delegate. Past three, slow down and check with the user.

## Route each step to the right model

Match the intelligence to the step:

- **Sonnet** for most work: drafting, formatting, assembling, straightforward analysis.
- **Opus** for hard synthesis or judgment: long multi-document work, ambiguous calls, review of something that matters.
- **The top model** only when a step truly needs it.

This is guidance toward the cheaper model that still does the job, not a ban on the stronger one. The researcher, indexer, and designer agents are pinned to Sonnet, so that call is already made for delegated work.

## Land the outputs and close

- Finished work goes in `outputs/` with the date in the name.
- Change the plan's `status` to `done`.
- Run **learn** so this run improves the next one.

You produce the work and hand it back. Never mark anything final or send anything on the user's behalf; the user decides what ships.
