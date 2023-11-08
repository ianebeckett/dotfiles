# runs in both interactive and non-interactive shells
echo 'Howdy from .zshenv'

# useful for conditional installs
# exists foo && bar || baz # (exists foo) ? bar : baz;
#if exists foo; then
#    bar
#else
#    baz
#fi

function exists() {
    command -v $1 > /dev/null 2>&1
}
