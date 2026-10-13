# Evidence by medium

The deliverable ships the way the owner would send it, with no AI marks in it.
The proof lives in a separate proof file, keyed to the deliverable, so anyone can open both and follow a number from one to the other.

## The proof file

Named "<job> proof <instance> <period>", for example "Comp report proof Fieldhouse 2026-09-23". Leave out the instance when the job has only one, as in "Bank rec proof 2026-09". It holds:

- Job, period, run date, level, who ran it, who signed and when.
- The full show-your-work report from SKILL.md: result line, failures, not run, not checked, and the table.
- Where a source has rows, counts per source: in, used, excluded with the reason.
- On a proof run, each planted error, the check that caught it, and both sides.

Amounts and details belong in the proof file, never in the job skill. `references/job-skill.md` says where proof is kept.

## Spreadsheets

- The proof is a separate workbook with one row per output cell: sheet and cell, value, label, source (file > sheet > cell or row range, with any filter), source as-of, value as read, check, result.
- Check formulas live in the proof workbook and point at the deliverable, so anyone can re-run the checks by recalculating, with or without Claude.
- Inside the deliverable, a number derived from other cells in the same workbook is a formula that references them, not a typed copy. A value brought in from another file is typed in, and its source goes in the proof file, because links to outside files break when the workbook is sent on.
- The Label column tells typed values (found) from formulas (calculated). Typed values carry the most risk.
- Marks on a working copy happen only when the owner asks, usually in the first weeks while they are learning to trust the work. Ask first what the workbook's colors already mean, use their convention, and write the key into that copy. Before anything ships, the marks and comments come out, and you check the shipped copy has none.

## Emails, documents, recaps

- Before anything is sent, the proof covers the parts that can't be taken back: every recipient and copy, every attachment and its version, and every number, date, and name against its source. Sending is a person's action.
- The proof file has one row per claim: the sentence, its label, the source (meeting and timestamp; email subject and date; file and page), and the words or value as read there.
- Facts, opinions, and decisions stay apart. A fact quotes someone's words. An opinion is labeled with whose it is. A decision has an owner and a date.
- The shipped document carries sources only where the owner's own documents do: footnotes in a board memo, none in a note to a client.

## Lists and boards, including voice notes

A list is a working tool, so its evidence sits on each item: the source ("You said, Oct 13, 2:14 pm"; `Email "Camera quote", Oct 9`) and, for voice, the words that produced the item.

- Read back the parts that must be exact before saving: "Riverside, final walk with the GC, you, by Oct 20. Right?" For specific values like these, a read-back and a yes is the right check.
- Every ask, promise, and deadline in the source maps to an item, or to "not an item" with the reason. Give the count: "Your note had 9 asks: 8 are on the board, 1 was a question for you."
- An item with no source stays off the list. A blank field beats a guessed one.

## Quotes, intakes, tickets

- Every price, date, and promise traces to the owner's price list, schedule, or a named person's yes. Anything else is Not run and goes to a person.
- A ticket is done when the person it was for confirms it works, not when it looks fixed from the admin side.

## Code and systems

- The proof is what was run and what came back: the command, its output, and the environment it ran in. A test counts only if it fails without the change and passes with it.
- Drive the real thing the way a user would (the page, the command, the endpoint) and capture the result, rather than reading the code and reasoning that it works.
- A planted error for code is a small change to a copy, such as a flipped condition or a deleted line; at least one test or check must fail on it.
- The shipped change carries no debug output or temporary markers; the proof lives in the pull request description or a proof file.
- Deploying, migrating, and deleting data are a person's action.
