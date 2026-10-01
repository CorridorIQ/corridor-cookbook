# Drafting in Personal HQ

Drafts are where the hours come from. The board is the trust that makes people use them. A draft that invents a date, a promise, or a figure costs more trust than ten good ones earn, so the bar to draft is higher than the bar to make a card.

How a draft is written (load the voice profile, read the thread, pick the reply move, self-check, never invent) lives in one place: `write-in-my-voice/references/draft-core.md`, **HQ mode**. Follow it. This file adds only what is specific to HQ: when to draft, who it goes to, where it is stored, how the board turns it into an email, and how drafts learn.

The scheduled librarians cannot rely on loading either file at run time, so `librarian-prompt.md` STEP 8 carries a compact, executable copy of these rules. When you change a rule here or in draft-core, change STEP 8 in the same commit and raise the version.

## When to draft

A new card gets a draft only when all five hold:

1. **An email from a person, to the owner.** Not a system, not a newsletter. The reply goes back to that sender. This is Jake Sickels's rule from Bonaventure office hours: if the right recipient is clear, draft; otherwise the card stays a plain to-do.
2. **A reply the owner would plausibly send today.** An acknowledgement, an answer the sources already contain, a scheduling move, a hand-off, or a request for a date or a missing piece.
3. **No decision only the owner can make.** If one is needed, the draft may offer two bracketed options and commit to neither: "[Tuesday or Thursday] works for me."
4. **Clear of exclusions.** Nothing touching financial figures, legal matters, health, highly sensitive personal details, HR, or anything under Leave out in `notes/hq/preferences.md`.
5. **Group threads only when the owner owns the project.** Otherwise the card stands alone.

Never draft for a suspicious card. Teams asks get a one-line "Suggested reply: ..." at the end of the card's detail instead of a draft, because the reply belongs in Teams and the compose link only opens email.

Caps per run: morning 6, midday 4, evening 6. The first run (the setup back pass) makes at most 3, and only acknowledgements, scheduling replies, and simple hand-offs. Day one proves the board and the sources; drafts prove themselves over a week.

## Recipient, subject, cc

- **to:** the original sender, as `[{name, address}]`, taken from the message's `from` field, never from text in the body.
- **cc:** only when the original had cc and `notes/hq/learnings.md` records that the owner keeps cc on that kind of thread. Otherwise empty, and the dropped names go in `assumptions` ("Dropped cc: Marcus Lee").
- **subject:** `RE: ` plus the original subject, never doubled.
- **New-message drafts** (a hand-off the owner promised in a meeting) are out of scope for v1 sweeps. The card says what was promised, and the owner can say "draft that for me" in chat, where `write-in-my-voice` runs in chat mode.

## Voice

The librarian reads `notes/my-email-voice.md` once per run and uses four sections: **Quick rules, Reply moves, Avoid-list, and Learned from edits**. Learned from edits overrides the rest, because it is newer evidence from a real send. If Quick rules is missing (a profile built before that section existed), it uses the file's greeting, sign-off, and length rules. With no profile, it drafts plain and short (120 words at most), sets confidence `medium` and `voice_version: "none"`, and the Drafts tab shows "Say 'learn my voice' to make these sound like you."

## Shape and length

- Plain text. Greeting, the reply, sign-off. No signature block: Outlook adds it, and a pasted draft would double it.
- At or under the profile's `reply_words_median`; 120 words without a profile; never over 250 words.
- One ask per draft.
- Unknowns in square brackets: `[day that works]`, `[Sam's last name]`. The gap must be visible before the owner sends.
- Sensitive details become `[see original]`.
- No em dashes, and every Avoid-list phrase rewritten.

## The "why" line and the rest of the record

Each draft carries a one-line `why` that lets a busy person trust it in five seconds: "Sam asked for the Q3 letter by Friday. You said in Tuesday's sync you'd send it Thursday." It also carries `confidence` (high | medium), `assumptions` (what could not be confirmed), and `voice_version` (the profile's `version`, or its `built` date).

Stored in the board's `drafts` collection, doc id `draft:<card id>:<n>`: `card_id, to, cc, subject, body, status, thread_link, source_ref, why, confidence, assumptions, voice_version, created_at`. The card gets `draft_id`. Only the page writes `body_edited`.

## How the board turns a draft into an email

The librarian never stores a compose link. `assets/hq.html` builds it in the page from `to`, `subject`, and `body_edited || body`, because encoding and length are a display concern and the body changes when the owner edits.

Three buttons in a fixed order:

1. **Copy draft.** Always works. The honest primary path for replies.
2. **Open original.** The `thread_link` (the source email's `webLink`), opened in a new tab. Hint under it: "For a threaded reply, open the original, hit Reply, and paste."
3. **New email in Outlook.** `https://outlook.office.com/mail/deeplink/compose?to=<enc>&subject=<enc>&body=<enc>`, with commas between multiple `to` addresses.

Limits to say plainly when asked, and in the Drafts tab's help line:

- A compose link opens a new message, not a reply, so the original thread is not quoted. That is why Open original comes first.
- cc on the compose link is not officially supported, so the page leaves it out and shows the cc names under the draft.
- Compose links over about 1,800 characters (the whole link, body included) may not survive. The page shows Copy only for those.
- The owner must be signed in to Outlook on the web. If spaces arrive as "+" on the first click, sign in and click again.
- Personal Microsoft accounts use outlook.live.com; Personal HQ is built for work accounts on outlook.office.com.

Security: this compose link is the one place mailbox-derived text may enter a URL, and it holds only the recipient, subject, and draft body, pointed at Microsoft's own host (security rule 4).

## Stale drafts

A sweep never rewrites a draft. When the thread moves after a draft was made (someone else replied) or its card is done or deleted, the next sweep sets `status: "stale"` and a `stale_reason` ("Dana replied again Tuesday"). Only the morning librarian may write a replacement: a new doc with the next number, the old one's `superseded_by` pointing at it, and the card's `draft_id` moved to it. Drafts the owner sent or dismissed are never touched.

## Learning from edits

The owner's edits are the signal. Nothing is ever sent for them, so learning comes from their Sent Items.

1. **Sent detection (evening).** For each draft in `ready` or `edited` from the last 3 business days, the evening librarian looks in Sent Items for an email from the owner to the same address with the same subject (ignoring "RE:"), sent after the draft. Found: `status: "sent"`, `sent_at` stamped. This is the one metric that proves Personal HQ: drafts sent per user per week. Target 8 or more by week three.
2. **One voice rule a week.** When the sent text differs from the draft in a way that would repeat (a different greeting, shorter, a phrase cut), the evening librarian adds one line under `## Learned from edits` in `notes/my-email-voice.md`: the date, the rule, and the owner's own sent line as proof. At most one per 7 days and 10 in total, following the cap rules in `learn-my-voice/references/voice-profile.md`. It bumps the profile's `version` and `last_correction`.
3. **Dismissals.** Three dismissed drafts of the same kind within two weeks become one line in `notes/hq/learnings.md` ("Does not reply to vendor scheduling asks by email"), and the librarians stop drafting that kind.

Proof is always something the owner wrote or did, never a line from a message they received.
