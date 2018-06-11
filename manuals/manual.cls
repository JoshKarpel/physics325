\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manual}[Physics 325 Lab Manual]

\LoadClass[11pt]{article}

% standard graphics/image display packages
\usepackage[dvipsnames]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{float}

% standard math packages
\RequirePackage{amsmath,amssymb}

% extended physics notations
\RequirePackage{physics}
\DeclareMathOperator{\sinc}{sinc}

% can access title and date as \MyTitle and \MyDate
\RequirePackage{authoraftertitle}


% use - as date separator instead of /
\RequirePackage[yyyymmdd]{datetime}
\renewcommand{\dateseparator}{--}


% set page margins
\RequirePackage[
    top=1in,
    bottom=1in,
    left=1.2in,
    right=1.2in,
    headsep=0.3in,
    headheight=13.6pt,
    includefoot,
]{geometry}


% set headers and footers
\RequirePackage{lastpage}  % figure out number of last page
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\lhead{\MyTitle}
\chead{}
\rhead{\@course}
\lfoot{\small{Compiled on \MyDate}}
\cfoot{}
\rfoot{Page \thepage/\pageref{LastPage}}
\renewcommand{\headrulewidth}{0.0pt}
\renewcommand{\footrulewidth}{0.0pt}

\fancypagestyle{firstpage}
{
    \lhead{}
    \chead{\@course}
    \rhead{}
}

% add command to display course
\newcommand{\course}[1]{\gdef\@course{#1}}%
\newcommand{\@course}{\@latex@warning@no@line{No \noexpand\course given}}

% customized \maketitle command


\def\@maketitle{%
  \newpage
  \begin{center}%
  \let \footnote \thanks
    {\Huge \@title \par}%
  \end{center}%
  \par
  \vskip 1.5em}


% load tikz
\usepackage{tikz}
\usetikzlibrary{patterns}
\usetikzlibrary{decorations.markings}
\usetikzlibrary{backgrounds}
\usetikzlibrary{fadings}
\usepackage[americanvoltages]{circuitikz}

\tikzset{midarrow/.style={
        decoration={markings,
            mark= at position 0.5 with {\arrow[scale=1.5]{#1}} ,
        },
        postaction={decorate}
    }
}
\tikzset{neararrow/.style={
        decoration={markings,
            mark= at position 0.4 with {\arrow[scale=1.5]{#1}} ,
        },
        postaction={decorate}
    }
}
\tikzset{fararrow/.style={
        decoration={markings,
            mark= at position 0.6 with {\arrow[scale=1.5]{#1}} ,
        },
        postaction={decorate}
    }
}

\newcommand{\eye}[4]% size, x, y, rotation
{   \draw[rotate around={#4:(#2,#3)}] (#2,#3) -- ++(-.5*55:#1) (#2,#3) -- ++(.5*55:#1);
    \draw (#2,#3) ++(#4+55:.75*#1) arc (#4+55:#4-55:.75*#1);
    % IRIS
    \draw[fill=gray] (#2,#3) ++(#4+55/3:.75*#1) arc (#4+180-55:#4+180+55:.28*#1);
    %PUPIL, a filled arc
    \draw[fill=black] (#2,#3) ++(#4+55/3:.75*#1) arc (#4+55/3:#4-55/3:.75*#1);
}



% load siunitx
\usepackage{siunitx}

% set up section (really subsection) numbering
\renewcommand{\thesubsection}{\arabic{subsection}}

% make emph bold instead of italic
\let\emph\relax % there's no \RedeclareTextFontCommand
\DeclareTextFontCommand{\emph}{\bfseries}