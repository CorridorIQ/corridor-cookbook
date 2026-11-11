# Checks

Read before proposing a plan and when building a job skill's scripts.

## The seven claims

Every output makes seven claims at once; evidence for one does not cover the others. This is the hidden checklist the interview probes against.

| Claim | Spreadsheet | Email or document | Code change | List from voice or email |
|---|---|---|---|---|
| Real: true, not counted twice | Rows vouched; duplicate scan | Each fact traces to a source | Does what it says, shown by running it | Each item traces to something said |
| Nothing missing | Row count; trace source forward | Every ask, attachment, person to copy | Every caller and edge case tested | Every ask became an item |
| Right amount: value, date, name | Tie-out; recalculation; control total | Numbers, dates, names match sources | Output matches a known answer | Property, owner, date read back |
| Current: latest, right period | As-of gate; cutoff | Latest thread and attachment | Right branch, environment, versions | Nothing done or superseded |
| Right place; facts apart from opinions | Classification by the definitions | Right recipients and thread; facts, opinions, decisions apart | Right module and environment | Right property or owner |
| Ours to use | Consignment or customer goods out | Nothing confidential to this reader | No secrets or customer data in code or logs | No codes or card numbers |
| Labeled right: read as meant | Signs, units, labels | The ask is clear | Names, messages, docs match behavior | Item text short and clear |

## Kinds of check

**Gates** stop the run when they fail; a failed gate stops every check that depends on it. Each names the checks it blocks (so one bad input still lets the rest report) and what to tell whom.

- Inputs complete: 12 of 12 store files, or stop and name the missing ones.
- Same as-of: every source pulled as of the same date.
- Report integrity: the export's filters and parameters, row count, and printed total against the system screen. A tie-out to a truncated export passes and means nothing.
- Definitions hold: every field and code is covered by the saved definitions.
- Run read-back: period, entity, files, and tolerances confirmed in one line.

**Mechanical checks** run on every row a machine can reach.

- Vouch (output to source) finds what should not be there.
- Trace (source to output) finds what is missing. Every output that adds up rows gets one.
- Row count: rows in, used, excluded with the reason.
- Control total: the parts sum to a total stated independently.
- Reconciliation: two systems that should agree, every difference listed.
- Roll-forward: opening plus activity equals closing.
- Recalculation: the arithmetic redone in code or a formula.
- Re-extraction: a document's values read again, without sight of the first read, and compared.
- Relation: holds whatever the answer is: months sum to the quarter; removing one store drops the total by exactly that store.
- Cutoff: items near the period end land in the right period.
- Classification: each item in the bucket the definitions give it.
- Pointer check, every row, after the others: re-open each cited location, confirm the stated value.
- Spreadsheet soundness: typed numbers where formulas belong, constants inside formulas, a formula unlike its neighbors.

**Analytical checks** ask whether the result makes sense. For prior-period and plan-versus-actual comparisons, write the expected value or range before looking. Compare per store, month, or job, not only in total: offsetting errors hide in totals. A difference over the threshold is Failed, with both sides, until someone explains it with a document or accepts it.

**Selection** for a person's eyes: key items (the largest, the unusual, anything with a history of error) plus a few at random, picked by Claude, method and item IDs recorded. Key-item results say nothing about the rest.

**Human checks** name a role and a moment ("controller, before entries post"), the items, and the threshold. Claude prepares the exceptions list; the person reads the source with none of our values beside it and types what they saw. A tick is not a check.

## Writing a check

Each plan row names:

- **Covers:** which claims.
- **Compares:** both sides, where each lives, the direction, and why they are independent ("receiving log traced to accruals; the warehouse keeps the log, not built from the accruals").
- **Tolerance:** exact by default; only the owner loosens it, on purpose, when correcting the plan. Line tolerances add up to less than the tolerance for the whole, and each proof totals the differences that passed within tolerance.
- **Catches:** the error it exposes and what it misses: "Catches a misread digit; misses a sale filed under the wrong store."
- **Planted error:** the realistic error that proves it can fail.
- **Who, when, needs:** automatic, or a named role at a named moment; what it needs to run (code, browser, connector, file), confirmed to exist where the job runs. Missing: redesign it (a script in place of a browser) or give it to a person, never leave it to report Not run every time.

A check whose catch nobody can name is dropped.

## Planted errors

A check never seen failing proves nothing. Plant one error per check, from this library or the owner's past misses: always announced to the owner (what you will break and why), always on a copy marked as a test, never in live work. Re-read the planted cell or line to confirm it landed, run the checks on the copy, discard the copy. Show one catch in full, the rest in one line ("All 8 checks caught their test error."); the full list goes in the proof file. A check that passes its broken copy is rewritten or cut before the plan is saved.

| Work | Errors to plant |
|---|---|
| Tables of numbers | Drop a row; duplicate a row; flip a sign; one value times 1,000; move an item across the period end; post to the wrong account or store; swap in the prior day's extract; filter out one store |
| Lists from email, calls, voice | Drop one ask; add an item with no source; change a due date or owner; file under the wrong property |
| Emails, documents, recaps | Attach an older version; change a number off its source; drop an ask or deadline; add a wrong recipient; add a sentence nobody said; turn an opinion into a fact |
| Code changes, a small change to a copy | Flip a condition; delete a line; off-by-one; point at the wrong environment. At least one test or check must fail on each |
| Quotes, intakes, tickets | A price not on the price list; a missing condition note; a date the bench cannot meet; a ticket closed with no confirmation from the person |

## Order

Gates, then mechanical, then analytical, then human checks. A failed mechanical check makes analytical comparisons on the same numbers meaningless until resolved.
