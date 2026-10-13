# Checks

Read before proposing a plan (setup step 3) and when building a job skill's scripts.

## The claims every output makes

Any output, a workbook, an email, a code change, a list, makes several claims at once. Evidence for one does not cover the others. These seven are the hidden checklist the interview probes against.

| Claim | In plain words | Spreadsheet | Email or document | Code change | List from a voice note or email |
|---|---|---|---|---|---|
| Real | It is true, it happened, it is not counted twice | Each row vouched to its source; duplicate scan | Every fact traces to a source | It does what its description says, shown by running it | Each item traces to something said |
| Nothing missing | Everything that should be here is | Row count; trace the source forward | Every ask, attachment, and person who should be copied | Every caller and edge case it touches is tested | Every ask in the note became an item |
| Right amount | The value, date, or name is right | Tie-out; recalculation; control total | Numbers, dates, and names match their sources | Output matches a known answer | Property, owner, and date read back |
| Current | The latest version; the right period | As-of gate; cutoff near the period end | Latest thread and attachment | Right branch, environment, and versions | Nothing already done or superseded |
| Right place | Right account, recipient, or environment; facts kept apart from opinions | Classification by the definitions | Right recipients and thread; facts, opinions, decisions apart | Right module and environment | Right property or owner |
| Ours to use | Ours to count, or to share with this reader | Consignment or customer goods left out | Nothing confidential to this reader | No secrets or customer data in code or logs | Codes and card numbers kept off |
| Labeled right | The reader takes it the way it is meant | Signs, units, column labels | The ask is clear to the reader | Names, messages, and docs match the behavior | Item text short and clear |

## Kinds of check

**Gates** stop the run when they fail, because every later check would be built on a bad base. Each gate names the checks it blocks, so a run with one bad input still reports everything that input doesn't touch.

- Inputs complete: 12 of 12 store files, or the run stops and names the missing ones.
- Same as-of: every source pulled as of the same date.
- Report integrity: the export's filters and parameters, its row count, and its printed total against the system screen. A tie-out to a truncated export passes and means nothing.
- Definitions hold: every field and code is covered by the saved definitions.
- Run read-back: period, entity, files, and tolerances confirmed in one line.

**Mechanical checks** run on every row a machine can reach.

- Vouch (output to source) finds things that should not be there.
- Trace (source to output) finds things that are missing. Any output that adds up rows gets one, because omissions are what people and models miss most.
- Row count: rows in, rows used, rows excluded with the reason.
- Control total: the parts sum to a total stated independently.
- Reconciliation: two systems that should agree, every difference listed.
- Roll-forward: opening plus activity equals closing.
- Recalculation: the arithmetic redone in code or a formula.
- Re-extraction: a document's values read a second time, without sight of the first read, and compared.
- Relation: something that holds whatever the answer is. Months sum to the quarter; removing one store drops the total by exactly that store.
- Cutoff: items near the period end land in the right period.
- Classification: each item sits in the bucket the definitions put it in.
- Pointer check: every cited location holds the stated value.
- Spreadsheet soundness, for workbooks: typed numbers sitting where formulas belong, constants buried inside formulas, and a formula that differs from its neighbors in a row or column.

**Analytical checks** ask whether the result makes sense. For prior-period and plan-versus-actual comparisons, write the expected value or range before looking, and compare per store, month, or job, not only in total, because offsetting errors hide in totals. A difference over the threshold reports as Failed, with both sides, until someone explains it with a document or accepts it (Failed, accepted by <name> on <date>: <reason>). There is no fifth result such as "flagged". "It is a data error" is always one of the explanations offered.

**Selection** decides what gets a person's eyes. Machines take 100% of what they can reach. People get key items (the largest, the unusual, and anything with a history of error from the interview) plus a few at random, picked by Claude with the method and item IDs recorded. Results on key items say nothing about the rest.

**Human checks** name a role and a moment: "controller, before entries post". They name the items and the threshold. Claude prepares the exceptions list, and the person types the value they saw, because a tick answered from memory is not a check.

## Writing a check

Each row of the plan names:

- **Covers:** which of the claims.
- **Compares:** both sides, where each lives, the direction, and why the two sides are independent. "Each receiving-log line (source) traced to an accrual line (output); the receiving log is kept by the warehouse, not built from the accruals."
- **Tolerance:** exact by default; the owner loosens it only on purpose, when correcting the plan. Line tolerances must add up to less than the tolerance for the whole output, and each proof totals the differences that passed within tolerance.
- **Catches:** the specific error it would expose, and what it would miss. "Catches a misread digit; misses a sale filed under the wrong store."
- **Planted error:** the realistic error that proves it can fail.
- **Who, when, and what it needs:** automatic, or a named role at a named moment; and what the check needs to run (code, a browser, a connector, a file), confirmed to exist where the job runs. A check whose needs aren't there is redesigned (a script in place of a browser) or given to a person, never left to report Not run every time.

A check whose catch nobody can name is dropped. A check with no independent second side becomes a human check, or goes under Not checked.

## Planted errors: showing a check works

A check that has never been seen failing proves nothing. Planted errors exist to earn the owner's trust in the checks, so they are always announced, always on a copy marked as a test, and never in live work.

On a proof run:

1. Tell the owner what you will break and why: "I'm going to change one number on a test copy to show you the check catches it."
2. On the copy, plant one error per check, chosen from the library below or from the owner's past misses. Re-read the planted cell or line to confirm the change landed.
3. Run the checks on the copy.
4. Show one catch in full, the one closest to the owner's past misses: what was changed, the check, both sides, Failed. Summarize the rest in one line: "All 8 checks caught their test error." The full list goes in the proof file.
5. Discard the copy.

A check that passes the broken copy is rewritten or cut before the plan is saved. In a job skill, each planted error is a test in `scripts/test_planted.py`, so the proof re-runs after every Update.

| Work | Errors to plant |
|---|---|
| Tables of numbers | Drop a row; duplicate a row; flip a sign; one value times 1,000; move an item across the period end; post to the wrong account or store; swap in the prior day's extract; filter out one store |
| Lists from email, calls, or voice | Drop one ask from the source; add an item with no source; change a due date or owner; file under the wrong property |
| Emails, documents, recaps | Attach an older version; change a number so it no longer matches its source; drop an ask or a deadline; add a recipient who shouldn't be there; add a sentence nobody said; turn an opinion into a fact |
| Code changes | Flip a condition; delete a line; an off-by-one; point at the wrong environment. A test or a check must fail on each |
| Quotes, intakes, tickets | A price not on the price list; a missing condition note; a promised date the bench cannot meet; a ticket closed with no confirmation from the person |

## Order

Gates, then mechanical checks, then analytical checks, then human checks.
A failed gate stops everything that depends on it. A failed mechanical check makes analytical comparisons on the same numbers meaningless until it is resolved.
