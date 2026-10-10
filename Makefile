OUTDIR=dist

all:
	nix build .#default -o $(OUTDIR)

clean:
	rm -rf $(OUTDIR) result result-*
