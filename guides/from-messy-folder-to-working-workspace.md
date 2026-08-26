# From messy folder to working workspace

A walkthrough of the core Corridor Cookbook workflow: take a folder full of mixed files, turn it into an organized workspace Claude can work in, and end with a scheduled process that produces real output. This is the narrative companion to [`skills/setup-workspace/SKILL.md`](../skills/setup-workspace/SKILL.md) and [`skills/make-a-plan/SKILL.md`](../skills/make-a-plan/SKILL.md). No code required. Everything here works in Claude Cowork on the desktop app, and equally in Claude Code.

The running example is a monthly investor report: financial exports, a PDF with commentary, last month's deck, a few screenshots, and a template the finished deck should match. Swap in your own recurring work; the steps are identical.

## The idea: the folder is the environment

Claude chat is ping pong. You upload a few files, it thinks, it answers, and next session it remembers nothing. That breaks down the moment real work needs Claude to see ten things at once: a multi-tab Excel export, a PDF from another system, an email thread, last month's deck.

Cowork changes the shape of the work. Instead of uploading files into a chat, you point Claude at a real folder on your computer and it works inside it. It reads the files, moves them, writes new ones. The folder becomes the environment, the same way a well-organized cabinet drawer is an environment: everything labeled, everything findable, and a guide to what lives where.

Set the folder up once and every future session, in Cowork or Code, starts already knowing the job.

## When NOT to do this

Skip all of this for one-off tasks. A single research question, a quick email draft, a document you will never produce again: just ask Claude directly. Setting up a workspace costs time and tokens, and it pays off only on work that repeats or work you want to share and build on.

Good candidates: investor reporting, board packages, financial analysis on a cadence, recurring memos and decks. The test: would you hand this to an intern with a folder of documents and a set of instructions? Then it is worth a workspace.

## Step 1: Make a project and point it at a folder

1. In Claude Cowork, create a new project. Name it after the work: "Monthly Investor Report". The project is just a workspace inside Claude; it does not create a folder on your computer.
2. Make a folder on your computer and dump in everything relevant, messy is fine: financial exports, commentary PDFs, last month's deck, the template you want the output to match, screenshots, email exports. Local copies, not live files. The rule: everything you would hand an intern if they were doing this work.
3. In the project, add the folder. Cowork asks for permission to read and edit inside it. Say yes.

The context that belongs here is inputs and outputs: real exports, real documents, real reference material. It is not the same context as a memory or "brain" tool, which holds who you are and what you work on. The folder holds the actual materials of the work.

One habit worth adopting now: dictate your instructions with a voice tool instead of typing. You will explain more, and the setup gets better the more you brain-dump about what the work actually is.

## Step 2: Run setup-workspace

Tell Claude what the folder is and ask it to set the workspace up. Something like:

> You have access to a folder on my computer. This is where I do my monthly reporting for my investors. I dumped in the financials, commentary notes, an email thread, the deck template, and my logo. Organize this into a neat place to do the work. Use the setup-workspace skill.

The [`setup-workspace`](../skills/setup-workspace/SKILL.md) skill turns the messy folder into this:

```
investor updates/
  CLAUDE.md          <- agents read this first
  README.md          <- the project handbook
  index.md           <- the file map
  learnings.md       <- repeated friction, written down
  inputs/            <- monthly exports land here
  reference/         <- the format to match
  outputs/           <- finished work
  plans/             <- specs and handoffs
```

Three files do the heavy lifting:

- **CLAUDE.md** is the first thing any AI agent reads when it enters the folder. It says, in a few short paragraphs, "this is the workspace where the monthly investor report gets made, here is how the work flows, here is where things live." Without it you re-explain the job every single session. With it, a brand new session starts already briefed.
- **README.md** is the human handbook: what the project is, who reads the output, when it ships.
- **index.md** is the file map. As part of the skill, the [`indexer`](../agents/indexer.md) agent reads far enough into each file to say what it is, then writes down what lives where. Claude reads this fast, so the folder stays navigable as it grows.

These are all `.md` files, plain text files. AI reads markdown natively, which is why the whole system is built on it. Nothing here is hidden or magic; open any of them and read exactly what Claude will read.

After the scaffold, the skill interviews you: what gets made here, who reads it, when it ships. Answer plainly. Those answers become the CLAUDE.md and README, which is why future sessions never need the explanation again.

Drop your format target into `reference/`. If you have a deck, a Word document, or an Excel model whose look you want to match, download a local copy and put it there. Claude will study the fonts, colors, and structure and replicate them, which is the difference between output that looks AI-generated and output that looks like yours.

## Step 3: An agent is just a text file

"Agent" sounds mystical. It is not. An agent is a text file that says what a worker should do. Open [`agents/researcher.md`](../agents/researcher.md) or [`agents/indexer.md`](../agents/indexer.md) in this repo: a few paragraphs of plain instructions, a model choice, a list of tools. That is the whole thing.

So when a piece of your workflow is repeatable and you know exactly what good looks like, you can ask Claude to make an agent for it:

> Make an agent in this folder that drafts the one-pager in my tone. Put it in an agents/ folder.

Claude writes a small text file: "You draft the monthly one-pager. Write like this, not like that. Pull numbers from inputs/, match the format in reference/." Next month, that agent does the draft and you review it.

Scale the same idea and you get real automation: agent one researches, agent two drafts, agent three checks, agent four ships. You do not need to build that on day one. But every rung of that ladder is the same move: encode what you know into a plain text file so the work runs without re-explaining it.

Skills and agents are close cousins. A skill is an SOP you invoke by name; an agent is a worker that executes one job inside it.

## Step 4: Use make-a-plan when the work is big or vague

For anything beyond a single ask, invoke [`make-a-plan`](../skills/make-a-plan/SKILL.md), or just say "I have a complex deck process, help me figure out if we can do one piece of it well." The skill interviews you in rounds until nothing is silently assumed: scope, audience, format, deadline, what done looks like. Then it writes the plan to `plans/` and stops. That is why the workspace has a plans folder; plans are files, so any later session or agent can pick one up and execute it.

## Step 5: Put it on a schedule

Once the workspace runs the process well with you in the loop, you can schedule it. In Cowork, create a scheduled task: "Draft and build the investor deck at 9am on the last Friday of the month." Each cycle you drop the new month's actuals into `inputs/`, the scheduled run reads last month's output and the reference, and a draft lands in `outputs/` for your review.

Do not rush here. You do not have to automate everything, and you should not schedule a process you have not run manually at least once. Automation is the last step, not the first.

## Start small

Two closing rules from every deployment session we have run:

1. **One workflow, not your whole file system.** This does not replace your document management system. Do not point Claude at hundreds of files. Pick one recurring deliverable, set up one folder, and run one cycle end to end. Even taking a single piece of a big memo or deck process and making it good is a win you can build on.
2. **Review more, produce less.** This workflow does not remove you from the loop; it moves you up it. You spend less time assembling and more time reviewing, and the deliverable ships faster and better. When you notice the same correction twice, write it into `learnings.md`; that is your next skill.

The whole system reduces to one sentence: set up a folder with the right context, and let plain text files carry what you know into every future session.

## Where to go next

- [`skills/setup-workspace/SKILL.md`](../skills/setup-workspace/SKILL.md) and its [`references/`](../skills/setup-workspace/references/folder-structures.md) for the three folder layouts
- [`skills/make-a-plan/SKILL.md`](../skills/make-a-plan/SKILL.md) for the planning interview
- [`skills/fresh-start/SKILL.md`](../skills/fresh-start/SKILL.md) when a session gets long and slow
- [`skills/model-guide/SKILL.md`](../skills/model-guide/SKILL.md) before you spend Opus on something Sonnet handles
- [`examples/monthly-report-assembly/`](../examples/monthly-report-assembly/README.md) to try the whole loop on fictional data
