TEXC=pdflatex -shell-escape -synctex=1 -interaction=nonstopmode 

all: preproc main.pdf
.PHONY: all

SUBMAKES=sections/Makefile
preproc:
	for mkf in $(SUBMAKES) ; do \
            $(MAKE) -C $$(dirname $$mkf) ; \
	  done
.PHONY: preproc

%.pdf: %.tex sections/*.tex Makefile
	$(TEXC) $<
