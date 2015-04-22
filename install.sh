#!/bin/bash
#
# Symlink dotfiles in home with dotfiles in this folder.
# Backs up home files in the dotfiles/backup folder.

GLOBIGNORE='.:..:.DS_Store:.git:.gitignore'

create_backup_folder () {
  mkdir -p "./backup"
}

backup_file () {
  local file="$1"
  local current_dir="$2"

  if [[ -f ${file} ]]; then
    echo "backing up file ${file} to ${current_dir}/backup..."
    mv "${file}" "${current_dir}/backup"
    return "$?"
  elif [[ -d ${file} ]]; then
    echo "backing up directory ${file} to ${current_dir}/backup..."
    mv "${file}" "${current_dir}/backup"
    return "$?"
  fi
}

install_file () {
  local file="$1"
  local current_dir="$2"
  local dot_file_path="${current_dir}/${file}"

  # We don't want to install on top of symlinks
  if [[ -L ${file} ]]; then
    echo "${file} is already installed."
  else
    backup_file "${file}" "${current_dir}"
    if [[ "$?" -ne 0 ]]; then
      echo "Could not backup ${file}."
      return 1
    fi

    echo "installing ${file}"
    ln -s "${dot_file_path}" "~/${file}"
  fi
}

main () {
  local DOT_FILES=".*"
  local current_dir
  current_dir="$(pwd)" || return

  create_backup_folder
  for dot_file in ${DOT_FILES}; do
    cd ~
    install_file "${dot_file}" "${current_dir}"
    cd "${current_dir}"
  done
}

main "$@"

unset GLOBIGNORE
