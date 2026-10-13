---
name: run-plan
description: Run an approved plan into finished outputs, routing each step to the right agents and model. Use when the user says "run the plan", "run it", "do the plan", "make it", or points at an approved plan in plans/ and wants the work done.
---

# run-plan

Read an approved plan and produce the outputs it describes. You set up the work and pull the result together. You get step one and step ten, not the nine in between; the agents do the middle.

## Start from an approved plan

Read the plan in `plans/`. Check the front matter: if `status` is not `approved`, stop and tell the user the plan needs their sign-off first. A draft is a proposal, not a job to run.

## Run the steps

Read the steps. Some depend on each other and run in order. Independent ones run at the same time through the bundled agents, one dispatch each:

- **researcher** for reading and facts: files in the folder, prior outputs, the web.
- **indexer** to catalog what the folder now holds.
- **designer** for visual work: mockups, page layouts, diagrams.

One level of agents only. A dispatched agent cannot dispatch its own, because Cowork child tasks cannot spawn children. Keep the fan-out to one to three agents; past three, check with the user.

Delegate only work you can describe crisply. If you are unsure what a step needs, ask the user instead of delegating the confusion. If this tool or model cannot start agents, do the steps yourself, in order. Agents run on Sonnet (pinned in their files); keep the steps that need judgment across many documents for yourself.

## Land the outputs and close

- Finished work goes in `outputs/` with the date in the name.
- Change the plan's `status` to `done`.
- If the job has a checks skill from the verifier, run it before you hand back.
- Run **learn** so this run improves the next one.

Done when every step in the plan has an output in `outputs/`, the plan's status reads `done`, the checks skill has run if one exists, and learn has run.

You produce the work and hand it back. Hand the work back as a draft; the user decides what ships.
