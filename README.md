# Physics 325 Lab Manuals

This is the git repository for the UW-Madison Physics 325 lab manuals.

## Working on the Lab Manuals

### Cloning the Repository

The best way to get the repository onto your computer is to `clone` it using `git`.
First, install `git` from https://git-scm.com/.
Then open the command line on your computer (`cmd` on Windows, `terminal` on Mac, and you know what you're doing if you're on Linux).
Navigate to the directory where you want to the repository to end up, and run `git clone https://git.doit.wisc.edu/KARPEL/physics325.git` (you can copy the address from just below the name of the repository on the main page).
This will copy the repository in its current from the central repository here on GitLab.

See [this page](https://docs.gitlab.com/ee/gitlab-basics/) for some tutorials on using the command line, git, and GitLab.

### Compiling the Manuals

The lab manuals are all normal LaTeX files and can be compiled using `pdflatex`.
There are many package dependencies, but they should all be included in a full distribution like [`TeXLive`](https://www.tug.org/texlive/), or downloadable on-the-fly by a distribution like [`MikTeX`](https://miktex.org/).

To generate the commit message at the bottom left of each page, we need to let LaTeX run a shell command during compilation.
Therefore, you will need to run `pdflatex` with the command line option `--shell-escape` for the compilation to work.
Either do that from the command line, or add `--shell-escape` to what your editor runs when you compile.
For example, the command I use in `TeXstudio` is `pdflatex.exe -synctex=1 -interaction=nonstopmode --shell-escape %.tex`.
This should work on any operating system as long as you have `git` installed (it only calls `git` commands, which have the same syntax on any OS).

### Editing the Manuals

This doesn't give you edit access to the repository.
If you think you should have edit access but don't, it's probably because you logged into GitLab via your UW-Madison NetID.
That way of authenticating doesn't give you a real GitLab account, which you'll need to actually commit changes.
Go to Settings > Password (upper right corner, dropdown menu to Settings, then Password in the menu on the left).
Set a password - this is for your "actual" GitLab account, which you're currently accessing purely through its connection to your NetID.

Whatever edits you make to the manuals locally should eventually be pushed back up to the GitLab repository.
Minor edits can probably be `commit`ed and `push`ed directly into the `master` branch.
Major edits should go into a new branch first, then `merge`d when they're ready.
The goal should be for the `master` branch to be a consistent, usable, "production-ready" set of lab manuals at all times.

See the `CONTRIBUTING.md` file next to this file (`README.md`) for notes on the style of the lab manuals.
