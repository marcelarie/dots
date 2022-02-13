{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  services.picom.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "marcel";
  home.homeDirectory = "/home/marcel";

  xsession = {
      pointerCursor = {
        package = pkgs.paper-icon-theme;
        name = "Paper";
        size = 38;
      };
  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    viAlias = true;
    withPython3 = true;
    extraConfig = ''luafile /home/marcel/.config/nvim/nix.init.lua'';

    extraPackages = with pkgs; [
       tree-sitter
       pkgs.rnix-lsp
       nodePackages.typescript
       nodePackages.typescript-language-server
    ];
  };

  programs.rofi = {
    enable = true;
    font = "FiraCode 20";
    # theme = "~/.cache/wal/colors-rofi-dark.rasi";
  };

  # programs.fish = {
  #       enable = true;
  #       plugins = [{
  #           name="foreign-env";
  #           src = pkgs.fetchFromGitHub {
  #           owner = "oh-my-fish";
  #           repo = "plugin-foreign-env";
  #           rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
  #           sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
  #       };
  #   }];
  # };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
