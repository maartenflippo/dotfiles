# Personal Files

My dotfiles for various linux thingies.

## Usage

1. Clone this repository into a directoy that is a direct child of the home directory. E.g. `~/dotfiles`.
2. Install [GNU Stow](https://www.gnu.org/software/stow/).
3. Run `stow .`

## Home Manager

Run `home-manager switch --flake .#maarten` from inside the `home-manager/` directory.
To get home-manager before setting it up, use `nix-shell -p home-manager`.
