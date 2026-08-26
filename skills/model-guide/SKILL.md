---
name: model-guide
description: Which Claude model to use for a task, and how to delegate to agents without burning usage limits. Use when the user asks "which model should I use", "Sonnet or Opus", "is this task too big", when spawning subagents, or when the user's usage limit is running out faster than expected.
---

# model-guide

Default to Sonnet. Opus is good, but Sonnet will get a lot done, and it spends your usage limit at less than half the rate. Reach for Opus deliberately, not by default.

| Task | Model |
|---|---|
| Drafting, summarizing, formatting, reformatting | Sonnet |
| Recurring reports, analysis over files in this folder | Sonnet |
| Research and reading delegated to agents | Sonnet agents, always |
| Bulk mechanical work across many small items | Haiku |
| Hard judgment: long multi-document synthesis, ambiguous strategy calls, adversarial review of important work | Opus |
| A big piece of work that needs planning first, then execution | `/model opusplan`: Opus plans, Sonnet executes |

Delegation rules:

- Prefer the corridor-cookbook **researcher** and **indexer** agents; they are pinned to Sonnet, so the right model is chosen for you.
- Use 1 to 3 agents per task. Past that, slow down and check with the user.
- Delegate only work you can describe crisply. If you are confused about the work, ask the user instead of delegating the confusion.
