# Evidence by medium

The deliverable ships the way the owner would send it, with no AI marks. The proof file is separate and keyed to it, so anyone can follow a number from one to the other.

## The proof file

Named "<job> proof <instance> <period>", for example "Comp report proof Fieldhouse 2026-09-23"; leave out the instance when the job has only one ("Bank rec proof 2026-09"). It holds:

- Job, period, run date, level, who ran it, who signed and when.
- The full show-your-work report: result line, failures, not run, not checked, and the table.
- Where a source has rows, counts per source: in, used, excluded with the reason.
- The differences that passed within tolerance, totaled.
- On a proof run, each planted error, the check that caught it, and both sides.

Amounts, account numbers, and customer details go in proof files, never in a job skill.

## Spreadsheets

- The proof is a separate workbook with one row per output cell: sheet and cell, value, label, source (file > sheet > cell or row range, with any filter), source as-of, value as read, check, result.
- Check formulas live in the proof workbook and point at the deliverable, so anyone can re-run them by recalculating.
- Inside the deliverable, a number derived from other cells in the same workbook is a formula that references them, not a typed copy. A value from another file is typed in, with its source in the proof file, because links to outside files break when the workbook is sent on.
- The Label column tells typed values (found, the riskiest) from formulas (calculated).
- Mark a working copy only when the owner asks: ask what the workbook's colors already mean, use their convention, and write the key into that copy. Before anything ships, marks and comments come out; check the shipped copy has none.

## Emails, documents, recaps

- Before anything is sent, the proof covers what can't be taken back: every recipient and copy, every attachment and its version, and every number, date, and name against its source. A person sends.
- One proof row per claim: the sentence, its label, the source (meeting and timestamp; email subject and date; file and page), and the words or value as read there.
- Facts, opinions, and decisions stay apart. A fact quotes someone's words. An opinion is labeled with whose it is. A decision has an owner and a date.
- The shipped document carries sources only where the owner's own documents do: footnotes in a board memo, none in a note to a client.

## Lists and boards, including voice notes

Each item carries its own evidence: the source ("You said, Oct 13, 2:14 pm"; `Email "Camera quote", Oct 9`) and, for voice, the words that produced it.

- Read back the parts that must be exact before saving, and get a yes: "Riverside, final walk with the GC, you, by Oct 20. Right?"
- Every ask, promise, and deadline in the source maps to an item, or to "not an item" with the reason. Give the count: "Your note had 9 asks: 8 are on the board, 1 was a question for you."
- An item with no source stays off the list. A blank field beats a guessed one.

## Quotes, intakes, tickets

- Every price, date, and promise traces to the owner's price list, schedule, or a named person's yes. Anything else is Not run and goes to a person.
- A ticket is done when the person it was for confirms it works, not when it looks fixed from the admin side.

## Code and systems

- The proof is what was run and what came back: the command, its output, and the environment it ran in. A test counts only if it fails without the change and passes with it.
- Drive the real thing the way a user would (the page, the command, the endpoint) and capture the result, rather than reading the code and reasoning that it works.
- The shipped change carries no debug output or temporary markers; the proof lives in the pull request description or a proof file.
