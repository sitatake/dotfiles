# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS (Darwin) 用の個人 dotfiles リポジトリ。各ツールの設定ファイルをこのリポジトリで一元管理している。

## Repository Structure

- `.zshrc` — Zsh 設定（PATH、エイリアス、プロンプト、プラグイン）
- `nvim/` — LazyVim ベースの Neovim 設定
- `ghostty/` — Ghostty ターミナル設定
- `zellij/` — Zellij ターミナルマルチプレクサ設定
- `mise/` — mise (ツールバージョンマネージャ) 設定

## Key Architecture Decisions

### Neovim
- **LazyVim** をベースフレームワークとして使用。プラグイン管理は lazy.nvim。
- カラースキーム: `vscode` (Mofiqul/vscode.nvim) + `transparent.nvim` で背景透過
- LazyVim extras: `ai.claudecode`, `lang.markdown` を有効化
- IME 自動切替: `im-select.nvim` で InsertEnter 時に `com.apple.keylayout.ABC` に切り替え
- Lua フォーマッタ: StyLua (`indent_type = "Spaces"`, `indent_width = 2`, `column_width = 120`)
- `nvim/lua/plugins/example.lua` はテンプレートファイル（`if true then return {} end` で無効化済み）。参考用なので変更しない。

### Shell Environment
- Homebrew 経由: zsh-completions, zsh-autosuggestions, zsh-syntax-highlighting, zsh-git-prompt
- ツールチェーン: Rust (cargo), uv/uvx (Python), pnpm (Node.js), mise (fzf 管理)
- zoxide (`cd` にエイリアス), fzf (プレビュー付き), zellij (自動起動)
- エイリアス: `m` = `mise run`, `l` = `ls -a`, `ll` = `ls -al`

### Ghostty
- Cmd キーを Ctrl コードにリマップしている（Cmd+A → Ctrl-A 等）。zellij のキーバインドとの統合目的。

### Zellij
- `clear-defaults=true` でデフォルトキーバインドをクリアし、完全カスタムで定義
- tmux 互換モード (`Ctrl b` でtmux モードに入る) を含む
- hjkl ナビゲーションを全モードで統一
