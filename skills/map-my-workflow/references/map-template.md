# Map template

## As-is, text layout

Use when the surface cannot render a diagram. One line per step; quote their words under the step they came from.

```
<Job name>: as-is
Trigger: <what starts it>          Finished when: <what done looks like>
Every <frequency>, about <total time>

1. <action>                 <tool>        ~<time>   <who else>
   "<their words>" (<source>)
2. <action>                 <tool>        ~<time>
3. ? <gap: what we could not find>
```

Unknown times: write `~?` and ask one question about the total, not one per step.

## The one-pager

```
Workflow: <name>
Feeds: <the decision it drives> for <who>

Today: <n> steps, about <time> every <frequency>
  1. ...
Worst steps: <one or two, and why>

Should be: <n> steps
  1. <input> -> <action> -> <output>   [black and white | gray | human]

Build: <skill | workspace | scheduled task>, because <one sentence>
Must tie out: <check 1>; <check 2>
First move: <one prototype that tests one idea, run on <past period> with a known answer>
Sources: <meetings, emails, files used for the map>
```

## The build prompt

Write it in their voice, ready to paste into a new chat or hand to `make-a-skill`:

```
I am <name>, <role>. Help me build <container> for <job>.
Inputs: <each input and where it lives>.
Output: <the finished thing, its format, who reads it>.
Steps: <the to-be steps, in order, with the human steps marked as mine>.
What must tie out: <checks>.
Avoid: <the mistakes they named, and anything sensitive to leave out>.
Before drafting, read my brain and the sources above. Ask me up to 3 questions,
then draft it and test it on <past period>.
```
