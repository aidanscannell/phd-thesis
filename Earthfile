VERSION 0.6
FROM silex/emacs
WORKDIR /code

export-org-to-pdf:
    FROM blang/latex:ubuntu
    COPY init.el ./.config/emacs/init.el
    # RUN	emacs --batch -l .config/emacs/init.el --kill
    COPY phd-thesis.org .
    RUN	emacs --batch -l .config/emacs/init.el phd-thesis.org -f org-latex-export-to-latex --kill
    # RUN	emacs --batch -l .config/emacs/init.el phd-thesis.org -f org-latex-export-to-latex --kill
    COPY zotero-library.bib .
    COPY mimosis-class .
    COPY images .
    RUN pwd
    RUN latexmk -f -silent build/phd-thesis.tex
    SAVE ARTIFACT phd-thesis.pdf build/phd-thesis.pdf AS LOCAL build/phd-thesis.pdf
    SAVE ARTIFACT phd-thesis.tex build/phd-thesis.tex AS LOCAL build/phd-thesis.tex
