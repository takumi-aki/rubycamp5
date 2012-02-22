#!/bin/sh

git stash
git pull --rebase
git stash pop
