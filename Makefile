filename=phd-thesis
# SOURCES=phd-thesis.tex
# PDF_OBJECTS=$(SOURCES:.tex=.pdf)

# LATEXMK=latexmk
# LATEXMK_OPTIONS=-bibtex -pdf -pdflatex="pdflatex -interaction=nonstopmode"

# DOCKER=docker
# DOCKER_COMMAND=run --rm -w .
# # DOCKER_COMMAND=run --rm -w . --env LATEXMK_OPTIONS_EXTRA=$(LATEXMK_OPTIONS_EXTRA)
# DOCKER_MOUNT=-v`pwd`:/data

# all: render

# .PHONY: build
# build:
# 	docker build -t emacs-image .

# pdf: $(PDF_OBJECTS)
# 	docker run emacs-image "emacs --batch -l init.el phd-thesis.org -f org-latex-export-to-pdf --kill"
# 	docker cp emacs-image:/phd-thesis.pdf ./phd-thesis-docker.pdf

# %.pdf: %.tex
# 	@echo Input file: $<
# 	$(LATEXMK) $(LATEXMK_OPTIONS_EXTRA) $(LATEXMK_OPTIONS) $<


all: ${filename}.org
	emacs --batch -l init.el phd-thesis.org -f org-latex-export-to-pdf --kill

# 	pdflatex -interaction=nonstopmode -f ${filename}.tex
# 	bibtex ${filename}
# 	# pdflatex ${filename}.tex
# 	pdflatex -interaction=nonstopmode -f ${filename}.tex

# submission:
# 	gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER -dPrinted=false -dFirstPage=1 -dLastPage=10 -sOutputFile=submission.pdf ${filename}.pdf

# appendix:
# 	gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER -dPrinted=false -dFirstPage=11 -sOutputFile=supplement.pdf ${filename}.pdf
