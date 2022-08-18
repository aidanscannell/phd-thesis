VERSION 0.6
FROM silex/emacs
WORKDIR /code

export-org-to-tex:
    COPY init.el .
    RUN	emacs --batch -l init.el --kill
    COPY phd-thesis.org .
    RUN	emacs --batch -l init.el phd-thesis.org -f org-latex-export-to-latex --kill
    SAVE ARTIFACT phd-thesis.tex build/phd-thesis.tex AS LOCAL build/phd-thesis.tex

export-org-to-pdf:
    FROM blang/latex:ubuntu
    # FROM koppor/texlive
    COPY +export-org-to-tex/build/phd-thesis.tex .
    COPY zotero-library.bib .
    COPY --dir mimosis-class images ./
    RUN pwd
    RUN ls
    RUN mkdir compile && \
        latexmk -cd -f -jobname=output -outdir=./compile -auxdir=./compile -interaction=nonstopmode -pdf ./phd-thesis.tex
        # latexmk -cd -f -jobname=output -outdir=./compile -auxdir=./compile -interaction=batchmode -pdf ./phd-thesis.tex
    # RUN latexmk -f -silent phd-thesis.tex
    SAVE ARTIFACT phd-thesis.pdf build/phd-thesis.pdf AS LOCAL build/phd-thesis.pdf

# export-org-to-pdf:
#     FROM earthly/dind:alpine
#     COPY init.el .
#     COPY phd-thesis.org .
#     COPY docker-compose.yml ./
#     COPY zotero-library.bib .
#     COPY mimosis-class .
#     COPY images images
#     WITH DOCKER --compose docker-compose.yml
#         RUN	emacs --batch -l init.el phd-thesis.org -f org-latex-export-to-latex --kill && \
#             latexmk -f -silent phd-thesis.tex
#     END
#     SAVE ARTIFACT phd-thesis.pdf build/phd-thesis.pdf AS LOCAL build/phd-thesis.pdf
#     SAVE ARTIFACT phd-thesis.tex build/phd-thesis.tex AS LOCAL build/phd-thesis.tex

#     FROM blang/latex:ubuntu
#     # RUN	emacs --batch -l .config/emacs/init.el phd-thesis.org -f org-latex-export-to-latex --kill
#     COPY zotero-library.bib .
#     COPY mimosis-class .
#     COPY images .
#     RUN pwd
#     SAVE ARTIFACT phd-thesis.pdf build/phd-thesis.pdf AS LOCAL build/phd-thesis.pdf
#     SAVE ARTIFACT phd-thesis.tex build/phd-thesis.tex AS LOCAL build/phd-thesis.tex
