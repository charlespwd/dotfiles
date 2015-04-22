#!/bin/bash
#
# Symlink dotfiles in home with dotfiles in this folder.
# Backs up home files in the dotfiles/backup folder.

GLOBIGNORE='.:..:.DS_Store:.git:.gitignore'

create_backup_folder () {
  mkdir -p "./backup"
}

backup_file () {
  local file=$1
  local current_dir=$2

  if [[ -f ${file} ]]; then
    echo "backing up file ${file} to ${current_dir}/backup..."
    mv ${file} "${current_dir}/backup"
  elif [[ -d ${file} ]]; then
    echo "backing up directory ${file} to ${current_dir}/backup..."
    mv ${file} "${current_dir}/backup"
  fi
}

install_file () {
  local file=$1
  local current_dir=$(pwd)
  local dot_file_path="${current_dir}/${file}"

  cd ~

  # We don't want to install on top of symlinks
  if [[ -L ${file} ]]; then
    echo "${file} is already installed."
  else
    backup_file "${file}" "${current_dir}"
    echo "installing ${file}"
    ln -s "${dot_file_path}" "~/${file}"
  fi

  cd "${current_dir}"
}

main () {
  readonly DOT_FILES=".*"

  create_backup_folder
  for dot_file in ${DOT_FILES}; do
    install_file ${dot_file}
    cd "${current_dir}"
  done
}

main "$@"

unset GLOBIGNORE
