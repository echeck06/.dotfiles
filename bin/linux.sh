#!/bin/bash
#check operating systems (if linux)
if [ $(uname) != "Linux" ];
then
	echo "error - doesn't equal linux" >> linuxsetup.log
	exit
fi
#checks for .TRASH  directory and makes one if there isn't one already
cd
if [ ! -d ".TRASH" ];
then
	mkdir ./.TRASH
fi
#looks for .nanorc and if there changes it's name
if [ -f ./.nanorc ];
then
	cp .nanorc ./.bup_nanorc
	rm .nanorc
	echo ".nanorc file's name was changed to .bup_nanorc" >>./.dotfiles/bin/linuxsetup.log
fi
#overwrites nanorc content to .nanorc in home directory
cp ./.dotfiles/etc/nanorc .nanorc
#adds to the end of bashrc
echo "source ~/.dotfiles/etx/bashrc_custom" >> .bashrc

