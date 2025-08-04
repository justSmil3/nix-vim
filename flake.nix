{
  description = "NVim setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }: {
    packages.aarch64-darwin = let
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    in {
      default = 
        (
         nvf.lib.neovimConfiguration { 
          pkgs = pkgs;
          modules = [ 
            ./vimconfig.nix
          ];
         }
        ).neovim;
      nvf = pkgs.writeShellApplication {
        name = "nvf";
        runtimeInputs = [ self.packages.aarch64-darwin.default ];
        text = "exec nvim \"$@\"";
      };
    };

    apps.aarch64-darwin = {
      nvf = { 
        type = "app";
        program = "${self.packages.aarch64-darwin.default}/bin/nvim";
      };
    };
  };
}
