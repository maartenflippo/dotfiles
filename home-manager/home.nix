{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      neovim
    ];

    # Needs to match the username
    username = "maarten";
    homeDirectory = "/home/maarten";

    stateVersion = "26.04";
  };
}
