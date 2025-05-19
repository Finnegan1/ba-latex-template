SRC = simple.tex
OUTDIR = build
PDF = $(OUTDIR)/simple.pdf

# Default target: build the PDF
.PHONY: all
all: $(OUTDIR)
	latexmk -pdf -outdir=$(OUTDIR) $(SRC)

# Watch for changes and rebuild
.PHONY: watch
watch: $(OUTDIR)
	latexmk -pdf -pvc -outdir=$(OUTDIR) $(SRC)

# Clean up generated files
.PHONY: clean
clean:
	latexmk -C -outdir=$(OUTDIR) $(SRC)

.PHONY: open
open:
	zathura $(PDF)

$(OUTDIR):
	mkdir -p $(OUTDIR)
