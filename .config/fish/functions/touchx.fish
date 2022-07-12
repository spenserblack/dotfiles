function touchx --wraps=touch --description 'Touch and make executable'
touch $argv[1]
chmod +x $argv[1]
end
