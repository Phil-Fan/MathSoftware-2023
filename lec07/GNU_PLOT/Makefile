PROJ = figure
SOURCE := $(PROJ).tex
IMAGE = ${PROJ}.png
REF = references.bib
SRC = ./src/
DATA = demension.txt
all: txt pic $(PROJ).pdf 

$(PROJ).pdf: $(SRC)$(PROJ).tex $(SRC)$(IMAGE) $(SRC)$(REF)
	cd $(SRC) && xelatex $(PROJ) && bibtex $(PROJ)\
		&& xelatex $(PROJ) && xelatex $(PROJ) && mv *.pdf ..
	xdg-open *.pdf

txt: $(SRC)$(DATA)
 
$(SRC)$(DATA):$(SRC)txt.sh
	cd $(SRC) && ./txt.sh
	
pic: $(SRC)${IMAGE}

$(SRC)${IMAGE}:txt
	cd ${SRC} && gnuplot -c ${PROJ}.gp `cat $(DATA)` && xdg-open ${IMAGE}
	
clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.nav *.snm *.dat *.pdf *.txt
	cd ${SRC} && rm -rf *.aux *.bbl *.blg *.log *.out *.toc \
		*.nav *.snm *.dat *.pdf *.txt *.png
.PHONY: all clean
