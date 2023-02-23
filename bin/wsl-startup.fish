#!/bin/fish

if set -q WSL_DISTRO_NAME
    start-ssh-agent
    ssh-add $HOME/.ssh/id_rsa
end
