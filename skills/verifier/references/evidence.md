# Evidence by medium

The deliverable carries no AI marks. The proof file is separate and keyed to it: anyone can follow a number from one to the other.

## The proof file

Named "<job> proof <instance> <period>" ("Comp report proof Fieldhouse 2026-09-23"); no instance when the job has only one. It holds:

- Job, period, run date, level, who ran it, who signed and when.
- The full show-your-work report, all five parts.
- Where a source has rows, counts per source: in, used, excluded with the reason.
- The differences that passed within tolerance, totaled.
- On a proof run, each planted error, the check that caught it, both sides.

Where it is kept: `references/job-skill.md`, Where it goes (Log and proof). With no job skill, beside the deliverable in the work folder's `checks/proof/`, or handed back in a chat.

## Spreadsheets

- The proof is a separate workbook, one row per output cell, in the report table's columns (Output: sheet and cell; Source: file > sheet > cell or row range, with any filter). The Label column tells typed values (found) from formulas (calculated). Typed values carry the most risk.
- Check formulas live in the proof workbook and point at the deliverable, so anyone can re-run them by recalculating.
- In the deliverable, a number derived from cells in the same workbook is a formula referencing them, not a typed copy. A value from another file is typed in, its source in the proof file: links to outside files break when the workbook is sent on.
- Mark a working copy only when the owner asks: ask what the workbook's colors already mean, use their convention, write the key into that copy. Before anything ships, marks and comments come out; check the shipped copy has none.

## Emails, documents, recaps

- Before anything is sent, the proof covers every recipient and copy, every attachment and its version, and every number, date, and name against its source. A person sends.
- One proof row per claim: the sentence, its label, the source (meeting and timestamp; email subject and date; file and page), the words or value as read.
- Facts, opinions, decisions stay apart. A fact quotes someone's words; an opinion is labeled with whose it is; a decision has an owner and a date.
- The shipped document carries sources only where the owner's own documents do: footnotes in a board memo, none in a note to a client.

## Lists and boards, including voice notes

- Each item carries its own source ("You said, Oct 13, 2:14 pm"; `Email "Camera quote", Oct 9`) and, for voice, the words that produced it.
- Before saving, read back the parts that must be exact (property, owner, date) and get a yes.
- Every ask, promise, and deadline in the source maps to an item, or to "not an item" with the reason. Give the count: "Your note had 9 asks: 8 are on the board, 1 was a question for you."
- An item with no source stays off the list. A blank field beats a guessed one.

## Quotes, intakes, tickets

- Every price, date, and promise traces to the owner's price list, schedule, or a named person's yes. Anything else is Not run and goes to a person.
- A ticket is done when the person it was for confirms it works, not when it looks fixed to us.

## Code and systems

- The proof is what was run and what came back: the command, its output, the environment. A test counts only if it fails without the change and passes with it.
- Drive the real thing as a user would (the page, the command, the endpoint) and capture the result; never read the code and reason that it works.
- The shipped change carries no debug output or temporary markers; the proof lives in the pull request description or a proof file.
