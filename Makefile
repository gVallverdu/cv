# rules
# -----

en-short: cv-en-short.tex
	latexmk -xelatex -shell-escape $<
	@echo ""
	@echo "done"

# dependencies
# ------------
cv-en-short.tex: img/MB.png

# WARNING sauvage clean
# ---------------------
clean:
	@echo ""
	@echo "Clean up files"
	@echo "--------------"
	rm -vf *.aux *.log *.fls *.fdb_latexmk *.bbl *.out *.blg *.synctex.gz *.xdv
	ls -lrth
	@echo ""
	@echo "done"
