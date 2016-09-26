%!TEX program = xelatex
%==========================================
% lemaki-cv class
% Author: Julien Déoux
%
% Requirements:
%   - XelateX
%   - Roboto
%==========================================

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{lemaki-cv}[2016/09/26 CV Class 1.0]

\DeclareOption{print}{\def\cvprint{}}
\ProcessOptions\relax

\LoadClass{article}

% Colors
%-------

\RequirePackage{xcolor}
\definecolor{white}{HTML}{FFFFFF}
\definecolor{lightred}{HTML}{E83939}
\definecolor{lightgreen}{HTML}{7CC707}
\definecolor{lightbrown}{HTML}{E88113}
\definecolor{lightblue}{HTML}{3592C8}
\definecolor{lightmagenta}{HTML}{E813A9}
\definecolor{lightcyan}{HTML}{11CB7A}
\definecolor{darkgrey}{HTML}{5E5E5E}
\definecolor{lightgrey}{HTML}{CACACA}
\definecolor{darkred}{HTML}{C81111}
\definecolor{darkgreen}{HTML}{6CA90E}
\definecolor{darkbrown}{HTML}{A95E0E}
\definecolor{darkblue}{HTML}{0E70A9}
\definecolor{darkmagenta}{HTML}{A90E7B}
\definecolor{darkcyan}{HTML}{0B8752}
\definecolor{black}{HTML}{000000}

% Printable colors
%-----------------

\ifdefined\cvprint{}
	\colorlet{lightred}{lightgrey}
	\colorlet{lightgreen}{lightgrey}
	\colorlet{lightbrown}{lightgrey}
	\colorlet{lightblue}{lightgrey}
	\colorlet{lightmagenta}{lightgrey}
	\colorlet{lightcyan}{lightgrey}
	\colorlet{darkred}{darkgrey}
	\colorlet{darkgreen}{darkgrey}
	\colorlet{darkbrown}{darkgrey}
	\colorlet{darkblue}{darkgrey}
	\colorlet{darkmagenta}{darkgrey}
	\colorlet{darkcyan}{darkgrey}
\fi

% Fonts
%------

\RequirePackage{fontspec}
\setmainfont{Roboto}
\newfontfamily\body{Roboto}
\newfontfamily\light{Roboto Light}
\newfontfamily\condensed{Roboto Condensed}
\newfontfamily\condensedlight{Roboto Condensed Light}

% Header
%-------

\newcommand{\header}[3]{
	\begin{flushright}
	\fontsize{40pt}{72pt}\color{darkgrey}{\light{}#1\body{}#2}\\
	\fontsize{14pt}{24pt}\color{darkgrey}{\light{}#3}
	\vspace{2cm}
\end{flushright}}

% Sections
%---------

\RequirePackage{parskip}

\newcounter{colorCounter}
\newcommand\sectioncolor[1]{
{
	\color{
		\ifcase\value{colorCounter}
		lightblue\or
		lightred\or
		lightbrown\or
		lightgreen\or
		lightmagenta\else
		lightgrey\fi
	}#1
}
\stepcounter{colorCounter}
}

\renewcommand{\section}[1]{
	\par\vspace{\parskip}
	{
    \LARGE\condensed\color{darkgrey}
    \sectioncolor{#1}
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}
  \Large\condensed\color{darkgrey} #2
  \par\vspace{.25\parskip}
}

\pagestyle{empty}

% List environment
%-----------------

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{
	\end{tabular*}
}
\renewcommand{\bfseries}{\condensed\color{darkgrey}}
\newcommand{\entry}[4]{
	#1&\parbox[t]{11cm}{
	\textbf{#2}
	\hfill
	{\footnotesize\addfontfeature{Color=lightgrey} #3}\\
	#4\vspace{\parsep}
}\\}

% Side block
%-----------

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{
	\let\oldsection\section
	\renewcommand{\section}[1]{
	\par\vspace{\baselineskip}{\Large\condensed\color{darkgrey} ##1}
}
	\begin{textblock}{3.6}(1.5, 8.33)
	\begin{flushright}
	\obeycr
}{
	\restorecr
	\end{flushright}
	\end{textblock}
	\let\section\oldsection
}

% Other tweaks
%-------------

\RequirePackage[a4paper,left=6.1cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
