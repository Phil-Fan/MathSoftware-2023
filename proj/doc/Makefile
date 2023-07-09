PROJ = proj
SOURCE := $(PROJ).tex
IMAGE = ${PROJ}.png
REF = references.bib

all: $(PROJ).pdf 

$(PROJ).pdf: $(PROJ).tex $(IMAGE) $(REF)
	xelatex $(PROJ)
	bibtex $(PROJ)
	xelatex $(PROJ)
	xelatex $(PROJ)
	xdg-open $(PROJ).pdf


clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.nav *.snm *.dat *.pdf

.PHONY: all clean
