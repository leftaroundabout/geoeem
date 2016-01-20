MDTOTEX=pandoc -f markdown -t latex

all: 04_em/lect5.tex 05_induction/lect10.tex
.PHONY: all

%.tex: %.md Makefile
	$(MDTOTEX) $< \
          | sed 's/\\subsection/\\subsubsection/' \
          | sed 's/\\section/\\subsection/' \
          `# Explicitly-numbered sections` \
          | sed 's/^\([^=]*\)===(\([0-9]*\)\.\([0-9]*\))/\\setcounter{section}{\2}\\setcounter{subsection}{\3}\\addtocounter{subsection}{-1}\\subsection{\1}/' \
          `# Explicitly-numbered equations` \
          | sed 's/\\\[([0-9]\.\([0-9]*\)\([a-z]\))/\\setcounter{equation}{\1}\\[\\tag{\1.\2}/g;s/\\\[([0-9]\.\([0-9]*\))/\\setcounter{equation}{\1}\\[/g' \
          > $@

