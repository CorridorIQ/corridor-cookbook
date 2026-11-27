# Corridor Cookbook

![Documents flowing through a gate and coming out as organized streams](assets/cover.jpg)

Corridor Cookbook is an open-source collection of skills and agents for repeatable knowledge work in Claude Code and Claude Cowork. Each skill is a recipe you invoke by name. Use the Cookbook to set up a workspace, turn a loose idea into a plan, and check the finished work. Workspaces it creates can also be opened in Codex and other AI tools; the plugin itself is for Claude.

The Cookbook is separate from the Corridor Context platform. If your team uses Corridor Context, [connect Claude to Corridor Context](https://www.corridorcontext.com/docs/connect-your-ai/claude/) to use your Individual Brain and Corridor Capture meetings in recipes that support them. Installing the Cookbook does not connect those sources.

## Install

### Claude Code

On Claude Code 2.1.275 or later, run this inside Claude Code:

```
/plugin install corridor-cookbook --marketplace CorridorIQ/corridor-cookbook
```

On older versions, add the marketplace before installing:

```
/plugin marketplace add CorridorIQ/corridor-cookbook
/plugin install corridor-cookbook@corridor-context
```

### Claude Cowork

If your organization shares the Cookbook with you, look for it under **Customize > Plugins** in the Claude desktop app. The commands above are for Claude Code only.

## The chain

Six skills that run in order, from a vague idea to a finished output that improves the next run. Start with `start` and follow where it leads, or call any one on its own.

| Skill | What it does |
|---|---|
| `start` | Takes your brain dump, plays it back until you agree, then reads what you pointed to (splitting big piles across helper agents) and asks only the decisions files can't answer: which source wins, what the headline word means, what needs your yes. Writes nothing; hands the paragraph to scaffold. |
| `scaffold` | Builds the folder: AGENTS.md for the rules (plus a one-line CLAUDE.md that points Claude to it), NOW.md, README, sources, rules, and an inbox. Sets the first run on a past period whose answers you know, and offers a practices note and the verifier. |
| `plan` | Turns the start answers into a one-page plan in `plans/`, plain English, six fields of front matter. Stops for your approval before anything runs. |
| `run-plan` | Runs the approved plan. It delegates independent steps to Sonnet agents in parallel and keeps steps that need broader judgment in the main session. If agents aren't available, it runs the steps itself. Ends by running `learn`. |
| `learn` | Records evidence-backed rules that change the next run. It keeps a local copy and mirrors promoted rules to your Individual Brain when connected. |
| `improve` | Reads the learnings, groups them by the skill they touch, and writes one proposal per skill into an `improvements.md` inbox. Never edits a skill itself. |

The work teaches the cookbook: `learn` writes the rule, `improve` proposes the skill edit, and `make-a-skill` turns a repeated job into its own skill.

`make-a-skill` helps you find which parts of your own work deserve a skill, then shapes that skill around your workflow, installs it in the AI tool you use, and tests it on the way you would actually ask for it. The master copy stays in your folder.

## Also in the box

| Skill | What it does |
|---|---|
| `drivers-seat` | Keeps you in the driver's seat before anything sizable gets built or analyzed. Pins down the outcome and your own best guess, surfaces what you haven't considered through one question at a time and rough visuals, and ends in a one-page HTML spec of intent you can sign. Says plainly when the answer is not to build it. |
| `map-my-workflow` | Maps one recurring job as it runs today, built from your own meetings, notes, and email, then questions every step, designs how it should run, sorts each step into what a check can do, what AI drafts, and what stays yours, and picks one thing to build with a first move for this week. Hands off to `start` or `make-a-skill`. |
| `verifier` | Checks work against your own standard, with every number beside the place it was read, and builds a checks skill for each recurring job. Proves each check by planting an error it must catch. By Luke Anderson. |
| `teach` | Explains what the AI just did in plain English, with a chalkboard picture that shows inline in Claude chat, Cowork, and the Codex app. Runs the teacher agent on Sonnet. |
| `learn-my-voice` | Builds a style profile from emails you actually sent. It saves the approved profile to your Individual Brain when connected, or hands it back in chat. |
| `write-in-my-voice` | Drafts and replies to email in that voice, checking every draft against the profile before showing it. Never sends without your go. |

## Agents

Four agents ship with the plugin, all configured to use Sonnet:

- **researcher** reads files and sources and returns a tight synthesis. It never edits anything.
- **designer** drafts and shapes a plan step's output in the real format it needs to land in.
- **indexer** catalogs what lives where in your folder and keeps `index.md` current.
- **teacher** writes the lesson the `teach` skill shows: plain English plus one chalkboard picture.

## Try it

`examples/monthly-report-assembly/` is a hands-on exercise with fictional data: point Claude at it and ask for the August report. The interesting findings are in the numbers.

## Go deeper

The official Claude Code docs are worth your time, in this order:

1. [Common workflows](https://code.claude.com/docs/en/common-workflows). The best starting point; it even covers working in notes and non-code folders, which is exactly what this cookbook does.
2. [Best practices](https://code.claude.com/docs/en/best-practices). Why short CLAUDE.md files win, when to delegate to agents, and how to have Claude show evidence instead of asserting success.
3. [Prompt library](https://code.claude.com/docs/en/prompt-library). Ready-made prompts; the interview-to-spec and match-my-voice patterns transfer straight to knowledge work.

## Credits

The interview in `start` is directly inspired by Matt Pocock's [grilling skill](https://github.com/mattpocock/skills). Thanks, Matt.

MIT license. Built by [Corridor Context](https://corridorcontext.com).
