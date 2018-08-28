# How to Contribute

## Project Organization

The lab manuals and associated style files are stored in `physics325/manuals`.
Only actual source files should be committed to the repository: no intermediate or final `TeX` output should ever make its way into the repository.

## Contributing Changes

Anyone can submit possible changes to the lab manuals via a GitLab merge request.

## Administration

If you think you should have Maintainer access but don't, it's probably because you logged into GitLab via your UW-Madison NetID.
That way of authenticating doesn't give you a real GitLab account, which you'll need to actually commit changes.
Go to Settings > Password (upper right corner, dropdown menu to Settings, then Password in the menu on the left).
Set a password - this is for your "actual" GitLab account, which you're currently accessing purely through its connection to your NetID.

Whatever edits you make to the manuals locally should eventually be pushed back up to the GitLab repository.
Minor edits can probably be `commit`ed and `push`ed directly into the `master` branch.
Major edits should go into a new branch first, then `merge`d when they're ready.
The goal should be for the `master` branch to be a consistent, usable, "production-ready" set of lab manuals at all times.

## Lab Manual Style

* We aim for a sparse style.
  Provide only the necessary information, without major diversions.
* Do not include material from other sources (other than, possibly, figures that represent real data that are impossible to replicate using `tikz`).
