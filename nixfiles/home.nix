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
    # theme = "~/.config/rofi/themes/gruvbox.rasi";
  };

  programs.fish = {
    enable = true;
    shellInit = builtins.readFile /home/marcel/.config/fish/prenix-config.fish;
    plugins = [
      {
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
          sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
        };
      }
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
      {
        name = "base16-fish";
        src = pkgs.fetchFromGitHub {
          owner = "tomyun";
          repo = "base16-fish";
          rev = "2f6dd973a9075dabccd26f1cded09508180bf5fe";
          sha256 = "142fmqm324gy3qsv48vijm5k81v6mw85ym9mmhnvyv2q2ndg5rix";
        };
      }
      {
        name = "bang-bang";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-bang-bang";
          rev = "f969c618301163273d0a03d002614d9a81952c1e";
          sha256 = "1r3d4wgdylnc857j08lbdscqbm9lxbm1wqzbkqz1jf8bgq2rvk03";
        };
      }
      {
        name = "nvm";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "nvm.fish";
          rev = "81170ef5bc127af4622aa456122c77f363f247bc";
          sha256 = "0ra0yj8nksza1j84l5v5063w0cyxwwb7sxqggf2rlh3i3j77ldz6";
        };
      }
      {
        name = "nvm";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "nvm.fish";
          rev = "81170ef5bc127af4622aa456122c77f363f247bc";
          sha256 = "0ra0yj8nksza1j84l5v5063w0cyxwwb7sxqggf2rlh3i3j77ldz6";
          fetchSubmodules = true;
        };
      }
      {
        name = "bass";
        src = pkgs.fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "2fd3d2157d5271ca3575b13daec975ca4c10577a";
          sha256 = "0mb01y1d0g8ilsr5m8a71j6xmqlyhf8w4xjf00wkk8k41cz3ypky";
        };
      }
    ];
  };

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
