TEX_BASE:=/Library/TeX/texbin/

PDFLATEX:=$(TEX_BASE)/pdflatex
LATEX:=$(TEX_BASE)/latex
DVIPDFM:=$(TEX_BASE)/dvipdfm
BIBTEX:=$(TEX_BASE)/bibtex
BIBER:=$(TEX_BASE)/biber

all: document.pdf

#document.pdf: document.dvi
#	$(DVIPDFM) -z0 document.dvi


document.pdf: document.tex content.tex frontpage.tex preamble.tex document.bbl
	$(PDFLATEX) document.tex

#document.bbl

#document.bbl: document.aux
#	$(BIBTEX) document.aux

document.aux:
	$(PDFLATEX) document.tex

document.bbl: references.bib document.aux
	$(BIBER) document

clean:
	rm -f document.aux document.bbl document.log document.run.xml document.bcf document.blg document.out document.pdf document.toc
