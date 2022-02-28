function touchr --wraps=touch --description 'Creates a directory before touching the file'
set -l DIR (dirname $argv[1])
mkdir -p $DIR
touch $argv[1]
end
