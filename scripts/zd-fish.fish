#!/usr/bin/env bash

cd $argv

## HOOK DIRECTORIES
set STUART_DIR "/Users/m.manzanares/clones/work/stuart-frontend"

## HOOKS
if [ $PWD = $STUART_DIR ]
    set node_current (node -v)

    if [ $node_current != "v16.13.0" ]
        nvm use
    end

    # else if [ $PWD = $OTHER ]
end
