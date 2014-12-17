## Following Kieran Healy's template

MEXT = md
SRC = $(wildcard *.$(MEXT))

## Biblography and latex-template files
BIB = ../bib/bjps-conflict.bib
TEMPLATE = ../style/bjps-conflict.template


PDFS=$(SRC:.md=.pdf)

pdf:	clean $(PDFS)

%.pdf:	%.md
	pandoc -N -s -S --latex-engine=pdflatex --template=$(TEMPLATE) --filter pandoc-citeproc --bibliography=$(BIB) -o $@ $<

clean:
	rm -f *.pdf
