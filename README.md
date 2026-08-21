# nixos-config

Nix Flake ベースの NixOS / nix-darwin 設定リポジトリ。

## ホスト構成

| ホスト | OS | 用途 |
|--------|----|------|
| `desktop` | NixOS | デスクトップ PC |
| `surface` | NixOS | Surface デバイス |
| `wsl` | NixOS (WSL) | WSL 環境 |
| `freesia` | nix-darwin | macOS (aarch64) |
| `zephyr` | nix-darwin | macOS (aarch64) |

## ディレクトリ構成

```
.
├── flake.nix                  # Flake エントリポイント
├── configuration.nix          # 共通 NixOS 設定
├── hosts/                     # ホスト別設定
│   ├── desktop/
│   ├── surface/
│   ├── wsl/
│   ├── freesia/
│   └── zephyr/
├── flake/hosts/               # Flake ホスト定義
├── modules/                   # NixOS モジュール
│   ├── boot.nix
│   ├── font.nix
│   ├── i18n.nix
│   ├── logitech.nix
│   ├── network/
│   ├── secureboot.nix
│   ├── wm/                    # ウィンドウマネージャ (niri, noctalia)
│   └── xremap/
├── home/                      # Home Manager 設定
│   ├── default.nix            # 共通 HM エントリ (desktop 用)
│   ├── freesia.nix            # freesia 用 HM
│   ├── surface.nix            # surface 用 HM
│   ├── wsl.nix                # wsl 用 HM
│   └── programs/              # プログラム別 HM モジュール (77 パッケージ)
├── pkgs/                      # カスタムパッケージ
├── nvidia/                    # NVIDIA 設定
└── configs/                   # ドットファイル・raw 設定
```

## ビルドコマンド

```bash
# NixOS (desktop/surface/wsl/saffron)
nh os switch -H <hostname> .         # 推奨
sudo nixos-rebuild switch --flake .#<hostname>

# nix-darwin (freesia/zephyr)
nh darwin switch -H <hostname> .
darwin-rebuild switch --flake .#<hostname>

# Dry run (テスト)
nh os switch -n
nh darwin switch -n
```
