%% artuppa.cls
%% Copyright 2014 by Germain Vallverdu
%
% Classe article UPPA
%
% babel language have to be given with class arguments
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{artuppax}[17/10/2012, modèle pour la classe article V1.0]

% default options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% load base class
\LoadClass[a4paper, 11pt]{article}

%\AtBeginDocument{\maketitle}

% -----------------------------------------------------------------------------
% xelatex
% -----------------------------------------------------------------------------
\RequirePackage{polyglossia}

\RequirePackage{fontspec}
%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math} % attention se percute avec amsfonts

\defaultfontfeatures{Mapping=tex-text}
%\setmainfont[Mapping=tex-text, Color=textcolor, Path=../fonts/]{Roboto-Regular}
\setmainfont[Mapping=tex-text, Color=textcolor]{Ubuntu}

% -----------------------------------------------------------------------------
% Standard packages
% -----------------------------------------------------------------------------
\RequirePackage{xspace}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{array}

% -----------------------------------------------------------------------------
% UPPA packages
% -----------------------------------------------------------------------------
\RequirePackage{UPPAheader}

% default header
\HeaderUPPA

% -----------------------------------------------------------------------------
% paragraphe
% -----------------------------------------------------------------------------
\setlength{\parskip}{1.75ex plus 0.5ex minus 0.5ex}
\setlength{\parindent}{0pt}

\pagenumbering{arabic}

\RequirePackage{setspace}
\AtBeginDocument{\onehalfspacing}

% -----------------------------------------------------------------------------
% listes
% -----------------------------------------------------------------------------
\AtBeginDocument{%
    \renewcommand\labelitemi{$\bullet$}%
    \renewcommand\labelitemii{$\circ$}%
}
\renewcommand{\labelenumi}{\arabic{enumi})}

% -----------------------------------------------------------------------------
% float names
% -----------------------------------------------------------------------------
\renewcommand{\fnum@figure}{{\bfseries\figurename\nobreakspace\thefigure}}
\renewcommand{\fnum@table}{{\bfseries\tablename\nobreakspace\thetable}}

% -----------------------------------------------------------------------------
% footnote
% -----------------------------------------------------------------------------
\renewcommand{\thefootnote}{\alph{footnote}}
\@addtoreset{footnote}{page}
\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width .5\textwidth height .5pt
  \kern 2pt
}

\endinput
