# 目录结构
SRCDIR := src
DOCDIR := doc
PROJ = lsq

# 编译器和编译选项
CC := gcc
CFLAGS := -Wall -Wextra

# 生成目标文件和可执行文件的目录
BUILDDIR := build
TARGETS := lsq lsq_data

# 源文件和目标文件列表
SRCS := $(wildcard $(SRCDIR)/*.c)
OBJS := $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(SRCS))

# 图像文件列表
IMAGES := $(DOCDIR)/output.eps

# 默认目标
all: $(TARGETS) output.dat $(PDFS)
exe: $(TARGETS) output.dat

# 编译源文件生成目标文件
$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) -c -o $@ $<

# 生成可执行文件
$(TARGETS): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(BUILDDIR)/$@.o

# 生成测试数据文件
testdata.txt: lsq_data
	@echo "Generating test data..."
	./$<

# 生成输出数据文件
output.dat: testdata.txt lsq 
	@echo "Running lsq..."
	@./${PROJ}
	mv $@ ./$(DOCDIR)/$@
	rm $<

# 生成图像文件
$(IMAGES): ./$(DOCDIR)/output.dat $(DOCDIR)/lsq.gp
	@echo "Generating images..."
	@cd $(DOCDIR) && gnuplot ./lsq.gp

# 编译 PDF 文件
doc: $(PROJ).pdf $(PROJ)_slide.pdf

$(PROJ)_slide.pdf: $(DOCDIR)/$(PROJ)_slide.tex $(IMAGES)
	@echo "Generating $(PROJ)_slide.pdf..."
	cd $(DOCDIR) && xelatex $(@F:.pdf=)
	mv doc/$(<F:.tex=.pdf) .

$(PROJ).pdf: $(DOCDIR)/$(PROJ).tex $(DOCDIR)/references.bib $(IMAGES)
	@echo "Generating $(PROJ).pdf..."
	cd $(DOCDIR) && xelatex $(@F:.pdf=) && bibtex $(@F:.pdf=) && xelatex $(@F:.pdf=) && xelatex $(@F:.pdf=)
	mv doc/$(@F:.tex=.pdf) .
.PHONY: all exe clean

# 清理中间文件和生成的可执行文件、PDF 文件和图像文件
clean:
	git ls-files -o | xargs rm -f

