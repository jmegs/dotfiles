# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# No arguments: `git status`
# With arguments: acts like `git`
function g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

# copy the contents of one dir to another
function copydir() {
  [ $# -eq 0 ] && { echo "Usage: $0 from to"; exit 1; }
  [ ! -d "$2" ] && mkdir -p "$2"
  rsync -avhW --compress-level=0 --progress $1/ $2/
}