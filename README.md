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

These manuals are publicly available and open to modification.
If you have modifications that you'd like to contribute, see `CONTRIBUTING.md`.
