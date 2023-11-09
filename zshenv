# runs in both interactive and non-interactive shells
echo 'howdy from .zshenv'

# useful for conditional installs
function exists() {
    command -v $1 > /dev/null 2>&1
}
