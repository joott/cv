\ProvidesClass{cv}[2025/04/25 v1.0 CV class]

\LoadClass[11pt]{article}
\usepackage[top=0.5in, left=0.5in, right=0.5in, bottom=0.5in]{geometry}

\usepackage[backend=bibtex,maxcitenames=4,giveninits=true]{biblatex}
\usepackage{tabto}
\usepackage{changepage}
\usepackage{hyperref}
\usepackage{enumitem}
\usepackage{calc}
\usepackage{xifthen}
\usepackage{fontspec}
\setmainfont[BoldFont={Fira Sans SemiBold}]{Fira Sans Regular}
\setmonofont[SizeFeatures={Size=10}]{FiraCode Nerd Font}

\def \spacing {0.1in}
\def \rightedge {0.3in}
\def \tabspace {0.9in}
\def \bullet {0.2in}

\setlength{\parindent}{0pt}

\newenvironment{extracurricular}[2]
    {\tabto{\spacing}\textbf{#2}\hfill{\textsl{#1}}
    \begin{adjustwidth}{\bullet}{\rightedge} }
    {
    \end{adjustwidth}
    \vspace{0.3em}
    }

% type (optional)
% title
% event
% location
% date
\newcommand\presentation[5][]{
    {\tabto{\spacing}#3, {\small #4} \hfill \textsl{#5}}

    {\tabto{\bullet}{``#2''} \ifthenelse{\isempty{#1}}{}{\footnotesize(#1)}}
    \vspace{0.3em}
}

\newcommand\publication[1]{
\citenames{#1} [arXiv:\texttt{\citefield{#1}{eprint}}]
}

\newbibmacro*{name:fixed-given-family}[4]{%
  \usebibmacro{name:delim}{#2#3#1}%
  \usebibmacro{name:hook}{#2#3#1}%
  \mkbibcompletenamegivenfamily{%
      {\mkbibnamegiven{#2}\isdot\bibnamedelimd}%
    \ifdefvoid{#3}
      {}
      {\mkbibnameprefix{#3}\isdot
       \ifprefchar
         {}
         {\ifuseprefix{\bibnamedelimc}{\bibnamedelimd}}}%
    \mkbibnamefamily{#1}\isdot
    \ifdefvoid{#4}{}{\bibnamedelimd\mkbibnamesuffix{#4}\isdot}}}

\def\FormatName#1{%
  \def\myname{Ott}%
  \ifx\namepartfamily\myname
    \textbf{#1}%
  \else
    #1%
  \fi
}

\DeclareFieldFormat{title}{``#1''}

\DeclareNameFormat{cvnames}{%
    \renewcommand*{\multinamedelim}{\addcomma\addspace}%
      \nameparts{#1}%
      \usebibmacro{name:fixed-given-family}
        {\FormatName\namepartfamily}
        {\FormatName\namepartgiveni}
        {\namepartprefix}
        {\namepartsuffix}
      \usebibmacro{name:andothers}%
}

\DeclareCiteCommand{\citenames}{}{%
  \printnames[cvnames]{labelname}\adddot\addspace%
  \usebibmacro{title}%
  \usebibmacro{journal+issuetitle}%
  \usebibmacro{note+pages}\adddot
}{}{}

\newcommand\header[1]{\vspace{0.2em} \textsc{\Large #1} \hrulefill \vspace{0.2em}}
