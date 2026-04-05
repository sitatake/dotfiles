# dotfiles

macOS 用の個人 dotfiles。

## 含まれる設定

| ディレクトリ | ツール | 概要 |
|---|---|---|
| `.zshrc` | Zsh | シェル設定、エイリアス、プロンプト |
| `nvim/` | Neovim | LazyVim ベース、VSCode テーマ + 背景透過 |
| `ghostty/` | Ghostty | ターミナル設定、Cmd→Ctrl リマップ |
| `zellij/` | Zellij | マルチプレクサ、カスタムキーバインド |
| `mise/` | mise | ツールバージョン管理 |

## セットアップ

```sh
# シンボリックリンクを作成
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config
ln -sf ~/dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
ln -sf ~/dotfiles/mise/config.toml ~/.config/mise/config.toml
```

## 主な依存ツール

[Homebrew](https://brew.sh/) 経由でインストール:

```sh
brew install zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-git-prompt
brew install zellij zoxide fzf mise
```

その他: [Rust/cargo](https://rustup.rs/), [uv](https://docs.astral.sh/uv/), [pnpm](https://pnpm.io/)
