# UT ITC MSc Thesis Template

A LaTeX template for University of Twente (UT) ITC Master's thesis documents, created by Rolf A. de By (r.a.deby@utwente.nl).

## Introduction

This template implements the official formatting requirements for M.Sc. theses produced at the Faculty of Geoinformation Science and Earth Observation (ITC), University of Twente, Enschede, The Netherlands.

## Requirements

### Fonts
All necessary font files are included in the repository under the fonts directory.

### LaTeX Packages
The template automatically loads required packages; no additional package installation is required.

## Installation

1. Install required software:
   - TeX Live distribution
   - LaTeX editor of your choice
   - Git (for repository management)

2. Clone the repository:
   ```bash
   git clone https://github.com/AzyAli/utitcmsc-template.git
   ```

3. Set up your project:
   - Copy all files to your project directory
   - Ensure all font directories are preserved
   - Verify TeX Live has access to font paths

## Usage

Refer to manual_utitcmsc.pdf

### Basic Setup

Copy the entire repository to your project directory. The template requires specific document class declarations:

```latex
\documentclass{utitcmsc}

% Required declarations in preamble:
\title{Your Thesis Title}
\author{Your Name}
\ThesisMonth{Month}
\ThesisCourse{Course Name}
\ThesisYear{Year}
\ThesisAdvisor{Advisor Name}
\ThesisSupervisors{Supervisor Names}
\ThesisExaminers{Examiner Names}
\ThesisKeywords{Keyword 1, Keyword 2, ...}

\begin{document}
\maketitle
\frontmatter
```

### Document Structure

The template follows a strict structure:

```markdown
thesis_main.tex      # Main document file
head.tex           # Header configurations
ref.bib            # Bibliography database
tex/                # LaTeX source files
manual_utitcmsc.pdf # Template documentation
```

## Customization Options

The template provides several customization options:

1. Document Class Options:
   - Use 
 during writing
   - Remove 
 option for final submission
   - Draft mode shows:
     * Overfull line indicators
     * Draft watermark
     * Enhanced error checking

2. Document Structure:
   - Add chapters using 

   - Create appendices with 
 command
   - Include bibliography with 


3. Formatting:
   - Use standard LaTeX formatting commands
   - Avoid redefining template styles
   - Keep consistent spacing and indentation

## Troubleshooting

1. Font Problems:
   - Verify all font directories are present
   - Check font file permissions
   - Ensure TeX Live has access to font paths
   - Run 
 if fonts are not found

2. Package Conflicts:
   - Avoid using 
 until final submission
   - Use standard LaTeX packages only
   - Check package loading order
   - Report any package conflicts to the maintainer

3. Compilation Errors:
   - Run 

   - Check log file for specific error messages
   - Verify all required files are present
   - Ensure proper file permissions

## License & Credits

This template was created by Rolf A. de By (r.a.deby@utwente.nl) on April 24, 2013. It is distributed under private license for exclusive use by UT ITC students.

## Acknowledgments

Special thanks to Rolf A. de By for developing and maintaining this template. Users are encouraged to report any issues or suggestions to the original author.

## Version History

- April 24, 2013: Initial release
- [17/04/2025]: Repository created for improved accessibility

## Repository Contents

The repository includes:
- Complete template files
- Documentation manual
- Sample chapters
- Font configurations
- Build configuration files
- LaTeX source files
- Bibliography template
- Header configurations
- All necessary font files