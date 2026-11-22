# Physics 325 Lab Manuals

This is the git repository for the UW-Madison Physics 325 lab manuals.
The compiled manuals are published at <https://joshkarpel.github.io/physics325/>.

## Working on the Lab Manuals

### Cloning the Repository

The best way to get the repository onto your computer is to `clone` it using `git`.
First, install `git` from <https://git-scm.com/>.
Then open the command line on your computer
(`cmd` on Windows, `terminal` on Mac, and you know what you're doing if you're on Linux).
Navigate to the directory where you want the repository to end up,
and run `git clone https://github.com/JoshKarpel/physics325.git`.

### Compiling the Manuals

The lab manuals are compiled with [Tectonic](https://tectonic-typesetting.github.io/),
which downloads the LaTeX packages they need on the fly.
The pinned version is in `mise.toml`;
with [mise](https://mise.jdx.dev/) installed, `mise install` fetches it.

Compile one manual with `tectonic manuals/ThinLenses.tex`,
or compile all of them into a browsable site with `./build.sh`,
which writes the PDFs and an `index.html` linking them into `site/`.

### Publishing the Manuals

Every push to `master` compiles the manuals and publishes them to GitHub Pages,
via the `publish-site` workflow in `.github/workflows/`.
Pull requests compile them too, so a change that breaks the build shows up before it merges.

### Editing the Manuals

These manuals are publicly available and open to modification.
If you have modifications that you'd like to contribute, see `CONTRIBUTING.md`.
