# Curriculum vitæ

![Static Badge](https://img.shields.io/badge/LaTeX-%23008000?style=for-the-badge&logo=latex)

Curriculum Vitæ containing information about professional experience, projects, education, and more.

- [Currículo em Português](https://helpmeagain.github.io/curriculum-vitae/)
- [Curriculum in English](https://helpmeagain.github.io/curriculum-vitae/curriculum-felipe-marques.pdf)

## Local installation

The build is defined as a [Nix flake](https://nixos.wiki/wiki/Flakes) (`flake.nix`): it pins the exact TeX Live packages needed (no `texlive-full`) and builds both PDFs hermetically, so the same recipe runs on your machine and in CI.

1. Clone the repository and `cd` into it.

2. With [Nix](https://nixos.org/download) installed and flakes enabled, build both CVs:

```bash
nix build .#default
```

The PDFs are written to `result/curriculo-felipe-marques.pdf` and `result/curriculum-felipe-marques.pdf`. `make` does the same thing and copies the output into `dist/`.

To build a single language, or iterate with `latexmk` directly:

```bash
nix build .#curriculo-pt      # Portuguese only
nix build .#curriculum-en     # English only
nix develop                   # drop into a shell with latexmk/biber available
```

## Credits

This repository was adapted from:

- AutoCV by [jitinnair1](https://github.com/jitinnair1/autoCV)
- Build Workflow by [MateusRosario](https://github.com/MateusRosario/myAutoCV/blob/main/.github/workflows/build.yml)
