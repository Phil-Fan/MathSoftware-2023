PROJ = proj
DOC = doc/
SRC := src src2 src3
OBJECTS := $(addsuffix /step-3,$(SRC))

.PHONY: all clean exe pic pdf

all: exe pic pdf

exe: $(OBJECTS)
ifeq ($(filter $(MAKECMDGOALS),exe all),$(MAKECMDGOALS))
	@echo "Finished"
	@tree
endif

$(OBJECTS): %/step-3: %/build %/step-3.cc %/CMakeLists.txt
ifeq ($(filter $(MAKECMDGOALS),exe all),$(MAKECMDGOALS))
	@if [ -e "$@" ]; then \
		echo "$@ already exists. Skipping..."; \
	else \
		echo "Generating exe"; \
		(cd $< && cmake --log-level=WARNING .. && make -s && chmod a+x step-3 && mv step-3 .. && rm -rf *); \
		(cd $(@D) && ./step-3); \
	fi
endif


# 生成所有的图片，用于pdf
# 使用子shell的方式解决目录跳转的问题
pic: $(SRC)/gene.py $(SRC)/solution.vtk
	@echo "Generating pics ..."
	@for dir in $(SRC); do \
		( cd $$dir && paraview --script=gene.py && mv *.png ../doc ); \
	done
	@echo "Finished"
	@tree

# 生成pdf：利用子文件夹下的Makefile文件
pdf: $(PROJ).pdf
$(PROJ).pdf:  $(DOC)$(PROJ).tex 
	@echo "Generating pdf ..."
	@cd $(DOC) && make
	@cd $(DOC) && mv *.pdf ..
	@xdg-open $(PROJ).pdf
	@echo "Finished"

clean:
	@echo "Deleting ..."
	@cd $(DOC) && rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.nav *.snm *.dat *.pdf *.png
	@find . -type f -name "*.vtk" -print0 | xargs -0 rm -f
	@find . -type f -name "*.png" -print0 | xargs -0 rm -f
	@find . -type f -name "step-3" -print0 | xargs -0 rm -f
	@rm -rf *.pdf
	@echo "Finished. Structure of your current folder is below"
	@tree

