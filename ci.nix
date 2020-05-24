let
  project = import ./project.nix { };
  pkgs = import <nixpkgs> { };
in
pkgs.recurseIntoAttrs {
  # Build both default.nix and shell.nix such that both derivations are
  # pushed to cachix. This allows the development workflow (bin/run, etc.) to
  # use cachix to full extent.
  neuron = project.ghc.neuron.bin;
  neuronShell = project.shells.ghc;
}
