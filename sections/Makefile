MDTOTEX=pandoc -f markdown -t latex

all: 04_em/lect5.tex
.PHONY: all

%.tex: %.md Makefile
	$(MDTOTEX) $< > $@

