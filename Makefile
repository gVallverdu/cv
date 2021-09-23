# rules
# -----

all: fr-short en-short en-coverletter

fr-short: cv-fr-short.tex
	latexmk -xelatex $<
	@echo ""
	@echo "done"

en-short: cv-en-short.tex
	latexmk -xelatex $<
	@echo ""
	@echo "done"

en-coverletter: coverletter-en.tex
	latexmk -xelatex $<
	@echo ""
	@echo "done"

# dependencies
# ------------
cv-fr-short.tex: img/MB.png
cv-en-short.tex: img/MB.png

# WARNING
# ---------------------
clean:
	@echo ""
	@echo "Clean up files"
	@echo "--------------"
	rm -vf *.pdf *.aux *.log *.fls *.fdb_latexmk *.bbl *.out *.blg *.synctex.gz *.xdv
	ls -lrth
	@echo ""
	@echo "done"