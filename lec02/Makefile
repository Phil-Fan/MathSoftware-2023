PROJ = navier-stokes
SOURCE := $(PROJ).tex
IMAGE = pic.png
REF = references.bib

all: $(PROJ).pdf 

$(PROJ).pdf: $(PROJ).tex $(REF)
	xelatex $(PROJ)
	bibtex $(PROJ)
	xelatex $(PROJ)
	xelatex $(PROJ)
	xdg-open $(PROJ).pdf


clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.nav *.snm *.dat

.PHONY: all clean
