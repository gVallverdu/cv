# simple latex makefile

#CC=pdflatex
CC=xelatex

dossier: dossier.tex
	$(CC) $<
	$(CC) $<
	bibtex $@1
	bibtex $@2
	bibtex $@3
	bibtex $@4
	bibtex $@5
	bibtex $@6
	$(CC) $<
	$(CC) $<

cv_long: cv_long.tex
	$(CC) $<
	$(CC) $<
	bibtex $@1
	bibtex $@2
	bibtex $@3
	bibtex $@4
	$(CC) $<
	$(CC) $<

clean:
	rm -v *.aux *.log *.bbl *.blg *.synctex.gz *.toc
