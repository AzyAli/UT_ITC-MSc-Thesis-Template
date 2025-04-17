%------------------------------------------------------
% This file is a LaTeX class file for typesetting the
% student MSc theses within ITC.
% Do not change this file under any circumstances, but
% if you do, rename it!
% RdB ITC, 2011/01/17
%------------------------------------------------------
% IDENTIFICATION
%------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1998/12/01]
\ProvidesClass{utitcmsc}[2011/01/13 UT/ITC MSc thesis class, version 0.98]
%------------------------------------------------------
% OPTIONS
%------------------------------------------------------
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{book}}
\def\draftText{}
\DeclareOption{final}{\setlength{\overfullrule}{0pt}%
   \PassOptionsToClass{\CurrentOption}{book}%
   \def\draftText{}}
\DeclareOption{draft}{\setlength\overfullrule{5pt}%
   \PassOptionsToClass{\CurrentOption}{book}%
   \def\draftText{Draft of \today}}
\DeclareOption{fleqn}{%
   \PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption*{%
   \ClassWarning{utitcmsc}{You have asked for option `\CurrentOption' but
that option is unavailable, and I do not know what that is.}}
% Execute the DEFAULT options
\ExecuteOptions{a4paper,11pt,fleqn,twoside,titlepage,onecolumn,openright}
\ProcessOptions\relax
%------------------------------------------------------
% DECLARATIONS
%------------------------------------------------------
% Load the standard book class
\LoadClass[]{book}[1999/01/07]
%
% Set the fonts
\usepackage[T1]{fontenc}
\usepackage{type1cm}
\RequirePackage[urw-garamond,sfscaled,ttscaled]{mathdesign}   %% ITC likes to have Garamond now
\RequirePackage[english]{babel}                       %% Removed british as extra option
\usepackage{lmodern}                                          %% This one is needed to obtain much better T1 fonts
%
\usepackage{csquotes}     % Added to resolve babel/polyglossia warning
%
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{mdugm}
\newcommand{\ANtwentytwobold}[1]{{\fontsize{26}{30.4}\usefont{OT1}{phv}{bc}{n}\selectfont #1}}
\newcommand{\ANsixteen}[1]{{\fontsize{19}{22.2}\usefont{OT1}{phv}{mc}{n}\selectfont #1}}               %% Needs redefinition later
\newcommand{\ANfourteen}[1]{{\fontsize{16.8}{19.6}\usefont{OT1}{phv}{mc}{n}\selectfont #1}}            %% Needs redefinition later, based on bk11.clo
\newcommand{\ANeleven}[1]{{\fontsize{13}{15.2}\usefont{OT1}{phv}{mc}{n}\selectfont #1}}                %% Needs redefinition later, based on bk11.clo
\newcommand{\ANten}[1]{{\fontsize{11.6}{13.6}\usefont{OT1}{phv}{mc}{n}\selectfont #1}}                 %% Needs redefinition later
\newcommand{\Hlvseven}[1]{{\fontsize{8.4}{9.8}\usefont{OT1}{phv}{m}{n}\selectfont #1}}                 %% Needs to become Helevetica 7
% Debugging
\newcommand{\mypagestyle}[1]{\def\myargument{#1}\ClassWarning{utitcmsc}{Switching page style to `\myargument'.}\pagestyle{#1}}
\newcommand{\mythispagestyle}[1]{\def\myargument{#1}\ClassWarning{utitcmsc}{Switching this page style to `\myargument'.}\thispagestyle{#1}}
% Set the page margins
\RequirePackage{vmargin}
\setpapersize{A4} % For ordinary pdf generation
\setmargins{34mm}{0mm}{152.5mm}{233mm}{25mm}{8mm}{6mm}{12mm} % For ordinary generation

% Setting the HEADERS
\RequirePackage{fancyhdr}
%
\pagestyle{fancy}
%
\fancyhf{}
\fancyhead[CE,CO]{\bgroup\Hlvseven{\MakeUppercase{\@shorttitle}}\egroup}
\fancyfoot[C]{}
\fancyfoot[LE,RO]{\bgroup\Hlvseven{\thepage}\egroup}
\fancyfoot[LO,RE]{\bgroup\Hlvseven{\draftText}\egroup}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
%
% Repeat definition of fancy:
\fancypagestyle{fancyut}{%
\fancyhf{}
\fancyhead[CE,CO]{\bgroup\Hlvseven{\MakeUppercase{\@shorttitle}}\egroup}
\fancyfoot[C]{}
\fancyfoot[LE,RO]{\bgroup\Hlvseven{\thepage}\egroup}
\fancyfoot[LO,RE]{\bgroup\Hlvseven{\draftText}\egroup}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}}
%
% Redefinition of the plain page style:
\fancypagestyle{plain}{%
\fancyhf{}% Clear all
\fancyhead[CE,CO]{\bgroup\Hlvseven{\MakeUppercase{\@shorttitle}}\egroup}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\fancyfoot[C]{}%
\fancyfoot[LE,RO]{\bgroup\Hlvseven{\thepage}\egroup}}
%
% Definition of the special page style:
\fancypagestyle{special}{%
\fancyhf{}% Clear all
\fancyhead[CE,CO]{}%
\fancyhead[LE,LO]{}% {\bgroup\ANsixteen{\rightmark}\egroup}%
\renewcommand{\headrulewidth}{0.0pt}%
\renewcommand{\footrulewidth}{0.4pt}%
\fancyfoot[C]{}%
\fancyfoot[LE,RO]{\bgroup\Hlvseven{\thepage}\egroup}}
%------------------------------------------------------
% SECTION HEADINGS
%------------------------------------------------------
\setcounter{secnumdepth}{2}                     %% We are numbering down to subsection level
% Copied from book.cls but adapted to reflect different style and indents
% Chapter definitions first, where change is needed:
\def\@makechapterhead#1{%
  \vspace*{40\p@}%  Instead of the usual 50\p@
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        {\fontsize{19}{22.2}\usefont{OT1}{phv}{bc}{n}\selectfont \@chapapp\space \thechapter}
        \par\nobreak
        \vskip 10\p@ % Instead of the usual 20\p@
      \fi
      \if@backmatter
        {\fontsize{19}{22.2}\usefont{OT1}{phv}{bc}{n}\selectfont \@chapapp\space \thechapter}
        \par\nobreak
        \vskip 10\p@ % Instead of the usual 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    {\fontsize{26}{30.4}\usefont{OT1}{phv}{bc}{n}\selectfont #1}\par\nobreak
    \vskip 30\p@ % Instead of usual 40\p@
  }}
\def\@makeschapterhead#1{%
  \vspace*{40\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    {\fontsize{26}{30.4}\usefont{OT1}{phv}{bc}{n}\selectfont #1}\par\nobreak
    \vskip 30\p@
  }}
% Reshaping the number+sectionhead layout
% \def\@seccntformat#1{\makebox[18mm][l]{{\csname the#1\endcsname}}}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\fontsize{13}{15.2}\usefont{OT1}{phv}{bc}{n}\selectfont\uppercase}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\fontsize{11.6}{13.6}\usefont{OT1}{phv}{bc}{n}\selectfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\fontsize{11.6}{13.6}\usefont{OT1}{phv}{bc}{n}\selectfont}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
%
%------------------------------------------------------
% MATTER materials
%------------------------------------------------------
\renewcommand\mainmatter{%
  \cleardoublepage%
  \@mainmattertrue%
  \pagestyle{fancyut}%
  \thispagestyle{fancyut}%
  \pagenumbering{arabic}}
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse%
  \pagestyle{special}%
  \thispagestyle{special}}
%
%------------------------------------------------------
% ADDITIONAL ENVIRONMENTS
%------------------------------------------------------
% We need a specialized way of starting "front matter chapters"
% We copy all of the \chapter stuff from book, and then strip it
\newif\if@frontchapterunderline
\@frontchapterunderlinefalse
\newcommand\frontmatterchapter{\clearpage
                    \thispagestyle{special}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \@frontmatterchapter}
\def\@frontmatterchapter#1{\@makefrontmatterchapterhead{#1}%
                 \@afterheading}
\def\@makefrontmatterchapterhead#1{%
  \vspace*{25\p@}%
  {\parindent \z@ \raggedright
    \interlinepenalty\@M
    \ANsixteen{#1}\par\nobreak
    \if@frontchapterunderline
      \vskip 3\p@
      \hrule height 0.4\p@ width \textwidth
      \vskip 16.6\p@
    \else
      \vskip 20\p@
    \fi
  }}
%% Let Appendices come out appropriately
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else\if@backmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                         \else
                          \addcontentsline{toc}{chapter}{#1}%
                         \fi
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
% The Abstract
\newenvironment{abstract}{%
        \@frontchapterunderlinefalse%
        \frontmatterchapter{\MakeUppercase\abstractname}%
        \thispagestyle{special}\pagestyle{special}%
        \addcontentsline{toc}{chapter}{\abstractname}}%
      {\subsection*{Keywords}
       \noindent\emph{\theskeywords}\clearpage}
%
% Possible Acknowledgements, should actually be sensitive to US/UK English
\def\acknowledgementsname{Acknowledgements}%
\newenvironment{acknowledgements}{%
        \@frontchapterunderlinefalse%
        \frontmatterchapter{\MakeUppercase\acknowledgementsname}%
        \thispagestyle{special}\pagestyle{special}%
        \addcontentsline{toc}{chapter}{\acknowledgementsname}}
      {\clearpage}
%
% Bibliography adaptations
\renewenvironment{thebibliography}[1]
     {\renewcommand{\bibname}{List of References}%
      \@frontchapterunderlinetrue%
      \frontmatterchapter{\MakeUppercase\bibname}%
      \pagestyle{special}\thispagestyle{special}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
%% The TOC, LOF, and LOT
\renewcommand\tableofcontents{%
    \def\contentsname{Table of Contents}%
    \@frontchapterunderlinetrue%
    \frontmatterchapter{\MakeUppercase\contentsname}%
    \pagestyle{special}\thispagestyle{special}%
    \@starttoc{toc}}
\renewcommand\listoffigures{%
    \frontmatterchapter{\MakeUppercase\listfigurename}%
    \@frontchapterunderlinetrue%
    \pagestyle{special}\thispagestyle{special}%
    \@starttoc{lof}}
\renewcommand\listoftables{%
    \frontmatterchapter{\MakeUppercase\listtablename}%
    \@frontchapterunderlinetrue%
    \pagestyle{special}\thispagestyle{special}%
    \@starttoc{lot}}
%------------------------------------------------------
% SPECIAL FRONT MATTER, TITLE PAGES, and so forth
%------------------------------------------------------
% Rather special front matter for ITC M.Sc. thesis
\renewcommand{\maketitle}%
{\pagestyle{empty}%
 \begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vskip 5.4cm                                        %% How much down before title

  \makebox[5.3cm]{}                                        %% How much to right for all text on page
   \begin{minipage}{7.8cm}                                 %% Width of right hand column
    \parindent=0pt\raggedright

    \makebox[7.8cm][l]{\parbox[t][1cm][t]{10.5cm}
     {\raggedright%
      \baselineskip=22pt%
      \ANtwentytwobold{\MakeUppercase{\@title}}}}              %% TITLE THESIS

    \vskip 5.52cm                                          %% Space below title

    \makebox[7.8cm][l]{\parbox{10.5cm}
     {\raggedright%
      \baselineskip=14pt
     \ANfourteen{\MakeUppercase{\@author}}\\[1pt]          %% NAME STUDENT
     \ANfourteen{\thesmonth, \thesyear}}}                  %% Month, Year

    \vskip 1.5cm                                           %% Space below month and year

    \makebox[7.8cm][l]{\parbox{10.5cm}
     {\raggedright%
      \baselineskip=11pt
      \ANeleven{SUPERVISORS:}\\[1pt]
      \ANeleven{\thesadvisor\\                             %% Name first supervisor
                \thessupervisors}}}                        %% Name additional supervisor(s), possibly separated by \\
   \end{minipage}%
  \end{titlepage}%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \cleardoublepage%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \vspace*{-1.2cm}

  \begin{minipage}[b]{4.2cm}
   \makebox[4.2cm][r]{\includegraphics[width=6.73cm]{utlonglogo.jpg}}   %% How much to right for all text on page
  \end{minipage}
  \begin{minipage}[t]{7.8cm}                               %% Width of right hand column
   \parindent=0pt\raggedright\vspace*{-19.7cm}

   \makebox[7.8cm][l]{\parbox[t][1cm][t]{10.5cm}
    {\raggedright%
     \baselineskip=22pt%
     \ANtwentytwobold{\MakeUppercase{\@title}}}}           %% TITLE THESIS

   \vskip 4.88cm                                           %% Space below title

   \baselineskip=14pt
   \ANfourteen{\MakeUppercase{\@author}}\\[1pt]            %% NAME STUDENT
   \ANfourteen{Enschede, The Netherlands, \thesmonth, \thesyear}                     %% Month, Year
   \vskip 1cm

   \makebox[7.8cm][l]{\parbox[t][3cm][t]{10.5cm}
    {\raggedright%
     \baselineskip=11pt%

     \ANeleven{Thesis submitted to the Faculty of Geo-information Science and Earth
      Observation of the University of Twente in partial fulfilment of the requirements
      for the degree of Master of Science in Geo-information Science and Earth Observation}.
      \par
     \ANeleven{Specialization: \thescourse}}}\\

   \vskip 0.9cm

    \makebox[7.8cm][l]{\parbox{10.5cm}
     {\raggedright%
      \baselineskip=11pt
      \ANeleven{SUPERVISORS:}\\[1pt]
      \ANeleven{\thesadvisor \\                            %% Name first supervisor
                \thessupervisors}}}                        %% Name additional supervisor(s), possibly separated by \\
   \vskip 0.5cm

    \makebox[7.8cm][l]{\parbox{10.5cm}
     {\raggedright%
      \ANeleven{THESIS ASSESSMENT BOARD:}\\[1pt]
      \ANeleven{\theschair\ (chair)\\                       %% Name chair defence session
                \thesexaminers}}}                           %% Name additional examiners (externals)
  \end{minipage}

  \clearpage
  \mbox{}

  \vfill

  \ \hfill\ANten{Disclaimer}\hfill\ \\
  \ANten{This document describes work undertaken as part of a programme of study at the
  Faculty of Geo-information Science and Earth Observation of the University of
  Twente.
  All views and opinions expressed therein remain the sole responsibility of the author,
  and do not necessarily represent those of the Faculty.}
  \clearpage

  \pagenumbering{roman}
  \setcounter{footnote}{0}%
  \newcommand{\@shorttitle}{\@title}
  \global\let\thanks\relax%
  \global\let\maketitle\relax%
  \global\let\@thanks\@empty%
  \global\let\@author\@empty%
  \global\let\@date\@empty%
  %\global\let\@title\@empty%
  \global\let\title\relax%
  \global\let\author\relax%
  \global\let\date\relax%
  \global\let\and\relax%
  \pagestyle{fancyut}% was: fancy
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% We also want to ensure that those theses with more than 100 pages do not
% get overfull hboxes in their various tables of contents, so widen from
% 1.55 em to 2.2em (it is not a length, but a command):
\renewcommand\@pnumwidth{2.2em}
%
% And Appendix / Appendices:
\newif\if@backmatter \@backmatterfalse
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@backmattertrue
  \@mainmatterfalse}
%
%
% TABLE CAPTIONS CENTERED ON TOP:
% The bit that makes the table captions come out on top,
% it actually also provided lines surrounding that caption
% as well as one on the bottom of the table environment.
% We will abuse the float package for this:
\usepackage{float}
% And then redefine the ruled style (by taking out the rules
% it puts around the caption, and adjusting the kerns a bit):
\renewcommand\fs@ruled{\def\@fs@cfont{\sffamily}\let\@fs@capt\floatc@ruled %was \rmfamily
  \def\@fs@pre{\kern2.8pt}%was 2.8
  \def\@fs@post{\kern4pt\relax}%was 2
  \def\@fs@mid{\kern10pt}%was 2
  \let\@fs@iftopcapt\iftrue}
% Also, we want the captions to be centered and typeset in the same
% font as captions for figures.  This should do:
\renewcommand\floatc@ruled[2]{\setbox\@tempboxa\hbox{\@fs@cfont #1: #2}%
  \ifdim\wd\@tempboxa>\hsize{\@fs@cfont #1: #2}\par%
    \else\hbox to\hsize{\hfil\box\@tempboxa\hfil}\fi}
\floatstyle{ruled}
\restylefloat{table}
% Now for figures, redo it also:
%\renewcommand\fs@plain{\def\@fs@cfont{\sffamily}\let\@fs@capt\floatc@plain
%  \def\@fs@pre{}\def\@fs@post{}\def\@fs@mid{\abovecaptionskip}
%  \let\@fs@iftopcapt\iffalse}
\renewcommand\fs@plain{\def\@fs@cfont{\sffamily}\let\@fs@capt\floatc@plain
  \def\@fs@pre{\kern2.8pt\relax}\def\@fs@post{\kern4pt\relax}\def\@fs@mid{\kern10pt\relax}
  \let\@fs@iftopcapt\iffalse}
\renewcommand\floatc@plain[2]{\setbox\@tempboxa\hbox{\@fs@cfont #1: #2}%
  \ifdim\wd\@tempboxa>\hsize {\@fs@cfont #1: #2}\par
    \else\hbox to\hsize{\hfil\box\@tempboxa\hfil}\fi}
\floatstyle{plain}
\restylefloat{figure}
%------------------------------------------------------
% ADDITIONAL COMMANDS
%------------------------------------------------------
% All to feed our new maketitle
\newcommand{\thesmonth}{month to be announced; use \texttt{\small{$\backslash$ThesisMonth\{\}}}}
\newcommand{\thescourse}{course not filled out; use \texttt{\small{$\backslash$ThesisCourse\{\}}}}
\newcommand{\thesyear}{year to be announced; use \texttt{\small{$\backslash$ThesisYear\{\}}}}
\newcommand{\thesadvisor}{advisor to be announced; use \texttt{\small{$\backslash$ThesisAdvisor\{\}}}}
\newcommand{\thessupervisors}{advisor to be announced; use \texttt{\small{$\backslash$ThesisSupervisors\{\}}}}
\newcommand{\theschair}{chair to be announced; use \texttt{\small{$\backslash$ThesisChair\{\}\ }}}
\newcommand{\thesexaminers}{examiners to be announced; use \texttt{\small{$\backslash$ThesisExaminers\{ $\backslash\,\backslash$\ \}}}}
\newcommand{\theskeywords}{keywords to be filled out; use \texttt{\small{$\backslash$ThesisKeywords\{,,\}}}}
\newcommand{\ThesisMonth}[1]{\renewcommand{\thesmonth}{#1}}
\newcommand{\ThesisCourse}[1]{\renewcommand{\thescourse}{#1}}
\newcommand{\ThesisYear}[1]{\renewcommand{\thesyear}{#1}}
\newcommand{\ThesisAdvisor}[1]{\renewcommand{\thesadvisor}{#1}}
\newcommand{\ThesisSupervisors}[1]{\renewcommand{\thessupervisors}{#1}}
\newcommand{\ThesisChair}[1]{\renewcommand{\theschair}{#1}}
\newcommand{\ThesisExaminers}[1]{\renewcommand{\thesexaminers}{#1}}
\newcommand{\ThesisKeywords}[1]{\renewcommand{\theskeywords}{#1}}
\newcommand{\ThesisShortTitle}[1]{\renewcommand{\@shorttitle}{#1}}
%------------------------------------------------------
% ADDITIONAL PACKAGES
%------------------------------------------------------
% load GRAPHICX package
\RequirePackage[pdftex]{graphicx}
%
% load INDEX package
\RequirePackage{makeidx}
%
% load LONGTABLE package
\RequirePackage{longtable}
%
% load the URL package (for proper URLs in BiB entries); a BiB entry can now use:
% note = "\url{www.itc.nl/etcetera}"
% There can even be additional spaces inside \url, so that entries created in
% the LaTeX output do not overrun page margins.  Typically, such spaces are placed
% after forward slashes in url path names.
\RequirePackage{url}
%% Define a new 'itcbiburl' style for the package that will use a smaller font.
\def\url@itcbiburlstyle{%
  \@ifundefined{selectfont}{\def\UrlFont{\sf}}{%
    \def\UrlFont{\small\ttfamily}}\Url@do}
%% Now actually use the newly defined style.
%\urlstyle{itcbiburl}
%
%------------------------------------------------------
% END OF CLASS utitcmsc.cls
%------------------------------------------------------
\endinput

What is needed for this class file to work?

- package mathdesign
- contents of directory C:\Program Files\MiKTeX 2.9\fonts\type1\urw\garamond
- run of updmap
