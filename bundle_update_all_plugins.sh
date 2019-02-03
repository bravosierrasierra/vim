#!/bin/bash
# updates your plugins - 
cd ~/.vim
for plugin in `ls bundle`
do
    cd bundle/$plugin
    pwd
    mv .gitbackup .git
    git reset --hard
    git pull origin master 
    mv .git .gitbackup 
    cd ~/.vim
done
#careful to commit your own stuff, first - or modify this as needed
git commit -am "Plugins updated" 

