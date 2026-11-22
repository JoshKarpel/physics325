# How to Contribute

## Project Organization

The lab manuals and associated style files are stored in `manuals/`.
Only source files belong in the repository:
no intermediate or final TeX output (`.aux`, `.log`, `.pdf`, and so on) should be committed.
The published PDFs are built from source by CI; see `README.md`.

## Contributing Changes

Anyone can propose changes to the lab manuals by opening a pull request on GitHub.
If you don't have write access to the repository, fork it, push your changes to a branch on your fork,
and open the pull request from there.

Every pull request compiles all the manuals,
so a change that breaks the build shows up as a failed check before it merges.

## Maintaining

Every push to `master` is compiled and published to the course website straight away,
so the `master` branch should always be a consistent, usable, "production-ready" set of lab manuals.
Minor edits (typos, small wording fixes) can be committed and pushed directly to `master`.
Major edits should go on a new branch and through a pull request,
and be merged once they're ready and the build passes.

## Lab Manual Style

- We aim for a sparse style.
  Provide only the necessary information, without major diversions.
- Do not include material from other sources
  (other than, possibly, figures that represent real data that are impossible to replicate using TikZ).
