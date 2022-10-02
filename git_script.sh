#!/usr/bin/env bash

## clone the repo
git clone https://github.com/omicscodeathon/gitworkshop.git
# or
# git clone git@github.com:omicscodeathon/gitworkshop.git

## you should see a directory called gitworkshop
ls
cd ./gitworkshop

## look around
ls -a
git status

## look at the history
git log

## we need to configure our git account with this repo
## use github account user name and email address
git config -l
git config user.name <name>
git config user.email <emailaddress>


## let's make a file - substitute your username for <name>
echo "hello" ><name>.txt
cat <name>.txt
git status
git diff

## add the file
git add <name>.txt
git status
git diff
git diff --cached

## now we are going to save/commit our changes
git commit <name>.txt -m "adding my file"
git log

## note that the changes are not yet pushed
git log -p
## q to exit
git log --stat --summary

## make additional change to file
echo "goodbye" >><name>.txt
git diff

## we can either add the file OR use git commit -a
git commit -a
## editor should open, if one does not for you, then
## give the commit message on the command line
git commit -a -m "my commit message"


## now we want to save this commit in the cloud
## ALWAYS pull before you push
git pull
git config --global pull.rebase false
git push

## look at a specific commit
git show 06600b0250aa10f57469cbc4e5698db25129510c

## make a change
echo "mistake" ><name>.txt
cat <name>.txt
git status
git diff
git commit <name>.txt -m "bad commit"

## revert commit to "HEAD" (current state of remote) - note we did not push!  once you push it is a lot harder to revert commits esp in shared repo.
git reset HEAD
# or
git reset --hard HEAD

## Branch flow
## pull any changes
git pull

## create a branch
git checkout -b <name>
git status
git branch -a
mkdir <name>
echo "my own folder!" ><name>/file.txt
git commit -a -m "made my own folder"
echo "jump!" ><name>/file.txt
git commit -a -m "made a fix to file"

## pull first!
git pull
git push

## will merge my branch
git checkout main
git merge <name>
gitk
git pull
git push

## optional delete your branch
git branch -d <name>

### Fork on Github and clone locally
# we change to a separate directory just to make sure we don't
# get confused between the shared omicscodeathon repo and our fork
cd
mkdir myfork
cd myfork
git clone https://github.com/<name>/gitworkshop.git
# or
# git clone git@github.com:<name>/gitworkshop.git
ls
cd gitworkshop/
git config -l --list
git config user.name <name>
git config user.email <emailaddress>


### Make a change to someone else's file
echo "my changes" >>README.md
git commit README.md -m "my suggested changes"
git status
git pull
git push


