# Trust ladder

The checks run in full at every level; only the owner's view changes.
Trust is earned per job, from its run log. Every new job starts at level 1 however capable the model is.

## Levels

1. **Approve every run.** The owner reads the full report and signs before anything moves.
2. **Exceptions.** The owner looks at what needs them: result line, failures, near-misses (within 10% of a tolerance), one random passed row with its source.
3. **Audit.** The owner reviews the run log on a schedule they set; reports show the result line, failures as they happen, and one random passed row with its source.

The random passed row keeps the owner looking at real evidence: busy people stop reading reports that are always clean.

Levels are lines in the run log, so a change never needs the skill re-saved.

## How far a job can go

Set the ceiling from the interview's stakes answers. The owner's top-priority items set which checks run first and get a person's eyes; they don't set the ceiling, since every job has them.

- **Impact.** High: the output goes through a one-way door (posts, pays, leaves the team, promises a customer, closes a period, deletes) or puts private data in reach of the wrong reader. Medium: someone else acts on it, and a wrong one can be fixed before much harm. Low: only the owner sees it, and it can be undone.
- **Likelihood.** High: the first runs; anything new (source, report layout, definition, owner, model); a known miss in the last year; judgment work (classifying, summarizing what someone meant). Low: stable mechanical work with a long clean log. Otherwise medium.

| | Low likelihood | Medium | High |
|---|---|---|---|
| **High impact** | 1 | 1 | 1 |
| **Medium impact** | 3 | 2 | 1 |
| **Low impact** | 3 | 3 | 2 |

So one-way-door output stays at level 1. Check the ceiling again each time a step down is proposed.

## Stepping down one level

Propose it only when all four hold. The owner says yes or no; Claude never moves a job down by itself.

1. Clean runs at the current level, at least the owner's number, covering one full cycle (a month-end; a full week with an exception in it). Runs on closed periods with known right answers count.
2. Every check has been seen catching its planted error, and none was added since without its own.
3. Nothing on the back-to-level-1 list happened during the streak.
4. The next level is at or under the ceiling.

Say plainly what the streak shows: three clean runs still fits a job wrong two runs in three; ten, one in four; thirty, one in ten. The streak shows misses are rare; the planted errors show the checks would catch one.

## Back to level 1, at once

- A real error got out.
- A source system, report layout, definition, owner, or the model changed.
- Something far outside the usual: twice the usual row count, one item larger than the tolerance for the whole, a recipient or kind of request never seen before.
- The owner corrected an output.
- A check failed on two runs in a row.

Name the trigger that fired. Before the next live run, re-run the last closed period and compare it to its proof.

## Re-confirm on a calendar

High impact every quarter, medium twice a year, low once a year, or the owner's schedule. The job skill carries "Next review: <date>".
