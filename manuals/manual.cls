\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manual}[Physics 325 Lab Manual]

\LoadClass[11pt]{article}

% standard graphics/image display packages
\usepackage[dvipsnames]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{placeins}

% internal and external links
\RequirePackage{hyperref}
\RequirePackage{caption}  % go to top of figure instead of caption

% standard math packages
\RequirePackage{amsmath,amssymb}

% extended physics notations
\RequirePackage{physics}
\DeclareMathOperator{\sinc}{sinc}

% can access title and date as \MyTitle and \MyDate
\RequirePackage{authoraftertitle}


% use - as date separator instead of /
\RequirePackage[yyyymmdd]{datetime}
\renewcommand{\dateseparator}{-}


% set page margins
\RequirePackage[
    top=1in,
    bottom=1in,
    left=1.2in,
    right=1.2in,
    headsep=0.3in,
    headheight=13.6pt,
%    includefoot,
%    includehead,
]{geometry}


% set headers and footers
\RequirePackage{lastpage}  % figure out number of last page
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\lhead{\MyTitle}
\chead{}
\rhead{\@course}
\lfoot{\footnotesize \ttfamily Compiled on \MyDate{} from commit \input{|"git describe --always --dirty"}}
\cfoot{}
\rfoot{Page \thepage/\pageref*{LastPage}}
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
\usetikzlibrary{intersections}
\usepackage[americanvoltages]{circuitikz}

\tikzset{midarrow/.style={
        decoration={markings,
            mark= at position 0.5 with {\arrow[scale=1.5]{#1}} ,
        },
        postaction={decorate}
    }
}
\tikzset{veryneararrow/.style={
        decoration={markings,
            mark= at position 0.1 with {\arrow[scale=1.5]{#1}} ,
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
\tikzset{veryfararrow/.style={
        decoration={markings,
            mark= at position 0.9 with {\arrow[scale=1.5]{#1}} ,
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
\usepackage[alsoload=synchem]{siunitx}

% set up section numbering

\renewcommand{\thesubsection}{\arabic{subsection}}
%\makeatletter
\def\@seccntformat#1{\csname #1ignore\expandafter\endcsname\csname the#1\endcsname\quad}
\let\sectionignore\@gobbletwo
\let\latex@numberline\numberline
\def\numberline#1{\if\relax#1\relax\else\latex@numberline{#1}\fi}
%\makeatother

% make emph bold instead of italic
\let\emph\relax % there's no \RedeclareTextFontCommand
\DeclareTextFontCommand{\emph}{\bfseries}

% question boxes
\RequirePackage[most]{tcolorbox}

\newtcolorbox{Qbox}[1][]{
    enhanced,
    arc=0pt,
    outer arc=0pt,
    colback=white,
    boxrule=0.8pt,
    boxsep=0mm,
    #1
}


\newcounter{Q}
\newcommand{\Q}[2]{
    \refstepcounter{Q}
    \begin{center}
        \noindent \parbox{.9\textwidth}{
            \begin{Qbox}
                \textbf{Q\theQ \hfill [#1]}
                \vspace{1em}
                \\
                \noindent #2
            \end{Qbox}
        }
    \end{center}
}
\newcommand{\Qgray}[2]{
    \refstepcounter{Q}
    \begin{center}
        \noindent \parbox{.9\textwidth}{
            \begin{Qbox}[colback=lightgray!50]
                \textbf{Q\theQ \hfill [#1]}
                \vspace{1em}
                \\
                \noindent #2
            \end{Qbox}
        }
    \end{center}
}

% customize item spacing in lists
\usepackage{enumitem}
\setitemize{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}
\setenumerate{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}

% nice inline fraction
\usepackage{nicefrac}

