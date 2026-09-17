---
name: monthly-budget-close
description: Use at month end when Dana closes the marketing budget, says "close the budget", "do the spend close", "reconcile marketing spend", or drops the monthly spend export and asks for the close. Produces the two-section Marketing Spend Close from one export.
---

# monthly-budget-close

The monthly close turns one spend export into the Marketing Spend Close: what each channel spent against budget, and which paid items have not delivered yet. The second section is the point. Paid is not the same as done, and a forecast that treats them as the same reads wrong the next month.

## Steps

1. **Read the export.** Take the CSV from `inputs/` (columns: date, channel, vendor, campaign, amount, status, delivered, flight_end). Read the channel budgets from `references/channel-budgets.md`. Done when every row has a channel that matches a budget line.
2. **Build Section 1, spend by channel.** Sum amount by channel. For each channel show budget, actual, and variance (budget minus actual; positive is under). Add a total row.
3. **Build Section 2, paid but not done.** Flag every row where status is Paid and delivered is No, or flight_end is after the close date or blank. List vendor, campaign, amount, and flight_end. Total the amount. These are candidates, not conclusions.
4. **Hand Section 2 to Dana.** She confirms which flagged items truly have not delivered. The skill never marks an item done on its own; only Dana knows what shipped.
5. **Write the close.** Two sections, in order, in the format under Worked example. Save as `outputs/YYYY-MM_marketing-spend-close.md`.

## Judgment that stays human

Whether a paid item is really "not done." The flag is mechanical: paid, not delivered, future or missing flight end. The call is Dana's, because delivery is something she saw and the ledger did not record.

## Checks before done

- Section 1 total actual equals the sum of every row's amount. No row dropped.
- Every paid-but-not-done amount also sits inside a Section 1 channel. The two sections reconcile.
- Channel names match the budget file exactly, so nothing lands in the wrong line.

## Worked example

From `inputs/2026-08_marketing-spend-export.csv`:

**Marketing Spend Close, August 2026**

*Section 1. Spend by channel*

| Channel | Budget | Actual | Variance |
|---|---|---|---|
| Paid Search | 15,000 | 14,300 | +700 |
| Paid Social | 12,000 | 12,200 | -200 |
| Content | 10,000 | 11,300 | -1,300 |
| Events | 14,000 | 15,400 | -1,400 |
| Email | 2,500 | 2,200 | +300 |
| **Total** | **53,500** | **55,400** | **-1,900** |

*Section 2. Paid but not done (money out, value not yet in)*

| Vendor | Campaign | Amount | Flight ends |
|---|---|---|---|
| Summit Booth Co | Fall Roadshow Deposit | 12,000 | 2026-11-04 |
| Brightpost Studio | Case Study Series | 5,000 | 2026-10-15 |
| Brightpost Studio | Video Explainer | 4,500 | none on file |
| Print Vendor | Roadshow Collateral | 3,400 | 2026-11-04 |
| **Total flagged** | | **24,900** | |

Dana confirms which of the 24,900 is truly undelivered before it feeds next month's forecast.

## Common mistakes

- **Treating the flag as the answer.** Section 2 is a list of candidates. Dana decides which are done.
- **Reconciling to the wrong total.** Section 2 amounts are already inside Section 1. They were paid, so leave the actual alone.
- **A new channel in the export with no budget line.** Stop and ask Dana for the budget rather than guessing one.

## Gotchas

Built from real closes. Add a line each time a flag turns out wrong; see `learnings.md`.

- A blank flight_end usually means the work shipped and no end date was logged, not that it is open. Confirm with Dana before flagging.
- Deposits (the word "Deposit" in a campaign) are almost always paid-but-not-done. Expect them in Section 2.
