% -- Encoding UTF-8 without BOM
% The class cv-style.cls was originally created by
% Adrien Friggeri and has been modified to be compiled using Overleaf by
% Alejandro Pérez Londoño. This template is under the licence
% Creative commons 4.0 : https://creativecommons.org/licenses/by/4.0/legalcode
%
% Changes, Germain Salvato Vallverdu
% April 2016
%   * remove lang options and update lastupdated macro. Put the text you want
%     in the macro.
%   * add shortcuts to adjust page layout
%   * change colors
%   * update sectioncolor macro. Now there is two arguments. The first one is
%     colored.

\ProvidesClass{cv-style}[2015/02/27 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%----------------------------------------------------------------------------------------
% Colors %
%----------------------------------------------------------------------------------------

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

% old colors
% \definecolor{darkgray}{HTML}{333333}
% \definecolor{gray}{HTML}{4D4D4D}
% \definecolor{lightgray}{HTML}{999999}
%
% \definecolor{blue}{HTML}{66D9EE}
% \definecolor{red}{HTML}{FA2772}
% \definecolor{orange}{HTML}{FE9720}
% \definecolor{green}{HTML}{A7E22E}
% \definecolor{purple}{HTML}{9358FE}
% \definecolor{aquamarine}{HTML}{36AF90}

% from uppa colors
\definecolor{darkgray}{HTML}{3C3D3F}
\definecolor{gray}{HTML}{4B4C4E}
\definecolor{lightgray}{HTML}{9B9C9E}

\definecolor{blue}{HTML}{2698D0}
\definecolor{red}{HTML}{FA2772}
\definecolor{orange}{HTML}{F49C00}
\definecolor{green}{HTML}{B5BD00}
\definecolor{purple}{HTML}{92609F}
\definecolor{aquamarine}{HTML}{97BDD9}

\definecolor{date}{HTML}{A4A4A4}

\ifdefined\@cv@print
  % \colorlet{blue}{gray}
  % \colorlet{red}{gray}
  % \colorlet{orange}{gray}
  % \colorlet{green}{gray}
  % \colorlet{purple}{gray}
  % \colorlet{aquamarine}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%----------------------------------------------------------------------------------------
% Fonts %
%----------------------------------------------------------------------------------------

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont{Roboto-Regular}[Path=fonts/]
\newfontfamily\bodyfontit{Roboto-LightItalic}[Path=fonts/]
\newfontfamily\thinfont{Roboto-Thin}[Path=fonts/]
\newfontfamily\headingfont{RobotoCondensed-Bold}[Path=fonts/]

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Path = fonts/]{Roboto-Light}

\newcommand{\italica}[1]{%
    {\color{gray}\bodyfontit #1}%
}

%----------------------------------------------------------------------------------------
% Size of blocks %
%----------------------------------------------------------------------------------------

% default values

% header minimum height=2cm
\newcommand{\cvheadheight}[1]{
    \def\@headheight{#1}
}
\cvheadheight{2cm}

% width of side column
\newcommand{\cvasidewidth}[1]{
    \def\@asidewidth{#1}
}
\cvasidewidth{3.6}

% vertical pos of side column
\newcommand{\cvasidevpos}[1]{
    \def\@asidevpos{#1}
}
\cvasidevpos{1.87}

% width of main part
\newcommand{\cvmainwidth}[1]{
    \def\@mainwidth{#1}
}
\cvmainwidth{12.8cm}

%----------------------------------------------------------------------------------------
%	Last updated command %
%----------------------------------------------------------------------------------------

\RequirePackage{polyglossia}

\newcommand{\sethyphenation}[3][]{%
  \sbox0{\begin{otherlanguage}[#1]{#2}
    \hyphenation{#3}\end{otherlanguage}}}
%\sethyphenation[<options>]{<language>}{<list of words separated by spaces>}

\setdefaultlanguage[variant=british]{english}

\newcommand{\lastupdated}[1]{\def\@lastupdated{#1}}
\lastupdated{}

%----------------------------------------------------------------------------------------
% Header %
%----------------------------------------------------------------------------------------

\RequirePackage{tikz}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node[rectangle, fill=fillheader, anchor=north,
           minimum width=\paperwidth,
           minimum height=\@headheight] (box) at (current page.north){};
    \node[anchor=center, above] (name) at (box) {%
      %\fontsize{40pt}{65pt}\color{header}%
      \fontsize{32pt}{52pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node[anchor=north, yshift=-1mm] (titre) at (name.south) {
        \fontsize{16pt}{24pt}\color{header}%
        {\thinfont #3}
    };
    \node[anchor=north east, inner sep=2ex] at (current page.north east) {
        \fontsize{8pt}{10pt}\color{date}\thinfont
        \@lastupdated
    };
  \end{tikzpicture}
  \vspace{1cm}
  \vspace{-2\parskip}
}

%----------------------------------------------------------------------------------------
% Structure %
%----------------------------------------------------------------------------------------
\RequirePackage{parskip}

\newcounter{colorCounter}
\newcommand{\@sectioncolor}[2]{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        orange\or%
        green\or%
        purple\or%
        red\or%
        aquamarine\else%
        headercolor\fi%
    } #1%
  }%
  \stepcounter{colorCounter}%
  #2%
}

\renewcommand{\section}[2]{
  {\par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor{#1}{#2}%
  }
  \par\vspace{\parskip}}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\newcommand{\jobtitle}[1]{%
    {\color{gray}\bodyfontit #1}%
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
% List environment %
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1 & \parbox[t]{\@mainwidth}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}

%----------------------------------------------------------------------------------------
% Side block %
%----------------------------------------------------------------------------------------

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{\@asidewidth}(1, \@asidevpos)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%----------------------------------------------------------------------------------------
% Other tweaks %
%----------------------------------------------------------------------------------------

\RequirePackage[left=5.6cm, top=1cm, right=1cm, bottom=1cm, nohead, nofoot, a4paper]{geometry}
\RequirePackage{hyperref}
\hypersetup{
    pdfsubject=CV/Resume,
    colorlinks=false,%
    pdfborder={0 0 0}%
}
