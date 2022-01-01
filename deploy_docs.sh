#!/usr/bin/env sh

# abort on errors
set -e

rm -rf build

# build
node_modules/.bin/vuepress build docs --dest build

# navigate into the build output directory
cd build

touch .nojekyll

git init
git add -A
git config user.email "darwin@yelp.com"
git config user.name "Darwin S."
git commit -m 'deploy'

git push -f https://github.com/Yelp/graphql-guidelines.git main:docs

cd -
