VERSION 0.6
# WORKDIR /code

emacs-docker:
    FROM silex/emacs
    COPY init.el ./.config/emacs/init.el
    RUN	emacs --batch -l .config/emacs/init.el --kill
    SAVE IMAGE emacs-image:latest

latex-docker:
    FROM blang/latex:ubuntu
    SAVE IMAGE latex-image:latest

export-org-to-latex:
    # Export phd-thesis.org to phd-thesis.tex
    FROM +emacs-docker
    COPY phd-thesis.org .
    RUN	emacs --batch -l .config/emacs/init.el phd-thesis.org -f org-latex-export-to-latex --kill
    # RUN	emacs --batch phd-thesis.org -f org-latex-export-to-latex --kill
    SAVE ARTIFACT phd-thesis.tex build/phd-thesis.tex AS LOCAL build/phd-thesis.tex

export-tex-to-pdf:
    # Build pdf from tex file
    FROM +latex-docker
    COPY +export-org-to-latex/build/phd-thesis.tex .
    COPY zotero-library.bib .
    COPY mimosis-class .
    COPY images .
    RUN latexmk -f -silent phd-thesis.tex
    SAVE ARTIFACT phd-thesis.pdf build/phd-thesis.pdf AS LOCAL build/phd-thesis.pdf
    # WITH DOCKER --load test:latest=+latex-docker
    #     # RUN docker run test:latest
    #     RUN latexmk -f -silent phd-thesis.tex
    # END

# export-org-to-pdf:
