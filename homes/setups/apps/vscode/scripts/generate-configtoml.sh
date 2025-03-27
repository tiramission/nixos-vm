#!/usr/bin/env bash

# Output the VSCode version
echo 'vscode_version = "'$(code --version | head -n1)'"'
echo

# Loop through each installed extension
code --list-extensions | while read extension; do
  publisher_name=$(echo "$extension" | cut -d '.' -f 1)
  extension_name=$(echo "$extension" | cut -d '.' -f 2-)
  echo '[[extensions]]'
  echo 'publisher_name = "'$publisher_name'"'
  echo 'extension_name = "'$extension_name'"'
  echo
done
