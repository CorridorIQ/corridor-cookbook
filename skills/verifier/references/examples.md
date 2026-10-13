# Worked examples

Everything here is made up. It shows what finished looks like; build the owner's standard from their own answers.

## One finished standard per kind of work

| Work (ceiling) | Key checks | Distinctive check, or the gap the interview found | Planted error | People only |
|---|---|---|---|---|
| Bank rec (1, feeds the close) | As-of gate; outstanding checks vouched to the register; adjusted bank to cash per GL, 0.00 | "How would you know if a check cleared and nobody marked it?" Added: statement traced forward to cleared or outstanding | A statement line removed | Adjusting entries |
| Sales with trade-ins as negative-quantity lines | Definition gate before any pull; net sales control total to the system's own | Net sales = all lines; gross = Qty > 0; units = count of lines with Qty > 0, not the sum of Qty | A trade-in flipped positive | |
| Month-end accruals (1) | Each accrual vouched to a PO, contract, or receipt; roll-forward opening + new - reversed = closing, tied to the TB | Every receiving-log line with no invoice traced to an accrual: vouching cannot find unrecorded bills | A receiving line deleted: the trace caught it, the vouch did not | Posting |
| Voice note into a board (2) | Every ask is an item or "not an item, why", with the count; property, owner, date read back | Each status labeled "you saw it" or "the sub says" | One ask removed: "9 asks, 8 items" Failed | Never include: alarm or gate codes |
| Weekly recap (2), listed checks | Every line traces to who said it and when | Facts, opinions, decisions labeled; a follow-up is done only when a contact happened | A sentence nobody said | Never include: card details; clients as initials |
| Repair quote (1, a promise) | Every price from the price list, else Not run to the operations director; every repair asked for or declined listed | Condition and photos before work; date checked against the bench | A price not on the list | The quote |
| Access review (1) | Each account traced to the HR roster; each person to the accounts their role needs; licenses to accounts | An account with no active person is a finding | A terminated employee's account | Disabling access |
| Big email (one-off) | The three questions; each figure to its source; each ask answered; latest attachments | To and Cc against who the sender named, and what each reader may see | One figure changed | Sending |
| Code change (1 for deploy) | `verify-<app>` drives it; every caller tested; tests ran on this branch and environment; no secrets in diff or logs | "How would you know if this passed only because of something left from an earlier run?" Added: proof on a clean environment | A flipped condition: a test went red | Deploy, migrate |

## A job skill, filled in

```
skills/bank-rec-checks/
  SKILL.md
  scripts/check_rec.py      as-of gate, outstanding vouch, cleared trace, reconciliation
  scripts/test_planted.py   TB from the day before, made-up check number, statement line removed, deposit times 10
```

```
---
name: bank-rec-checks
description: Check the operating account bank reconciliation against the controller's standard before the close is signed. Use when the monthly bank rec for account 1010 is prepared or reviewed, when its statement and trial balance are attached, or when the controller asks whether the rec ties.
---

# Operating account bank rec checks

Made with verifier 2.3 on 2026-10-13. Owner: controller. Used by the controller to sign the close.

## Run

1. Read `checks/bank-rec log.md`. No "checks proven": proof run. "Checks proven" but no "proof passed": only the controller's question is open. Level 1 always: it feeds the close.
2. Read back: "Running <month> bank rec, account 1010, statement <file> and TB <file>, both as of <date>, tolerance 0.00. Right?" Mark anything inferred. Wait for a yes.
3. Before showing ours, the controller types the two largest deposits in transit as the deposit log and next month's statement show them.
4. Gates: statement and TB present; same as-of; TB unfiltered, row count matching. Each blocks every check; on a failure, tell the controller which file to pull again.
5. Run `scripts/check_rec.py <statement> <tb> <register> <deposit log>`, compare step 3's amounts, then the pointer check. Proof run: say what will be broken on a test copy, run `scripts/test_planted.py`; all four caught, log "checks proven <date>".
6. Report everything. Proof to `checks/proof/bank-rec <month>.xlsx`; add the log line.
7. Until "proof passed": show the cleared-check catch in full, the rest in one line, and ask "Is there anything here you'd have flagged that these checks didn't?" Log "proof passed <date>: <answer>".

## Rules (verifier 2.3)

<copied unchanged from the template>

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

Without scripts (a Friday store recap), step 5 lists each check: "Every number and date in the draft against that week's sales report, read without sight of the draft. Exact." The proof run plants by hand on a marked copy of last week's draft (one number changed, one answer dropped, the older file attached, a Cc added), re-reads to confirm each landed, then runs the checks.
