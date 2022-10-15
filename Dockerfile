FROM silex/emacs:28.1-ci
# RUN apt update
# FROM ubuntu:22.04
RUN apt update
RUN apt install -y texlive-full
RUN apt install -y emacs
# COPY init.el /home/.config/emacs/init.el
COPY init.el .
RUN emacs --batch -l init.el --kill  # install packages from ELPA etc
# RUN apt -y install texlive-full
# RUN apt -y install emacs
# RUN apt -y install texlive-full
# RUN apt -y install emacs28.1
# RUN apt -y install snapd
# RUN apt remove --autoremove emacs emacs-common
# RUN apt install emacs28
# RUN add-apt-repository ppa:kelleyk/emacs
# RUN snap install emacs --classic
            # latexmk -pdf -cd -f -interaction=nonstopmode phd-thesis.tex
# RUN apt -y install texlive-latex-base
# RUN apt -y install git
# RUN apt -y install make
# RUN apt -y install latexmk
# RUN tlmgr init-usertree
# RUN tlmgr install koma-script
# RUN mkdir ./compile
# COPY init.el ~/.config/emacs/init.el
# COPY init.el .
# RUN emacs --batch -l init.el --kill  # install packages from ELPA etc

# Set container's working directory - this is arbitrary but needs to be "the same" as the one you later use to transfer files out of the docker image
# WORKDIR /docker_rpy

# COPY . .
COPY images images
COPY mimosis-class mimosis-class
COPY phd-thesis.org .
COPY zotero-library.bib .
COPY .latexmkrc .
# ENTRYPOINT emacs --batch -l init.el phd-thesis.org -f org-latex-export-to-latex --kill
# Run commands specified in "run.sh" to get started
# ENTRYPOINT ["sh", "src/run.sh"]

# ENTRYPOINT eemacs phd-thesis.org -f org-latex-export-to-latex --killmacs phd-thesis.org -f org-latex-export-to-latex --kill
# ENTRYPOINT emacs phd-thesis.org -f org-latex-export-to-latex --kill
# emacs --batch -l init.el phd-thesis.org -f org-latex-export-to-latex --kill
# ENTRYPOINT pdflatex -f -silent -interaction=nonstopmode -output-format=pdf phd-thesis.tex

# ENTRYPOINT pdflatex -interaction=nonstopmode -outdir=./compile -output-format=pdf phd-thesis.tex

# ENTRYPOINT emacs --batch -l init.el phd-thesis.org -f org-latex-export-to-latex --kill

# export-org-to-tex:
#     COPY init.el .
#     RUN	emacs --batch -l init.el --kill
#     COPY phd-thesis.org .
#     RUN	emacs --batch -l init.el phd-thesis.org -f org-latex-export-to-latex --kill
#     SAVE ARTIFACT phd-thesis.tex build/phd-thesis.tex AS LOCAL build/phd-thesis.tex

# export-org-to-pdf:
#     FROM blang/latex:ubuntu
#     # FROM koppor/texlive
#     COPY +export-org-to-tex/build/phd-thesis.tex .
#     COPY zotero-library.bib .
#     # COPY latexmkrc .
#     COPY .latexmkrc .
#     COPY --dir mimosis-class images ./
#     RUN pwd
#     RUN ls
#     RUN latexmk -f -silent -interaction=nonstopmode -output-format=pdf phd-thesis.tex

#         # mkdir compile && \
#         # latexmk -interaction=nonstopmode -output-directory=./compile -output-format=pdf -f phd-thesis.tex
#         # latexmk -cd -f -jobname=output -outdir=./compile -auxdir=./compile -interaction=batchmode -pdf phd-thesis.tex
#     SAVE ARTIFACT phd-thesis.pdf build/phd-thesis.pdf AS LOCAL build/phd-thesis.pdf

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
