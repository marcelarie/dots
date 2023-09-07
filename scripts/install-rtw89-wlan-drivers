#!/bin/bash

PROGRAMS="$HOME/programs"

[ ! -d $PROGRAMS ] && mkdir $PROGRAMS
[ ! -d "$PROGRAMS/rtw89" ] && git clone git://github.com/lwfinger/rtw89.git ~/programs/rtw89
cd ~/programs/rtw89
make
sudo make install
