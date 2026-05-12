MAIN := Paper0-Ed
BUILD_DIR := build
PDF := $(BUILD_DIR)/$(MAIN).pdf

LATEXMK := latexmk
LATEXMK_FLAGS := -pdf -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1

.PHONY: all pdf clean distclean watch view

all: pdf

pdf: $(PDF)

$(PDF): $(MAIN).tex ref.bib
	$(LATEXMK) $(LATEXMK_FLAGS) -outdir=$(BUILD_DIR) $(MAIN).tex

watch:
	$(LATEXMK) $(LATEXMK_FLAGS) -pvc -outdir=$(BUILD_DIR) $(MAIN).tex

view: pdf
	xdg-open $(PDF)

clean:
	$(LATEXMK) -c -outdir=$(BUILD_DIR) $(MAIN).tex
	$(RM) $(BUILD_DIR)/$(MAIN).bbl

distclean:
	$(LATEXMK) -C -outdir=$(BUILD_DIR) $(MAIN).tex
	$(RM) $(PDF)
