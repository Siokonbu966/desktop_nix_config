## Architecture & Boundaries
- **Nix Flake Monorepo**: Manages NixOS (`desktop`, `surface`, `wsl`) and nix-darwin (`freesia`).
- **OS Entrypoints**: `flake.nix` exports `nixosConfigurations` and `darwinConfigurations`. Host-specific configurations live in `hosts/<name>/default.nix` and `hosts/<name>/configuration.nix`, which typically import the shared root `configuration.nix` (except freesia/wsl where appropriate).
- **Home Manager**: Wired directly into the NixOS/darwin module tree via `home-manager.nixosModules.home-manager` (`useGlobalPkgs = true`). HM configurations are under `home/` with per-host entrypoints (`home/freesia.nix`, `home/wsl.nix`, `home/surface.nix`, and `home/default.nix` for desktop). **Do not use standalone `home-manager switch`.**
- **Nixvim**: Located at `home/programs/nixvim/`. While it contains its own `flake.nix`, its configuration is evaluated within the main flake via `nixvim-module` (passed into `extraSpecialArgs`). Edit `home/programs/nixvim/config.nix` or its imports.
- **Dotfiles & Configs**: Raw non-Nix configuration files belong in `configs/` or are sourced from the external `my-dotfiles` flake input (injected into `extraSpecialArgs` and mapped in `home/programs/utils/dotfiles.nix`).

## Developer Workflows
- **NixOS Rebuild**: `nh os switch` (or fallback to `sudo nixos-rebuild switch --flake .#<hostname>`).
- **macOS Rebuild**: `nh darwin switch` (or fallback to `darwin-rebuild switch --flake .#freesia`).
- **Git Tracking Requirement**: Because this is a Nix Flake, **you must `git add` any newly created files** before attempting to build. The Nix evaluator cannot see untracked files.
- **Test**: When change nix configuration then Use `nh os switch -n`, `nh darwin switch -n` and test flake files.
- **Niri**: When change niri configuration then use `niri validate -c configs/niri/config.kdl` and test config file.
