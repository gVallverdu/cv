%% letuppa.cls
%% Copyright 2014 by Germain Vallverdu
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
\ProvidesClass{letuppa}[25/09/2014 Classe lettre type UPPA charte 2014,  V1.0]
 
% -----------------------------------------------------------------------------
% class options
% -----------------------------------------------------------------------------
% default options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% load base class
\LoadClass[a4paper, 12pt]{article}

% babel
%\RequirePackage{babel}

% -----------------------------------------------------------------------------
% packages
% -----------------------------------------------------------------------------
\PassOptionsToPackage{utf8}{inputenc}
\RequirePackage{inputenc}
\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}
\RequirePackage{setspace}

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{helvet}
\RequirePackage{url}
\RequirePackage{Ucolors}


% -----------------------------------------------------------------------------
% format
% -----------------------------------------------------------------------------
\geometry{%
    left=3.5cm,% 
    right=1.75cm,%
    bottom=4cm,%
    footskip=3cm,%
    headheight=3.6cm,%
    top=5cm,%
}
\renewcommand{\familydefault}{\sfdefault}
\setlength{\parskip}{1.5ex plus 0.5ex minus 0.5ex}
\pagenumbering{arabic}

% -----------------------------------------------------------------------------
% email, adresse, institut, tel, fax, site, logo
% -----------------------------------------------------------------------------
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\tel}[1]{\def\@tel{#1}}
\newcommand{\fax}[1]{\def\@fax{#1}}
\newcommand{\site}[1]{\def\@site{#1}}
\newcommand{\uppalogo}[1]{\def\@uppalogo{#1}}
\newcommand{\secondlogo}[1]{\def\@secondlogo{#1}}
\newcommand{\fonction}[1]{\def\@fonction{#1}}
\newcommand{\destinataire}[1]{\def\@destinataire{#1}}
\newcommand{\adresseDestinataire}[1]{\def\@adresseDestinataire{#1}}
\newcommand{\adresse}[2][\@empty]{
    \ifx\@empty#1
        \def\@adresse{#2}
        \def\@shortadresse{#2}
    \else
        \def\@adresse{#2}
        \def\@shortadresse{#1}
    \fi 
}
\newcommand{\institute}[2][\@empty]{
    \ifx\@empty#1
        \def\@institute{#2}
        \def\@shortinstitute{#2}
    \else
        \def\@institute{#2}
        \def\@shortinstitute{#1}
    \fi 
}
\adresse{}
\email{}
\institute{}
\tel{}
\fax{}
\site{}
\uppalogo{}
\secondlogo{}
\fonction{}
\destinataire{}

% -----------------------------------------------------------------------------
% couleur ou noir et blanc
% -----------------------------------------------------------------------------
\newcommand{\letcolor}[1]{\def\@letcolor{#1}}
\newcommand{\BlackAndWhite}{
    \uppalogo{LogoUPPAnoir}
    \letcolor{black}
}
\newcommand{\WithColor}[1][Uvert]{
    \uppalogo{LogoUPPAcouleurCMJN}
    \letcolor{#1}
}
%default is black and white
%BlackAndWhite

% -----------------------------------------------------------------------------
% signature
% -----------------------------------------------------------------------------
\newcommand{\signature}[1][]{%
    \vspace{5mm}
    \hfill
    \tikz{\node (sign) {#1}; \node[below] at (sign.south) {\@author};}
    \hspace*{2cm}
}

% -----------------------------------------------------------------------------
% header/footer
% -----------------------------------------------------------------------------
\tikzstyle{carre} = [thick, 
                     rectangle, 
                     draw=\@letcolor, 
                     minimum width=7.5mm, 
                     minimum height=7.5mm, 
                     anchor=south west, 
                     fill=#1]

\fancyhf{}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
\fancyheadoffset[L]{2.5cm}
\fancyhead[L]{\includegraphics[height=3cm]{\@uppalogo}}
\fancyfoot[R]{\thepage}%
\fancyfootoffset[L]{2.7cm}
\fancyfoot[L]{
    \begin{tikzpicture}[overlay]
        \begin{scope}[scale=.65, transform shape] 
            \node[carre=white] at (2,0) {};
            \node[carre=\@letcolor] at (1,1) {};
            \node[carre=white] at (0,2) {};
            \node[carre=white] at (2,2) {};
            \node[carre=\@letcolor] at (1,3) {};    
            \node[carre=\@letcolor] at (2,3) {};
            \node[carre=white] at (3,3) {};    
            \node[carre=\@letcolor] at (0,4) {};
            \node[carre=white] at (2,4) {};    
            \node[carre=white] at (1,5) {};    
            \node[carre=\@letcolor] at (0,7) {};
        \end{scope}
        \node[anchor=west, text width=15cm] at (1.95, .75) {%
            \fontsize{10}{13}\selectfont 
            {\color{Ugris}UNIVERSIT\'E DE PAU ET DES PAYS DE L'ADOUR}\\
            \@shortinstitute{} -- \@shortadresse\\
            \ifx\@empty\@tel
            \else
                Tel: \@tel \quad
            \fi
            \ifx\@empty\@fax
            \else
                Fax: \@fax \quad
            \fi
            \ifx\@empty\@email
            \else
                \\Email: \@email
            \fi
            \ifx\@empty\@site
            \else
                \\Web: \@site
            \fi
        };
    \end{tikzpicture}
}%
\pagestyle{fancy}

\fancypagestyle{titlepage}{%
    \fancyhead{}
    \fancyhead[C]{%
        \parbox[c]{8cm}{\includegraphics[height=3cm]{\@uppalogo}}%
        \hfill
        \ifx\@empty\@secondlogo
        \else
            \parbox[c]{1.7cm}{\includegraphics[height=1.62cm]{\@secondlogo}}%
        \fi
    }
}

% -----------------------------------------------------------------------------
% titre
% -----------------------------------------------------------------------------
\renewcommand{\maketitle}{%
    \thispagestyle{titlepage}
 
    \noindent  
    \hspace*{-1.25cm}
    \begin{minipage}[t]{8.5cm}
        \null
        {\color{Ugris}\@institute}
        
        \vspace{1ex}
        
        \textbf{\@author}
        
        \@fonction
        
        \@adresse
    
    \end{minipage}
    \hspace{5mm}
    \begin{minipage}[t]{8cm}
        \null
        \textbf{\@date}
        
        \vspace{2ex}        
        
        \textbf{\@destinataire}
        
        \@adresseDestinataire
    \end{minipage}     
   
    \vspace*{1.5cm}
   
    \noindent\@title

    \vspace*{1cm}
    \onehalfspacing
}
\AtBeginDocument{\maketitle}

\endinput

