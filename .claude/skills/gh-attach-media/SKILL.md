---
name: gh-attach-media
description: Upload screenshots, images or videos to a GitHub PR description or comment with `gh ... --attach`. Use when a PR needs before/after screenshots, a screen recording or any media.
---

# Attach media to a GitHub PR with `gh`

`gh pr create`, `gh pr edit` and `gh pr comment` have an `--attach` flag.
It uploads an image or video and puts it in the body. Do not say that
GitHub has no upload API, and do not commit images to the repo as a workaround.

Verified in `gh` 2.103.3. If `--attach` is missing, run `gh --version` and
tell the user to upgrade `gh`.

## Commands

```
gh pr create --attach './login.png#The login error state'
gh pr edit 23 --attach ./before.png --attach ./after.png
gh pr comment 13 --attach './login.png#The login error state'
```

- Alt text goes after `#`. Without it, the filename is the alt text.
- Maximum 50 files per command. Repeat the flag for more files.
- Videos render as a player. They have no alt text.

## Where the media goes in the body

- Without a reference in the body, the attachment is appended at the end.
- To place it in a section, write a reference to the local file in the body:
  `![Before](./before.png)`. `gh` rewrites it to the uploaded asset URL.
  Use this with `--body` or `--body-file`. Paths in `--body-file` are relative
  to that file, then to the working directory.
- A reference already in the body keeps its own alt text.
- `gh pr edit` without a body flag keeps the existing body and appends the
  attachment. To add media in the middle of an existing body, read the body
  (`gh pr view --json body -q .body`), add the references, then pass it
  with `--body-file`.

## Failure

If some uploads fail, the command still creates or updates the PR, prints the
URL and exits with a non-zero status. Check the output for the failed files
and run the command again for them only.

## Notes

- The upload is outward-facing. Check that screenshots show no secrets,
  customer data or internal URLs before you upload.
- In the yogurt repo, also follow the PR rules in `CLAUDE.local.md`
  (labels, assignee, `git testme`).
