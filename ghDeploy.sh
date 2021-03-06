#!/bin/bash

# if anything in the site/ subdirectory changed in the prior commit,
# push that directory to gh-pages for auto generation.
git diff-tree -r --name-only --no-commit-id master | grep '^site/' &> /dev/null
if [ $? == 0 ]; then
  git push origin `git subtree split --prefix dist master 2> /dev/null`:gh-pages --force
fi