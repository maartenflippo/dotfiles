{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      alacritty
      neovim
      fzf
      oh-my-posh
      zoxide
      lazygit
    ];

    # Needs to match the username
    username = "maarten";
    homeDirectory = "/home/maarten";

    stateVersion = "26.05";
  };
}
