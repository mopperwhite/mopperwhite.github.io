#!/bin/sh
git pull https://github.com/mopperwhite/mopperwhite.github.io.git
mv _config.yml local_config.yml
mv online_config.yml _config.yml
date > commit.txt
git add -A
git commit -F ./commit.txt
git push https://github.com/mopperwhite/mopperwhite.github.io.git
mv _config.yml online_config.yml
mv local_config.yml _config.yml
