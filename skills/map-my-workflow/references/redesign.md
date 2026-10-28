# Redesign reference

Used in steps 4 to 6 of map-my-workflow.

## Waste tests

When factories went electric, most swapped the steam engine for one big motor and kept the old shafts and layout; little changed until they redesigned the floor around a motor on every machine (Paul A. David, The Dynamo and the Computer, 1990). Adding AI to an unchanged process repeats that mistake. Every as-is step gets these tests. A step that fails one is waste worth redesigning.

| Tell | What it sounds like | Usual to-be move |
|---|---|---|
| Copy and paste | "I copy it into Claude, then paste the answer back." | A connector reads the source; the output lands where it is used. |
| Re-explaining context | "Every time I have to tell it who this client is." | A note in their brain or folder rules that every run reads. |
| Waiting | "I wait for the regional numbers to come in." | The run starts when the input lands, not when they remember. |
| Re-typing between systems | "I pull it from the export and key it into the deck." | One step reads the export and fills the template. |
| Checking by redoing | "I rebuild the total to make sure it's right." | A check that ties out against the source and flags only misses. |
| One at a time | "I open each one and deal with it." | One pass over the batch; they review the batch on one page. |
| Nobody reads it | "I'm not sure who uses this section." | Cut the step. Confirm with the reader first. |

The question for every step, in the user's words: would you still do this step if you started from scratch?

## Outcome one level up

Before designing, name the decision the work feeds and who makes it ("the Friday owner call", "whether we bid"). Then ask what that person most needs from the output. A to-be built for that decision may drop half the as-is.

## Sorting the to-be

| Mark | Test | Examples |
|---|---|---|
| Black and white | A rule or a check can do it, and you can prove it is right without redoing it. | Group every email by sender. Totals tie to the export. Every row has a source. |
| Gray | AI drafts it well, but someone has to judge it. | A reply, a summary, a variance explanation, a recommendation. |
| Human | Only this person should do it. | Sending, approving, the relationship call, anything with their name on it. |

Push steps toward black and white where you can: a gray step with a clear check becomes trustworthy. Never move a human step to AI to save time.

## Picking the container

| Signal | Container | Hand-off |
|---|---|---|
| Same how-to, they start it, mostly one input | Skill | `make-a-skill` |
| Several inputs, files in and out, history that matters | Workspace (a folder with rules) | `start`, then `scaffold` |
| Same work on a fixed rhythm, no input from them to begin | Scheduled task running a skill or workspace | Build the skill or workspace first, then schedule it |

If two fit, pick the smaller one. A skill that works beats a workspace that is half built.
