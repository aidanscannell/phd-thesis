FROM silex/emacs:28.1
COPY init.el .
COPY images images
COPY mimosis-class mimosis-class
COPY phd-thesis.org .
COPY zotero-library.bib .
COPY .latexmkrc .

RUN apt-get update
RUN apt-get install -y texlive-full

CMD emacs --batch -l init.el phd-thesis.org -f org-latex-export-to-pdf --kill
