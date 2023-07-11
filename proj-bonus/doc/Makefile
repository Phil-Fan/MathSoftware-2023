PROJ = proj
SOURCE := $(PROJ).tex
IMAGES = proj1.png proj2.png proj3.png proj4.png
REF = references.bib

all: $(PROJ).pdf 

$(PROJ).pdf: $(PROJ).tex $(IMAGES) $(REF)
	xelatex $(PROJ)
	bibtex $(PROJ)
	xelatex $(PROJ)
	xelatex $(PROJ)

clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.nav *.snm *.dat *.pdf *.png

.PHONY: all clean

