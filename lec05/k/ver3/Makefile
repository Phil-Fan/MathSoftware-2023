PROJ = lsq
SOURCE_DIR := ./src
DOC_DIR := ./doc
LSQ := ./lsq

SOURCE_FILE := $(SOURCE_DIR)/%.c
IMAGE  = output.eps
TEX_FILES := $(DOC_DIR)/lsq
BIB_FILES := $(DOC_DIR)/references.bib

all:exe doc

exe: $(LSQ) $(LSQ)_data
	$(LSQ)_data
	$(LSQ)
	mv output.dat $(DOC_DIR)
	
$(LSQ): $(SOURCE_DIR)/lsq.c
	gcc -o $@ $<
$(LSQ)_data: $(SOURCE_DIR)/lsq_data.c
	gcc -o $@ $<

#$(SOURCE_DIR)/%.o: $(SOURCE_DIR)/%.c
#	gcc -c $< -o $@


doc: $(PROJ).pdf $(PROJ)_slide.pdf

$(PROJ).pdf:$(TEX_FILES).tex $(BIB_FILES) $(IMAGE)
	cd $(DOC_DIR) && xelatex $(PROJ) && bibtex $(PROJ) && xelatex $(PROJ)&& xelatex $(PROJ)

$(PROJ)_slide.pdf: $(TEX_FILES)_slide.tex
	cd $(DOC_DIR) && xelatex $(PROJ)_slide
	
$(IMAGE): $(DOC_DIR)/output.dat
	cd $(DOC_DIR) && gnuplot ./$(PROJ).gp

clean:
	rm -rf ./lsq ./lsq_data $(DOC_DIR)/lsq.pdf *.txt *.eps *.dat
	cd doc && rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.nav *.snm *.dat *.eps *.txt

.PHONY: all exe doc clean
