# darwin's zprofile prepends to $PATH, keep .zshenv's preferred dirs first
echo "in my .zprofile"
if [[ -x /usr/libexec/path_helper && -v path_prepend ]]; then
  path=($path_prepend $path)
fi
