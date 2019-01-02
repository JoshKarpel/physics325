\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manual}

\LoadClass[11pt]{article}

% standard graphics/image display packages
\usepackage[dvipsnames]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{placeins}

% internal and external links
\RequirePackage{hyperref}
\RequirePackage{caption}  % links go to top of figure instead of caption

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

% voodoo to get the git commit hash in there
\RequirePackage{expl3}
\RequirePackage{xparse}
\RequirePackage{stringstrings}

\ExplSyntaxOn
\NewDocumentCommand{\captureshell}{ov}
 {
  \IfNoValueTF { #1 }
   {
    \sdaau_captureshell:Nn \l__sdaau_captureshell_out_tl { #2 }
    \tl_use:N \l__sdaau_captureshell_out_tl
   }
   {
    \sdaau_captureshell:Nn #1 { #2 }
   }
 }

\tl_new:N \l__sdaau_captureshell_out_tl

\cs_new_protected:Nn \sdaau_captureshell:Nn
 {
  \tl_set_from_file:Nnn #1 { } { |"#2" }
 }
\ExplSyntaxOff

% black magic: use --dirty==-dirty.tex to make pdflatex not append a .tex to the command, then use substring later to remove the ".tex" from the output
\captureshell[\commithash]{git describe --always --dirty=-dirty.tex}
\captureshell[\commitdate]{git log -1 --pretty=format:"%x28%ad%x29" --date=short .}

% set headers and footers
\RequirePackage{lastpage}  % figure out number of last page
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\lhead{\MyTitle}
\chead{}
\rhead{\@course}
\lfoot{\footnotesize \ttfamily Compiled on \MyDate{} from commit \substring{\commithash}{1}{$-5} \commitdate}
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
\usetikzlibrary{decorations.pathreplacing}
\usetikzlibrary{backgrounds}
\usetikzlibrary{fadings}
\usetikzlibrary{intersections}
\usepackage[americanvoltages]{circuitikz}

\tikzset{
    % style to apply some styles to each segment of a path
    on each segment/.style={
        decorate,
        decoration={
            show path construction,
            moveto code={},
            lineto code={
                \path [#1]
                (\tikzinputsegmentfirst) -- (\tikzinputsegmentlast);
            },
            curveto code={
                \path [#1] (\tikzinputsegmentfirst)
                .. controls
                (\tikzinputsegmentsupporta) and (\tikzinputsegmentsupportb)
                ..
                (\tikzinputsegmentlast);
            },
            closepath code={
                \path [#1]
                (\tikzinputsegmentfirst) -- (\tikzinputsegmentlast);
            },
        },
    }
}

\tikzset{midarrow/.style={
        decoration={markings,
            mark= at position 0.5 with {\arrow[scale=1.5]{#1}} ,
        },
        postaction={decorate}
    }
}
\tikzset{revmidarrow/.style={
        decoration={markings,
            mark= at position 0.5 with {\arrow[scale=1.5, >={#1}]{<}} ,
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

% centered arc for tikz
\def\centerarc[#1](#2)(#3:#4:#5)% Syntax: [draw options] (center) (initial angle:final angle:radius)
{
    \draw[#1] ($(#2)+({#5*cos(#3)},{#5*sin(#3)})$) arc (#3:#4:#5)
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

% checkpoint boxes
\RequirePackage[most]{tcolorbox}

\newtcolorbox{checkpointbox}[1][]{
    enhanced,
    arc=0pt,
    outer arc=0pt,
    colback=white,
    boxrule=0.8pt,
    boxsep=0mm,
    #1
}


\newcounter{Checkpoint}
\newcommand{\checkpoint}[1]{
    \refstepcounter{Checkpoint}
    \begin{center}
        \noindent \parbox{.9\textwidth}{
            \begin{checkpointbox}
                \textbf{Checkpoint \theCheckpoint}
                \vspace{1em}
                \\
                \noindent #1
            \end{checkpointbox}
        }
    \end{center}
}

% customize item spacing in lists
\usepackage{enumitem}
\setitemize{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}
\setenumerate{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}

% nice inline fraction
\usepackage{nicefrac}
