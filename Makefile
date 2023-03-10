MAIN=main.tex
SECTIONS=$(wildcard sections/*)
REFS=$(wildcard ./refs/*.bib)
FIGS=$(wildcard ./figures/*.tikz) $(wildcard ./figures/*.tex)
PROOFS=$(wildcard ./proofs/*.tex)
MACROS=$(wildcard ./macros/*.tex)
SOURCE=$(SECTIONS) $(REFS) $(FIGS) $(PROOFS) $(MACROS)

.PHONY: clean main

main: main.pdf

main.pdf: main.tex $(SOURCE)
	latexmk -pdf $(basename $@).tex

tidy:
	latexmk -c
	rm -f *nlo *nls *run.xml

clean:
	latexmk -C
	rm -f *nlo *nls *run.xml

test:
	echo $(SOURCE)