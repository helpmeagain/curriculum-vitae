NAME_PT=cv
NAME_EN=cv-en

all:
	latexmk -pdf ${NAME_PT}.tex
	latexmk -pdf ${NAME_EN}.tex

clean:
	rm -f ${NAME_PT}.aux ${NAME_PT}.bbl ${NAME_PT}.bcf ${NAME_PT}.fdb_latexmk ${NAME_PT}.fls ${NAME_PT}.log ${NAME_PT}.out ${NAME_PT}.run.xml ${NAME_PT}.blg ${NAME_PT}.toc *\~
	rm -f ${NAME_EN}.aux ${NAME_EN}.bbl ${NAME_EN}.bcf ${NAME_EN}.fdb_latexmk ${NAME_EN}.fls ${NAME_EN}.log ${NAME_EN}.out ${NAME_EN}.run.xml ${NAME_EN}.blg ${NAME_EN}.toc *\~

distclean: clean
	rm -f ${NAME_PT}.pdf
	rm -f ${NAME_EN}.pdf
