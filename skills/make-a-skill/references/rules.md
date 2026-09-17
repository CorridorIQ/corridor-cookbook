# The 12 rules a business skill follows

Each rule states what to do and the one reason it matters. Sources in brackets.

1. **Write the description as a trigger condition, and make it a little pushy.** Claude scans descriptions to decide what fires. A summary sits there and never triggers; a pushy condition catches the request.
2. **Keep the main file short. Push everything else into `references/`, `examples/`, or `assets/`.** The main file loads every run. Detail read only when a step needs it keeps attention on the work.
3. **Explain the why behind each instruction.** A rule with its reason holds up on the case you did not foresee; a stack of capitalized musts breaks the moment the case is not spelled out.
4. **State the behavior you want, not the one to avoid.** Naming the wrong behavior puts it in front of Claude and makes it more likely, not less.
5. **Keep a gotchas section built from real failures.** The highest-signal part of a skill is the list of ways it actually broke. Add to it each time it breaks again.
6. **Give the skill a memory file, `learnings.md` or a corrections log.** A skill that writes down each correction improves with use instead of repeating the same miss.
7. **Store setup facts once in a small config, and ask with a structured question.** Re-asking the same account, channel, or budget every run wastes the user and drifts. Ask once, store it, reuse it.
8. **End every output-producing skill with one worked example in the real format.** The example shows the shape faster than any description of it, and pins the output so runs do not drift.
9. **Close with a plain Common mistakes or Hard rules list.** The last thing read is the last thing kept. Put the traps there.
10. **Keep one skill to one category of work.** A skill that straddles two jobs triggers on both and does neither cleanly. Split it.
11. **Test on two or three prompts phrased the way a real user would say them, and read the transcript.** The output can look right while the run took a wrong path. The transcript shows the path.
12. **Match the company's writing register: no em dashes, no filler, numbers over adjectives.** A skill is read by the whole team. It should sound like the team wrote it.