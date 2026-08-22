#!/bin/sh

echo "Add files and do local commit"
git add .
echo "checking status"
git status
git commit -am "Pushing a Dockerfile deep dive folder containing a simple python application and its Dockerfile instructions"

echo "Pushing to Github Repository"
git push -u origin master
