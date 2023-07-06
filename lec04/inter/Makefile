CC = gcc
CFLAGS = -Wall -Wextra
LDFLAGS = -lgsl -lm

PROJ = inter
SOURCE := $(PROJ).tex
IMAGE = interp.eps
REF = references.bib

.PHONY: all clean

all: $(PROJ) run  graph $(PROJ).pdf 

inter: $(PROJ).o
	$(CC) -o $@ $^ $(LDFLAGS)

inter.o: $(PROJ).c
	$(CC) $(CFLAGS) -c $<

run: $(PROJ)
	./$(PROJ) > $(PROJ).dat

graph: $(IMAGE)
	

interp.eps: $(PROJ).dat
	graph -T ps < $< > $@

$(PROJ).pdf: $(PROJ).tex $(IMAGE) $(REF)
	xelatex $(PROJ)
	bibtex $(PROJ)
	xelatex $(PROJ)
	xelatex $(PROJ)
	xdg-open $(PROJ).pdf

clean:
	rm -f $(PROJ)
	rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.nav *.snm *.dat *.o *.pdf *.eps





