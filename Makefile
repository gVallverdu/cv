# rules
# -----

fr-short: cv-fr-short.tex
	latexmk -xelatex -bibtex $<
	@echo ""
	@echo "Clean up files"
	@echo "--------------"
	latexmk -c $<
	rm -v btbbl.aux btaux.aux cv-fr-short1.bbl
	ls -lrth
	@echo ""
	@echo "done"

en-short: cv-en-short.tex
	latexmk -xelatex -bibtex $<
	@echo ""
	@echo "Clean up files"
	@echo "--------------"
	latexmk -c $<
	rm -v btbbl.aux btaux.aux cv-en-short1.bbl
	ls -lrth
	@echo ""
	@echo "done"


# dependencies
# ------------
cv-fr-short.tex: img/germain.JPG bib/achemso_perso.bst bib/articles.bib
cv-en-short.tex: img/germain.JPG bib/achemso_perso.bst bib/articles.bib


clean:
	rm -v *.aux *.log *.toc *.bbl btaux.aux
