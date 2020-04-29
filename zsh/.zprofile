# darwin's zprofile prepends to $PATH, keep .zshenv's preferred dirs first
if [[ -x /usr/libexec/path_helper && -v path_prepend ]]; then
  path=($path_prepend $path)
fi
# Optionally load local profile items
[[ -s ~/.zshlocal/.zprofile ]] && source ~/.zshlocal/.zprofile
