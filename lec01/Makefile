PROJ = environment
SOURCE := $(PROJ).tex
IMAGE = pic.png
REF = references.bib

all: $(PROJ).pdf 

$(PROJ).pdf: $(PROJ).tex $(IMAGE) $(REF)
	xelatex $(PROJ)
	bibtex $(PROJ)
	xelatex $(PROJ)
	xelatex $(PROJ)


clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.nav *.snm *.dat

.PHONY: all clean
