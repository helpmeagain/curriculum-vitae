{
  description = "Curriculum vitae build environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        texlive = pkgs.texlive.combine {
          inherit (pkgs.texlive)
            scheme-basic
            latexmk
            lm
            url
            parskip
            xcolor
            geometry
            enumitem
            supertabular
            titlesec
            tools
            multirow
            biblatex
            biber
            hyperref
            fontawesome5
            babel
            babel-english
            babel-portuges
            hyphen-portuguese
            csquotes

            etoolbox
            logreq
            xkeyval
            pgf
            fontspec
            ;
        };

        buildCv = name:
          pkgs.stdenvNoCC.mkDerivation {
            pname = name;
            version = "1.0";
            src = ./.;
            nativeBuildInputs = [ texlive ];
            buildPhase = ''
              export HOME=$TMPDIR
              latexmk -pdf -interaction=nonstopmode -halt-on-error ${name}.tex
            '';
            installPhase = ''
              mkdir -p $out
              cp ${name}.pdf $out/
            '';
          };
      in
      {
        packages = {
          curriculo-pt = buildCv "curriculo-felipe-marques";
          curriculum-en = buildCv "curriculum-felipe-marques";
          default = pkgs.symlinkJoin {
            name = "curriculum-vitae";
            paths = [ (buildCv "curriculo-felipe-marques") (buildCv "curriculum-felipe-marques") ];
          };
        };

        devShells.default = pkgs.mkShell {
          packages = [ texlive ];
        };
      });
}
