PROJ = lsq
SOURCE := ./src/$(PROJ).c
GENDATA := $(PROJ)_data
DOC = ./doc/$(PROJ)
DATA = ./src/testdata.txt
IMAGE = output.eps
REF = ./doc/references.bib

all: exe $(PROJ).pdf $(PROJ)_slide.pdf

exe: $(PROJ) $(GENDATA) $(DATA)

doc: $(PROJ).pdf $(PROJ)_slide.pdf

$(PROJ): $(SOURCE)
	gcc -o $@ $<

$(GENDATA): ./src/$(GENDATA).c
	gcc -o $@ $<

$(DATA): $(GENDATA) $(PROJ)
	./$(GENDATA)
	./$(PROJ)


$(PROJ).pdf: $(DOC).tex $(IMAGE) $(REF)
	mv $(IMAGE) ./doc/
	cd doc && xelatex $(@F:.pdf=)
	cd doc && bibtex $(@F:.pdf=)
	cd doc && xelatex $(@F:.pdf=)
	cd doc && xelatex $(@F:.pdf=)
	mv doc/$(@F:.tex=.pdf) .

$(IMAGE): $(DATA)
	gnuplot ./doc/$(PROJ).gp

$(PROJ)_slide.pdf: $(DOC)_slide.tex $(IMAGE)
	cd doc && xelatex $(@F:.pdf=)
	mv doc/$(<F:.tex=.pdf) .

clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.txt\
	 $(DATA) $(IMAGE) \
	*.nav *.snm *.dat $(PROJ).pdf $(PROJ)_slide.pdf
	
	rm -rf $(PROJ) $(GENDATA)
	cd doc && rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.nav *.snm *.dat *.eps *.txt

.PHONY: all exe clean

