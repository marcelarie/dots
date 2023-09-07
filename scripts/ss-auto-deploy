#!/bin/bash
function sdw {
    echo 'source ~/.zshrc && sc deploy workers' | zsh
}

time while [[ $(eval sdw) =~ running ]];
do
    ((c++)) && ((c==10)) && break
    sdw && sleep 20 && printf '\n';
done

sdw
echo "Deploying workers 🎉"
