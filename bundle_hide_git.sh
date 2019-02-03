#!/bin/bash
#Renames the .git folders so that they are managed differently - 
# for plugin in `ls bundle`
cd ~/.vim
for plugin in `ls ~/.vim/bundle`
do
    git rm --cached bundle/$plugin
    mv bundle/$plugin/.git bundle/$plugin/.gitbackup
    git add bundle/$plugin
done;
git rm .gitmodules
git commit -am "Added the plugin files"

