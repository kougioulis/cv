# Variables
#TEX = pdflatex
TEX = TEXINPUTS=./libtex//: pdflatex # use local .cls and .sty files
DOC = cv_english
DOC_FR = cv_francais
LATEXMK = latexmk

# Main targets
all: $(DOC).pdf $(DOC_FR).pdf

english: $(DOC).pdf
french: $(DOC_FR).pdf

$(DOC).pdf: $(DOC).tex
	$(TEX) $(DOC).tex      # First LaTeX run
	$(TEX) $(DOC).tex      # Second LaTeX run (resolve citations)
	$(TEX) $(DOC).tex      # Third LaTeX run (resolve cross-references)

$(DOC_FR).pdf: $(DOC_FR).tex
	$(TEX) $(DOC_FR).tex   # First LaTeX run
	$(TEX) $(DOC_FR).tex   # Second LaTeX run (resolve citations)
	$(TEX) $(DOC_FR).tex   # Third LaTeX run (resolve cross-references)

# Auxiliary files cleanup
clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.out *.lof *.lot *.acn *.acr *.alg *.glg *.glo *.glsdefs *.ist *.ilg *.ind *.fls *.fdb_latexmk *.synctex.gz *.bcf *.xml

# Clean all including the generated .pdf
cleanall: clean
	rm -f $(DOC).pdf
	rm -f $(DOC_FR).pdf
