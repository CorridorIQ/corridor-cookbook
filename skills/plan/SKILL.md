---
name: plan
description: Turn the shape of a job into a one-page plan the user signs off before any work starts. Use right after start hands over the paragraph, or when the user says "plan this", "write the plan", "make a plan", or describes work big enough that starting cold would waste effort.
---

# plan

Turn the start paragraph and its answers into one plan the user reads in two minutes and commits to. The plan is the deliverable here. Building comes next, and only after the user approves.

If the whole plan fits in one sentence the user would agree with, say the sentence and skip the file. Plans earn their keep on work that is uncertain, multi-part, or unfamiliar.

## Write the plan

Write it to `plans/YYYY-MM-DD_subject.md`, where `subject` is a few kebab-case words. Front matter, these six fields and no others:

```
---
subject: august-portfolio-report
category: recurring-report
type: plan
date: 2026-09-17
version: 1
status: draft
---
```

- **subject** what the job is, short.
- **category** the kind of work: recurring-report, analysis, one-off, and so on. It lets the user find plans later.
- **type** always `plan`.
- **date** the day you write it.
- **version** starts at 1. Bump it when you rewrite the plan after approval.
- **status** one of `draft`, `approved`, `done`. Starts at `draft`.

## The body

Five sections, in order, plain English a non-technical person reads in two minutes. Keep the whole thing under one page. Write it for the user first, agents second, so drop the jargon.

1. **Goal** in one paragraph. What this produces and why it matters.
2. **Decisions made** the calls already settled in start, so nobody relitigates them.
3. **Steps in order** the work, numbered. Enough that run-plan knows what to run, no more.
4. **What done looks like** the finish line, in terms the user can check for themselves.
5. **Open questions** anything still unsettled. If none, say none.

## Then stop

Show the plan and stop. Leave the work in the plan for run-plan to run.

Status stays `draft` until the user says approved. When they do, change `status` to `approved`, and run-plan takes it from there. Until then the plan is a proposal, not a green light.
