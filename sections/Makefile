MDTOTEX=pandoc -f markdown -t latex

all: 04_em/lect5.tex
.PHONY: all

%.tex: %.md Makefile
	$(MDTOTEX) $< | sed 's/\\\[([0-9]\.\([0-9]*\)\([a-z]\))/\\setcounter{equation}{\1}\\[\\tag{\1.\2}/g;s/\\\[([0-9]\.\([0-9]*\))/\\setcounter{equation}{\1}\\[/g' > $@

