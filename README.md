thesis template
===============

> using `nix` dev env shells via `flakes`
>
> and `gnu/emacs`'s `org-mode` to generate `pdf, html, txt, tex`, etc.
>
> The use of `flakes` helps to ensure that everyone can build the final `pdf` and run the 
> code of the repo with the exact same versions, ensuring
> reproducibility and makes it easier for reviewers to check the calimity of the work.


## TOC

- [**env setup**](https://github.com/felixbd/thesis-template?tab=readme-ov-file#1-env-setup)
- [**build pdf**](https://github.com/felixbd/thesis-template?tab=readme-ov-file#2-build-pdf-html-txt)


## 1. env setup

> see: https://nixos.org/download/


### 1.1 install `nix` (the package manager)

> for non NixOS user

```sh
# Multi-user installation (recommended)
sh <(curl -L https://nixos.org/nix/install) --daemon

# Single-user installation
# sh <(curl -L https://nixos.org/nix/install) --no-daemon
```


### 1.2 enable the `flakes` feature

> for NixOS user

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

> for other user

```sh
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```


### 1.3 enter the dev env shell

if you have cloned the repository and are currently in the root directory of the repository

```sh
nix develop
```

or if you want to enter the dev env shell without cloning the repository

```sh
nix develop url ...  # TODO
```

## 2 build pdf, html, txt

use the `Makefile`

```sh
mkae build
```

and

```sh
make open
```

