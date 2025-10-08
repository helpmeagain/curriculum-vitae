NAME_PT=cv
NAME_EN=cv-en
OUTDIR=dist

all:
	mkdir -p $(OUTDIR)
	latexmk -pdf -outdir=$(OUTDIR) $(NAME_PT).tex
	latexmk -pdf -outdir=$(OUTDIR) $(NAME_EN).tex

clean:
	rm -rf $(OUTDIR)