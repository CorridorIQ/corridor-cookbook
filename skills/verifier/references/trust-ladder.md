# Trust ladder

Sets how much of each run the owner reviews. The checks run in full at every level; only the owner's view changes.
Trust is earned per job, from that job's run log. A new job starts at level 1 however capable the model is in general, because nothing yet shows how it does on this work.

## Levels

| Level | The owner | The report shows |
|---|---|---|
| 1. Approve every run | Reads the full report and signs before anything moves | Everything |
| 2. Exceptions | Looks at what needs them | Result line, failures, near-misses (within 10% of a tolerance), and one random passed row with its source |
| 3. Audit | Reviews the run log on a schedule they set | Result line and failures, as they happen |

Every job starts at level 1. Levels are lines in the job's run log, so a level change never needs the job skill re-saved. Output that goes through a one-way door (posts, pays, leaves the team, promises a customer, closes a period, deletes) stays at level 1.

The random passed row at levels 2 and 3 keeps the owner looking at real evidence each run. Busy people stop reading reports that are always clean, and one real row with its source is a small, cheap look.

## How far a job can go

Set from the interview's stakes answers.

- **Impact.** High: the output itself goes through a one-way door, or puts private data in reach of the wrong reader. Medium: someone else acts on it, and a wrong one can be fixed before much harm. Low: only the owner sees it, and it can be undone. The owner's top-priority items set which checks run first and get a person's eyes; they don't set the ceiling, since every job has them.
- **Likelihood.** High: the first runs; anything new (source, report layout, definition, owner, model); a known miss in the last year; or judgment work such as classifying or summarizing what someone meant. Low: stable, mechanical work with a long clean log. Otherwise medium.

| | Low likelihood | Medium likelihood | High likelihood |
|---|---|---|---|
| **High impact** | 1 | 1 | 1 |
| **Medium impact** | 3 | 2 | 1 |
| **Low impact** | 3 | 3 | 2 |

Likelihood falls as the log grows, so check the ceiling again each time a step down is proposed.

## Stepping down one level

Propose it only when all four hold. The owner says yes or no; Claude never moves a job down by itself.

1. Clean runs at the current level, at least the number the owner set, covering one full cycle (a month-end; a full week that had an exception in it). Runs on closed periods whose right answers are known count, so a monthly job can build its streak from past months instead of waiting a year.
2. Every check has been seen catching its planted error, and none was added since without its own.
3. Nothing on the back-to-level-1 list happened during the streak.
4. The next level is at or under the ceiling.

Say plainly what the streak shows. Three clean runs still fits a job that is wrong two runs in three; ten fits one in four; thirty, one in ten. The streak shows misses are rare; the planted errors show the checks would catch one.

## Back to level 1, at once

- A real error got out.
- A source system, report layout, definition, owner, or the model changed.
- Something far outside the usual: twice the usual row count, one item larger than the tolerance for the whole, or a recipient or kind of request never seen before.
- The owner corrected an output.
- A check failed on two runs in a row.

Name the trigger that fired. Before the next live run, re-run the last closed period and compare it to that period's proof.

## Re-confirm on a calendar

High impact every quarter, medium twice a year, low once a year, or the schedule the owner chose.
The job skill carries "Next review: <date>", and a run past that date opens by asking whether anything about the job has changed.
