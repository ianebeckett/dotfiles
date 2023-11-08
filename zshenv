
# exists foo && bar || baz # (exists foo) ? bar : baz;
function exists() {
    command -v $1 > /dev/null 2>&1
}
