# Worked examples

Every company, person, and number here is made up. Use these to show what a finished standard looks like, then build the owner's from their own answers.
Each example gives the job, the checks that matter most, the gap the interview surfaced, and the planted error shown on the proof run. The same interview runs for every shape of work; only the sources and the checks differ.

## Controller: monthly bank reconciliation

Used by the controller to sign the close. High impact (feeds the close), so it stays at level 1.

| Check | Covers | Compares (direction) | Tolerance | Catches | Planted error | Who, when |
|---|---|---|---|---|---|---|
| As-of gate | Current | Statement date and trial balance date | Same day | An extract pulled before the books locked | TB extract from the day before | Automatic |
| Outstanding checks vouched | Real | Each outstanding check (output) to the check register (source) | Exact | A check listed that was never issued | A made-up check number | Automatic |
| Cleared checks traced | Nothing missing | Each check on the statement (source) to cleared or outstanding (output) | Exact | A cleared check never marked | One statement line removed from the rec | Automatic |
| Reconciliation | Right amount | Adjusted bank balance to cash per GL | 0.00 | Any unexplained gap | Deposit in transit times 10 | Automatic |
| Two largest deposits in transit | Real | Deposit log and the next month's statement | Exact | A deposit that never clears | n/a (human) | Controller, before review |

The show-your-work table on the proof run:

| Line | Amount | Source | As-of |
|---|---|---|---|
| Ending balance per bank statement | 158,900.00 | Bank statement, page 1 | Sep 30 |
| Less outstanding checks | (7,860.00) | Check register, checks 4471 to 4474 | Sep 30 |
| Plus deposits in transit | 1,300.00 | Deposit log, Sep 30 deposit | Sep 30 |
| Adjusted bank balance | 152,340.00 | Calculated | |
| Cash per general ledger | 152,340.00 | Trial balance, cash account 1010 | Sep 30 |
| Difference | 0.00 | | |

If the difference were 125.00, the report shows 125.00, the items checked, two explanations (an uncleared check dated before 9/30, or a bank fee on the statement and not in the GL) and the document that would decide between them, and it stops there.

**Gap the interview found:** the controller vouched outstanding checks but nothing traced the statement forward. Probe: "How would you know if a check cleared and nobody marked it?" Accepted as a check.

## Sales reporting: where trade-ins are negative quantities

Some point-of-sale systems enter a trade-in as its own line, with a negative quantity and a negative amount.

| Line | Qty | Amount |
|---|---|---|
| Ring | 1 | 4,000.00 |
| Watch | 1 | 9,500.00 |
| Trade-in, watch | -1 | (2,000.00) |

| Term | Means (owner's words) | In / out | Formula |
|---|---|---|---|
| Net sales | What we actually took in after trade-ins | Trade-ins in | Sum of Amount on all lines: 11,500.00 |
| Gross sales | What we sold before trade-ins | Trade-ins out | Sum of Amount where Qty > 0: 13,500.00 |
| Units | Pieces that left the store | Trade-ins out | Count of lines where Qty > 0: 2 (summing Qty gives 1, which is wrong here) |

Checks: a definition gate that this table is confirmed before any number is pulled, and a control total of net sales against the system's own net sales for the same dates. Planted error: one trade-in line flipped positive.

## AP: month-end accruals

Used by the AP lead; the controller signs. High impact, level 1.

- **Real:** each accrual line vouched to a purchase order, contract, or receipt with no invoice yet.
- **Nothing missing:** every receiving-log line from the month with no matching invoice traced forward to an accrual. This is the search for unrecorded bills; vouching the accrual list cannot find them.
- **Current:** last month's accruals reversed, or relieved by the actual invoice.
- **Roll-forward:** opening 48,200 plus new 31,500 minus reversed or relieved 44,900 equals closing 34,800, which matches accrued liabilities in the trial balance.
- **Planted error:** one receiving-log line deleted from the accrual list on the test copy. The trace caught it; the vouch did not, which is why both exist.

## Construction PM: voice note after a site walk, into a board

Used by the PM and the contractors he forwards items to. Medium impact (others work from it, and a wrong item can be fixed before harm), so the ceiling is level 2 once runs are stable.

| Check | Covers | Compares | Catches |
|---|---|---|---|
| Every ask is an item | Nothing missing | Each ask, promise, and deadline in the transcript (source) to a board item or "not an item, why" | An ask lost between the note and the board |
| Read-back | Right amount | Property, owner, and date read back before saving | "Riverside" heard as "Lakeview" |
| Seen or told | Right place | Each status labeled "you saw it" or "the sub says" | A sub's "it's done" recorded as done |
| Never include | Labeled right | Board text against the never-include list | An alarm code or gate combination on the board |

**Gap the interview found:** "When a contractor tells you something's done, what do you do before you believe it?" He walks it himself, but the board recorded the sub's word as done. The fix is the seen-or-told label.
**Planted error:** one ask removed from a copy of the transcript. The count ("9 asks, 8 items") went to Failed.

## Sales lead: weekly recap and follow-ups

Used by the sales lead and store managers. Medium impact, level 2 ceiling.

- Every line in the recap traces to someone's words, with who said it and when.
- Facts, opinions, and decisions are labeled; a decision has an owner and a date.
- A follow-up is done only when a contact happened: a call, a text, a visit.
- Never include: card or bank details; clients appear as initials.
- **Gap the interview found:** "Show me a line from a past recap that crossed from fact into opinion. What gave it away?"
- **Planted error:** a sentence nobody said, added to a copy of the recap. The pointer check found no source and failed it.

## Operations: repair intake and quote

Used by store staff with a customer at the counter. A quote is a promise to a customer, so it stays at level 1.

- Every price comes from the price list. A price that isn't on the list is Not run and goes to the operations director.
- The piece's condition is recorded before any work, with photos.
- Every repair the customer asked for and every repair recommended is listed, including the ones declined.
- The promised date is checked against the bench schedule.
- **Planted error:** a price that isn't on the list. The check failed it and routed it to a person.

## IT: quarterly access review

Used by the IT director; removing access is a person's action. High impact, level 1.

- **Real:** each active account in the directory traced to a person on the HR active roster. An account with no active person is a finding.
- **Nothing missing:** each person on the roster traced to the accounts their role needs.
- **Right amount:** license count against active accounts.
- **People only:** disabling accounts and changing permissions.
- **Planted error:** an account for a terminated employee, on a copy of the directory export. The trace caught it.

## Anyone: a big email before it goes out

A one-off, so there is no setup and nothing is saved unless the sender wants this kind of email checked every time. Sending can't be undone, so the sender approves.

Three questions first, one per message: "What would make this wrong?" "Which parts matter most to get right?" "Who is it going to, and can you take it back?"

| Check | Covers | Compares | Catches |
|---|---|---|---|
| Every number and date | Right amount | Each figure in the email to the file or thread it came from | A total from last week's version of the model |
| Every ask | Nothing missing | The asks in the thread being answered to the replies in the draft | A question the reader asked that the draft skips |
| Attachments | Current | Each attachment's file name and date to the latest version | The draft deck attached instead of the final |
| Recipients | Right place, Ours to use | To and Cc against who the sender named; the body against what each reader may see | An outside party copied on internal pricing |

**Planted error:** on a copy of the draft, one figure changed so it no longer matches its source. The check flagged it with both values.

## Engineering: a change before it ships

Used by the engineer and the reviewer. Merging is reversible; deploying to production and migrating data are a person's action, so those steps stay at level 1.

- **Real:** the change does what its description says, shown by the repo's `verify-<app>` skill driving the app or the endpoint, with the output captured.
- **Nothing missing:** every caller of the changed code is covered by a test that ran.
- **Current:** the tests ran on the branch being merged, against the environment named in the description.
- **Ours to use:** no keys, tokens, or customer data in the diff or the logs.
- **Gap the interview found:** "How would you know if this passed only because of something left over from an earlier run?" Added: run the proof on a clean environment.
- **Planted error:** one condition flipped on a copy of the branch. A test went red, which showed the tests can fail.

## A job skill, filled in

```
bank-rec-checks/
  SKILL.md
  scripts/check_rec.py      as-of gate, outstanding vouch, cleared trace, reconciliation
  scripts/test_planted.py   TB from the day before, made-up check number, statement line removed, deposit times 10
```

```
---
name: bank-rec-checks
description: Check the operating account bank reconciliation against the controller's standard before the close is signed. Use when the monthly bank rec for account 1010 is prepared or reviewed, when its bank statement and trial balance are attached, or when the controller asks whether the rec ties.
---

# Operating account bank rec checks

Made with verifier 2.2 on 2026-10-13. Owner: controller. Used by the controller to sign the close.

## Run

1. Read `checks/bank-rec log.md`. No "checks proven" line: this is the proof run. "Checks proven" but no "proof passed": only the controller's question is open. This job stays at level 1: it feeds the close.
2. Read back, before any check runs: "Running <month> bank rec, account 1010, statement <file> and TB <file>, both as of <date>, tolerance 0.00. Right?" Mark anything inferred rather than said. Wait for a yes.
3. Human read, before review and before showing ours: the controller types the amounts of the two largest deposits in transit as the deposit log and next month's statement show them.
4. Gates: statement and TB present; same as-of date; TB export unfiltered, row count matching. Each blocks every check. If one fails, stop and tell the controller which file to pull again.
5. Run `scripts/check_rec.py <statement> <tb> <check register> <deposit log>`, and compare the controller's amounts from step 3. Proof run: also run `scripts/test_planted.py`; when all four plants are caught, log "checks proven <date>".
6. Report everything. Write the proof to `checks/proof/bank-rec <month>.xlsx` and add this run's line to the log.
7. Until "proof passed" is logged: show the cleared-check catch in full and the rest in one line, then ask "Is there anything here you'd have flagged that these checks didn't?" On the answer, log "proof passed <date>: <answer>".

## Rules (verifier 2.2)

<copied unchanged from the template in references/job-skill.md>

## The standard

Source of truth: the bank statement for the bank side; the trial balance for the book side.
As-of rule: both sides as of the last day of the month, after the books lock.

Definitions (in the controller's words):
| Term | Means | In / out | Formula, if derived |
|---|---|---|---|
| Outstanding check | Issued in or before the month and not cleared by the statement date | Voids out | |

| Check | Covers | Compares (direction) | Tolerance | Catches | Planted error | Who, when |
|---|---|---|---|---|---|---|
| Outstanding checks vouched | Real | Rec list to check register | Exact | A check never issued | Made-up check number | Automatic |
| Cleared checks traced | Nothing missing | Statement lines to rec | Exact | A cleared check never marked | Statement line removed | Automatic |
| Reconciliation | Right amount | Adjusted bank balance to cash per GL | 0.00 | Any unexplained gap | Deposit times 10 | Automatic |
| Largest deposits in transit | Real | Deposit log and next statement | Exact | A deposit that never clears | n/a | Controller, before review |

People only: posting adjusting entries; marking items cleared in the system.
Never include: full account numbers.
Not checked, by choice: bank fees under 25.00 are not traced one by one (controller, 2026-10-13: too small to matter, caught at year end).
Next review: 2027-01-13, or sooner if the bank, the account, or the TB layout changes.
```

### Without scripts

A recurring email has mechanical checks but no stable structure to script against, so its checks are listed steps and it has no `scripts/`. In `store-recap-checks`, a Friday recap to the regional manager, step 5 reads:

```
5. Checks, each reading its source without sight of the draft:
   - Every number and date in the draft against that week's sales report. Exact.
   - The regional manager's last email against the draft: a separate pass lists any question left unanswered.
   - Each attachment's name and date against the latest version.
   - To and Cc against the two people named in the standard.
   Then the pointer check.
   Proof run: on a marked copy of last week's draft, change one number, drop one answer, attach the older file, and add a Cc; re-read to confirm each landed; run the checks. When all four are caught, log "checks proven <date>".
```
