{ config, pkgs, lib, ... }:

{
  config.vim = {
    
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    options = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smarttab = true;
      autoindent = true;
    };

    keymaps = [
    {
      key = "<leader>w";
      mode = ["n"];
      action = ":w<CR>";
      silent = true;
      desc = "save file";
    }
    {
      key = "<leader>wq";
      mode = ["n"];
      action = ":wq<CR>";
      silent = true;
      desc = "save file and quit";
    }
      {
        key = "<leader>q";
        mode = ["n"];
        action = ":q<CR>";
        silent = true;
        desc = "quit";
      }
      {
        key = "<leader>q!";
        mode = ["n"];
        action = ":q!<CR>";
        silent = true;
        desc = "force quit";
      }
      {
        key = "<leader>ff";
        mode = ["n"];
        lua = true;
        action = "require('telescope.builtin').find_files";
        silent = true;
        desc = "find files";
      }
      {
        key = "<leader>fg";
        mode = ["n"];
        lua = true;
        action = "require('telescope.builtin').live_grep";
        silent = true;
        desc = "find files";
      }
      {
        key = "<leader>fb";
        mode = ["n"];
        lua = true;
        action = "require('telescope.builtin').buffers";
        silent = true;
        desc = "find files";
      }
      {
        key = "<leader>fh";
        mode = ["n"];
        lua = true;
        action = "require('telescope.builtin').help_tags";
        silent = true;
        desc = "find files";
      }
    ];

    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      python.enable = true;
      ts.enable = true;

      nix.format.enable = true;
      python.format.enable = true;
      ts.format.enable = true;
    };
    
    telescope = {
      enable = true;
    };   

    undoFile.enable = true;

    ui = {
      borders.enable = true;
      noice = {
        enable = true;
      };
    };
  };
}
