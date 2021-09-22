# rules
# -----

all: fr-short en-short

fr-short: cv-fr-short.tex
	latexmk -xelatex -shell-escape $<
	@echo ""
	@echo "done"

en-short: cv-en-short.tex
	latexmk -xelatex -shell-escape $<
	@echo ""
	@echo "done"

# dependencies
# ------------
cv-en-short.tex: img/MB.png
cv-fr-short.tex: img/MB.png

# WARNING sauvage clean
# ---------------------
clean:
	@echo ""
	@echo "Clean up files"
	@echo "--------------"
	rm -vf *.pdf *.aux *.log *.fls *.fdb_latexmk *.bbl *.out *.blg *.synctex.gz *.xdv
	ls -lrth
	@echo ""
	@echo "done"
