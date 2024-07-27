default: build
build:
	pdflatex main.tex
watch:
	latexmk -pdf -pvc main.tex

