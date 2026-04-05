#!/bin/bash

files_and_paths=(
  ".zshrc:~/.zshrc"
  "nvim:~/.config/nvim"
  "ghostty/config:~/.config/ghostty/config"
  "zellij/config.kdl:~/.config/zellij/config.kdl"
  "mise/config.toml:~/.config/mise/config.toml"
)

# シンボリックリンクを作成する関数
create_symlink() {
  local source_file
  source_file=$(realpath "$1")
  local destination_path="${2/#\~/$HOME}"

  local backup_file="${destination_path}.bak" # 退避先のファイル名

  mkdir -p "$(dirname "$destination_path")"

  if [ -e "$destination_path" ]; then
    mv "$destination_path" "$backup_file"
  fi

  ln -s "$source_file" "$destination_path" # シンボリックリンクの作成
  echo "Linked: $source_file -> $destination_path"
}

for entry in "${files_and_paths[@]}"; do
  IFS=":" read -r source_file destination_path <<<"$entry"
  create_symlink "$source_file" "$destination_path"
done
