function touchrx --wraps=touchr --description 'Make directories, touch, and make executable'
touchr $argv
chmod +x $argv
end
