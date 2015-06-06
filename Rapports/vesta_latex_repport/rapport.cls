%@file rapport.cls
%@author Y.Chevalier <yves.chevallier@epfl.ch>
%@editor N.Vaucher <nicolas.vaucher@epfl.ch>

%----------------------------------------
% Declare Class
%----------------------------------------
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{rapport}[2009/12/07 Extension pour RAPPORT EPFL]

%Load mother's class
%---- Recto seulement ----%
%\LoadClass[11pt,onecolumn,a4paper,oneside,final]{article}
%---- Recto verso ----%
\LoadClass[11pt,onecolumn,a4paper,twoside,openright,final]{article}

%----------------------------------------
% Specific informations
%----------------------------------------
\newcommand\subtitle[1]{\def\@subtitle{#1}}
\newcommand\teacher[1]{\def\@teacher{#1}}
\newcommand\footauthor[1]{\def\@footauthor{#1}}
\newcommand\semester[1]{\def\@semester{#1}}
\newcommand\cours[1]{\def\@cours{#1}}

%----------------------------------------
% Include some packages
%----------------------------------------
%---- Base and layout ----%
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[french]{babel}
\usepackage[unicode=true, pagebackref=true, colorlinks=true, plainpages=true, linkcolor=black]{hyperref}
\usepackage{fancyhdr}

%---- Maths, physic, chemistery ----%
\usepackage{array}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage[version=3]{mhchem}
\usepackage[retainorgcmds]{IEEEtrantools}

%---- Other ----%
\usepackage[nofancy]{svninfo}
\usepackage{enumerate}
\usepackage{aeguill}
\usepackage{titlesec}
\usepackage{lastpage}
\usepackage{helvet}
\usepackage{courier}
\usepackage{framed}
\usepackage{color}
\usepackage{float}
\usepackage{textcomp}
\usepackage{parskip}
\usepackage{verbatim}
\usepackage{setspace}
\usepackage{wasysym}

%---- Figures ---%
\usepackage{graphicx}
\usepackage{wrapfig}
%\usepackage[center]{subfigure}
\usepackage{chngcntr}
\usepackage{picins}
\usepackage{wrapfig}
\usepackage{subcaption}

%---- Tables ----%
\usepackage{tabularx}
\usepackage{multirow}
\usepackage{multicol}
\usepackage[counterclockwise]{rotating}
\usepackage{longtable}
\setlongtables

%---- Code listings ----
\usepackage{listings}

%---- Bibliography, index and glossary ----%
\usepackage{multibib}
\usepackage{makeidx}
\usepackage[french]{gloss}
\usepackage{url}


%---- Table of content and force bold smallcaps ----%
\usepackage[subfigure]{tocloft}
%\usepackage{cmlgc}

%----------------------------------------
% Some specific changes
%----------------------------------------
%---- Bullet item label ----%
\AtBeginDocument{\renewcommand{\labelitemi}{\textbullet}}

%---- Spacing around title level 2 ----%
\titlespacing{\subsection}{0pt}{15pt}{5pt}

%---- Spacing between paragraphs ----%
%\setlength{\parskip}{5pt plus 1pt minus 1pt}
\setlength{\parindent}{12pt plus 1pt minus 1pt}

%---- Figure numbering changes -----%
\numberwithin{figure}{section}


%----------------------------------------
% New commands
%----------------------------------------

% custom c highlighting for c listings
\lstdefinestyle{customc}{
  belowcaptionskip=1\baselineskip,
  breaklines=true,
  frame=L,
  xleftmargin=\parindent,
  language=C,
  showstringspaces=false,
  basicstyle=\footnotesize\ttfamily,
  keywordstyle=\bfseries\color{green},
  commentstyle=\itshape\color{purple},
  identifierstyle=\color{blue},
  stringstyle=\color{orange},
}

\lstdefinestyle{customxml}{
  language=XML,
	morestring=[b]",
	morestring=[s]{>}{<},
	morecomment=[s]{<?}{?>},
	stringstyle=\color{black},
	identifierstyle=\color{darkblue},
	keywordstyle=\color{cyan},
	identifierstyle=\itshape\color{green}
}

%---- Clear double page without numbering them ----%
\newcommand{\clearemptydoublepage}{%
	\newpage{\pagestyle{empty}\cleardoublepage}
}

%---- Title level 4 ----%
\newcommand{\subsubsubsection}[1]{
	\vspace{-0.6em}
	\paragraph{#1}~\\
}

%---- Figure at the exact place ----%
%---- Exemple : \figi{nom_fichier.extension}{label}{Légende de la figure}{Largeur (par ex: 0.6\linewidth)}
\newcommand{\figi}[4]{
   \begin{figure}[!ht]
   \begin{center}
   \includegraphics[width=#4]{fig/#1}
   \end{center}
   \caption{\label{#2}#3}
   \end{figure}
}

%---- Figure at the top of the page ----%
%---- Exemple : \figh{nom_fichier.extension}{label}{Légende de la figure}{Largeur (par ex: 0.6\linewidth)}
\newcommand{\figh}[4]{
   \begin{figure}[H]
   \begin{center}
   \includegraphics[width=#4]{fig/#1}
   \end{center}
   \caption{\label{#2}#3}
   \end{figure}
}

%---- Include a table located in an extern file ----%
%---- Exemple : \tabi{nom_fichier}{label}{Légende du tableau}
\newcommand{\tabi}[3]{
	\begin{table}[!htp]
		\centering
		\caption{\label{#2}#3}
		%\vspace{0.5em}
		\include{table/#1}
	\end{table}
}

%---- Include an image as a table ----%
%---- Exemple : \tabasfigi{nom_fichier.extension}{label}{Légende du tableau}{Largeur (par ex: 0.6\linewidth)}
\newcommand{\tabasfigi}[4]{
   \begin{table}[!ht]
   \caption{\label{#2}#3}
   \begin{center}
   \includegraphics[width=#4]{fig/#1}
   \end{center}
   \end{table}
}

%---- Include a figure on a double page (A3) that would be added later ----%
\newcommand\pageExtra[2]{%
	\clearemptydoublepage%
	\begin{figure}[!ht]%
	\begin{center} #2\end{center}%
	\caption{\label{#1}#2}%
	\end{figure}%
	\clearemptydoublepage%
}

%---- Write a note of something that should be done ----%
\newcommand{\todo}[1]{\begin{center}\textbf{TODO:} #1\end{center}}

%----------------------------------------
% Specific maths commands
%----------------------------------------
%---- Absolute value, norm, scalar product ----%
\providecommand{\abs}[1]{\left\lvert#1\right\rvert}
\providecommand{\norm}[1]{\left\lVert#1\right\rVert}
\providecommand{\scal}[1]{\langle#1\rangle}

%---- Units and double underline of an answer ----%
\providecommand{\unit}[1]{\ [\mathrm{#1}]}
\providecommand{\rep}[1]{\underline{\underline{#1}}}

%---- Symbol for the end of an interger ----%
\providecommand{\du}{\ \mathrm{d}}

%---- Variance, x in bold and some shortcut ----%
\DeclareMathOperator*{\Var}{Var}
\DeclareMathOperator*{\x}{\textbf{x}}
\newcommand{\w}{\omega}
\newcommand{\e}{\varepsilon}


%---- Useful angle definition for tri-symetry ----%
\newcommand{\cospiS}{\cos(\frac{\pi}{6})}
\newcommand{\sinpiS}{\sin(\frac{\pi}{6})}
\newcommand{\cospiT}{\cos(\frac{\pi}{3})}
\newcommand{\sinpiT}{\sin(\frac{\pi}{3})}

\renewcommand*{\IEEEeqnarraydecl}{%
  \setlength{\jot}{2\IEEEnormaljot}% twice the normal value of \jot
}



%----------------------------------------
% Paper size and Layout
%----------------------------------------
\usepackage[dvips,
	    a4paper,
	    top				=1cm,
	    bottom			=2cm,
	    left			=2cm,
	    headheight		=6mm,
	    headsep			=10mm,
	    marginparwidth	=2cm,
	    marginparsep	=4mm,
	    heightrounded,
	    includehead]{geometry}

%----------------------------------------
% Headings
%----------------------------------------
\pagestyle{fancy}
\renewcommand{\footrulewidth}{0.4pt}

%---- Headings for Recto class----%
\begin{comment}
\lhead{}
\chead{}
\rhead{\leftmark}
\lfoot{\@footauthor}
\cfoot{}
\rfoot{\thepage}
\end{comment}

%---- Headings for Recto Verso class ----%
%\begin{comment}
\fancyhead[LO,RE]{}
\fancyhead[CO,CE]{}
\fancyhead[RO,LE]{\leftmark}

\fancyfoot[LO,RE]{\@footauthor}
\fancyfoot[CO,CE]{}
\fancyfoot[RO,LE]{\thepage}
%\end{comment}

%----------------------------------------
% Glossary
%----------------------------------------
\newenvironment{liste_glossaire}
{\begin{description}[leftmargin=3.2cm, style=sameline, parsep=8pt]}
{\end{description}}

%----------------------------------------
% Bibliography
%----------------------------------------
%Redefine spacing between entry in the bibliography
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
 \oldbibliography{#1}%
 \setlength{\itemsep}{8pt}%
}

%Redefine color and style of url in the bibliography
\def\url@standardstyle{%
  \@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\color{blue}\small\ttfamily}}}
\urlstyle{standard}

%----------------------------------------
% Cover page
%----------------------------------------
\renewcommand\@maketitle{%
	\thispagestyle{empty}
	\null
	\vskip 2em%
	\begin{center}%
	\includegraphics[width=80mm]{fig/logo_EPFL.png}\par%
	\vspace{4cm}
	\let \footnote \thanks
	\reset@font
	{\usefont{T1}{cmr}{bx}{n}
	\large\sc{\@semester~ - \@cours}\\\vspace{0.5em}
	\fontsize{29.86pt}{29.86pt}\bfseries\selectfont\@title\\\vspace{0.5em}
	\LARGE{\@subtitle}\par}%
	%{\LARGE \@title \par}%
	\vskip 8em%
	{\large
	\lineskip .5em%
	\begin{tabular}[t]{c}%
	\@author
	\end{tabular}\par}%
	\vskip 1em%

	{\large \@date}%
	\vskip 5cm%
	Responsables:\\
	\@teacher\\
	\end{center}%
	\par
	\vskip 1.5em
	\clearpage}

%----------------------------------------
% Table of contents
%----------------------------------------
%changements dans la table des matières
\renewcommand{\cftsecfont}{\sc\bfseries}
\renewcommand{\cftdotsep}{\cftnodots}

%Ajout des lignes dans la tables des matières après chaque section
\renewcommand\section{\@startsection {section}{1}{\z@}%
	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\add_line_in_toc}%
}

\def\add_line_in_toc#1
{
	\reset@font\Large\bfseries#1
	\addtocontents{toc}{\protect\vspace{-0.8em}\protect\mbox{}\protect\hrulefill\par}
}

%Change value of indent for subsection and subsubsection entries in toc %
\setlength{\cftsubsecindent}{17pt}
\setlength{\cftsubsubsecindent}{25pt}

\newcommand\toc{%
	%\clearemptydoublepage
	\begin{spacing}{0.9}
	\setcounter{tocdepth}{3}
	\tableofcontents
	\end{spacing}
	\clearpage
	%\clearemptydoublepage
}
