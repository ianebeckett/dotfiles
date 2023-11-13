# runs in both interactive and non-interactive shells
echo "\n howdy from .zshenv \n"

# useful for conditional installs
# command -v is like which, but returns exit status
function exists() {
    command -v $1 > /dev/null 2>&1
}
