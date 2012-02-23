#!/bin/sh

git stash
git pull --rebase
git stash pop || echo "failed git stash pop. you must run git stash drop, after merged."
