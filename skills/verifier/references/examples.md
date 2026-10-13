# Worked examples

All made up. Build the owner's standard from their own answers, not these.

## One finished standard per kind of work

| Work (ceiling) | Key checks | Distinctive check, or gap the interview found | Catches | Planted error | People only |
|---|---|---|---|---|---|
| Sales, trade-ins as negative-quantity lines | Definition gate before any pull; net sales control total to the system's | Net sales = all lines; gross = Qty > 0; units = count of Qty > 0 lines, not sum of Qty | Trade-ins counted as sales or units; misses a sale under the wrong store | A trade-in flipped positive | |
| Month-end accruals (1) | Each accrual vouched to a PO, contract, or receipt; last month's accruals reversed or relieved by the actual invoice; roll-forward tied to the TB | Receiving-log lines with no invoice traced to accruals: vouching can't find unrecorded bills | An unrecorded bill; misses one with no receiving line | A receiving line deleted: trace caught it, vouch did not | Posting |
| Voice note into a board (2) | Each ask an item or "not an item, why", with the count; property, owner, date read back; board text against the never-include list (alarm or gate codes) | Gap: "When a contractor tells you something's done, what do you do before you believe it?" He walks it; the board took the sub's word. Fix: each status labeled "you saw it" or "the sub says" | "Riverside" heard as "Lakeview"; a sub's "it's done" recorded as done | One ask removed: "9 asks, 8 items" Failed | |
| Weekly recap (2), listed checks | Each line traces to who said it and when; never-include list (card or bank details; clients as initials) | Gap: "Show me a line from a past recap that crossed from fact into opinion. What gave it away?" Fix: facts, opinions, decisions labeled; a follow-up done only once a contact happened | A sentence nobody said; an opinion as fact | A sentence nobody said | |
| Repair quote (1, a promise) | Each price from the price list, else Not run to the operations director; every repair asked for and every repair recommended listed, declined ones included | Condition and photos before work; date against the bench | A price not on the list; a date the bench can't meet | A price not on the list | The quote |
| Access review (1) | Each account traced to the HR roster; each person to the accounts their role needs; license count against active accounts | An account with no active person is a finding | A terminated employee still active; misses excess rights within a role | A terminated employee's account | Disabling access; changing permissions |
| Big email (one-off) | The three questions; each figure to its source; each ask answered; latest attachments | To and Cc against who the sender named; what each reader may see | A total from last week's version of the model; the draft deck attached instead of the final; an outside party copied on internal pricing | One figure changed | Sending |
| Code change (1 for deploy) | `verify-<app>` drives it; every caller tested; tests ran on this branch and environment; no secrets in diff or logs | "How would you know if this passed only because of something left from an earlier run?" Added: proof on a clean environment | A change that only passed on leftover state | A flipped condition: a test went red | Deploy, migrate |

## A job skill, filled in

Bank rec, ceiling 1 (feeds the close). The cleared-check trace came from the gap probe "How would you know if a check cleared and nobody marked it?"
If the rec were off by 125.00, the report shows 125.00, the items checked, three explanations (an uncleared check dated before 9/30, a bank fee on the statement and not in the GL, or a data error in either extract) and the document that would decide, and stops there.

`skills/finance-bank-rec-checks/` in the work folder `~/work/finance`: `SKILL.md`; `scripts/check_rec.py` (the four automatic checks); `scripts/test_planted.py` (their planted errors).

```
---
name: finance-bank-rec-checks
description: Check the operating account bank reconciliation for finance against the controller's standard before the close is signed. Use when the monthly bank rec for account 1010 is prepared or reviewed, when its statement and trial balance are attached, or when the controller asks whether the rec ties.
---

# Operating account bank rec checks

Made with verifier 2.3 on 2026-10-13. Work folder: ~/work/finance; every path below is relative to it. Owner: controller. Used by the controller to sign the close.

## Run

1. Started from another folder, use the work folder's files. Read `checks/bank-rec log.md`. No "checks proven": proof run. "Checks proven" but no "proof passed": only the controller's question is open. Level 1 always: it feeds the close.
2. Read back: "Running <month> bank rec, account 1010, statement <file> and TB <file>, both as of <date>, tolerance 0.00. Right?" Mark anything inferred; wait for a yes.
3. Before showing ours, the controller types the two largest deposits in transit as the deposit log and next month's statement show them.
4. Gates: statement and TB present; same as-of; TB unfiltered, row count matching. Each blocks every check; on a failure, tell the controller which file to pull again.
5. Run `scripts/check_rec.py <statement> <tb> <register> <deposit log>`, compare step 3's amounts, then the pointer check. Proof run: tell the controller what will be broken on a test copy, run `scripts/test_planted.py`; all four caught: log "checks proven <date>".
6. Report everything. Proof to `checks/proof/bank-rec <month>.xlsx`; add the log line.
7. Until "proof passed": show the cleared-check catch in full, the rest in one line; ask "Is there anything here you'd have flagged that these checks didn't?" Log "proof passed <date>: <answer>".

## Rules (verifier 2.3)

<filled in per the template: the verifier's rules and report word for word, then the people-only and Update lines>

## The standard

Source of truth: bank statement for the bank side; trial balance for the book side.
As-of rule: last day of the month, after the books lock.

| Term | Means | In / out | Formula |
|---|---|---|---|
| Outstanding check | Issued by month end, not cleared by the statement date | Voids out | |

| Check | Covers | Compares (direction) | Tolerance | Catches | Planted error | Who, when |
|---|---|---|---|---|---|---|
| As-of gate | Current | Statement date to TB date | Same day | TB pulled before the lock | TB from the day before | Automatic |
| Outstanding vouched | Real | Rec list to check register | Exact | A check never issued | Made-up check number | Automatic |
| Cleared traced | Nothing missing | Statement lines to rec | Exact | A cleared check never marked | Statement line removed | Automatic |
| Reconciliation | Right amount | Adjusted bank to cash per GL | 0.00 | Any unexplained gap | Deposit times 10 | Automatic |
| Largest deposits in transit | Real | Deposit log and next statement | Exact | A deposit that never clears | n/a | Controller, before review |

People only: adjusting entries; marking items cleared.
Never include: full account numbers.
Not checked, by choice: bank fees under 25.00 (controller, 2026-10-13: caught at year end).
Next review: 2027-01-13, or sooner if the bank, account, or TB layout changes.
```

## Without scripts

`sales-store-recap-checks`, a Friday recap email to the regional manager: mechanical checks, but no stable structure to script, so the checks are listed and there is no `scripts/`. Its Run step 5:

```
5. Checks, each reading its source without sight of the draft:
   - Every number and date in the draft against that week's sales report. Exact.
   - The regional manager's last email against the draft: a separate pass lists any question left unanswered.
   - Each attachment's name and date against the latest version.
   - To and Cc against the two people named in the standard.
   Then the pointer check.
   Proof run: tell the sales lead what you will break. On a copy of last week's draft marked as a test, change one number, drop one answer, attach the older file, and add a Cc; re-read to confirm each landed; run the checks; discard the copy. All four caught: log "checks proven <date>".
```
