

fr-short: cv-fr-short.tex
	xelatex $<
	xelatex $<
	bibtex cv-fr-short1.aux
	xelatex $<
	xelatex $<


clean:
	rm -v *.aux *.log *.toc *.bbl
