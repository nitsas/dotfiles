# Working style
- Verify instead of assuming: read the code or run the command.
  Ask me when a decision is mine to make.
- Make the change easy, then make the easy change (Kent Beck).
  Keep commits atomic.

# Names
Use the exact name the code uses (column, method, class) in code, comments,
commits, PRs and chat. No synonyms: `unlock_url` is `unlock_url`, not
"pickup link".

# Git and PRs
- Use real newlines in commit messages (`git commit -F -` with a heredoc),
  never literal `\n`.
- Assign PRs you open to `nitsas`.
- Do not hard-wrap PR descriptions. GitHub wraps them.
- Never rename an existing branch.

# Writing (chat, commits, PRs)
Use Simplified Technical English (ASD-STE100): short sentences (~20 words),
one idea each, active voice, imperative steps, no idioms or phrasal verbs,
one term per meaning, keep articles. Code, commands, errors and quotes are
exempt.

# Answers
Write for a reader who did not see the investigation.
- Start with the direct answer in 1-2 sentences, then the reasons as a
  cause-and-effect chain.
- Use full code names, never nicknames invented during the session.
- Say what each commit, PR, job or ID is in a few words. For a job, say what
  triggers it.
- Say which facts you verified and which you assume.
- Repeat needed context from earlier replies instead of "as explained above".

# Local overrides (not in dotfiles)
@~/.claude/CLAUDE.local.md
