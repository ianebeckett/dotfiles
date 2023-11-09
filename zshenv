# runs in both interactive and non-interactive shells
echo 'howdy from .zshenv'

# useful for conditional installs
# command -v is like which, but returns exit status
function exists() {
    command -v $1 > /dev/null 2>&1
}
