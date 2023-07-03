PROJ = lsq
SOURCE := $(PROJ).c
GENDATA := $(PROJ)_data
DATA = testdata.txt
IMAGE = output.eps
REF = references.bib

all: $(PROJ) $(GENDATA) $(DATA) $(PROJ).pdf $(PROJ)_slide.pdf

$(PROJ): $(PROJ).c
	gcc -o $(PROJ) $(PROJ).c

$(GENDATA): $(GENDATA).c
	gcc -o $(GENDATA) $(GENDATA).c

$(DATA): $(GENDATA)
	./$(GENDATA)
	./$(PROJ)

$(IMAGE): $(DATA)
	gnuplot $(PROJ).gp

$(PROJ).pdf: $(PROJ).tex $(IMAGE) $(REF)
	xelatex $(PROJ)
	bibtex $(PROJ)
	xelatex $(PROJ)
	xelatex $(PROJ)

$(PROJ)_slide.pdf: $(PROJ)_slide.tex $(IMAGE)
	xelatex $(PROJ)_slide

clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *.pdf *.toc \
	$(PROJ) $(GENDATA) $(DATA) $(IMAGE) \
	*.nav *.snm *.dat

.PHONY: all clean
