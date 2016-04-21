

fr-short: cv-fr-short.tex
	latexmk -xelatex -bibtex $<

clean:
	rm -v *.aux *.log *.toc *.bbl btaux.aux
