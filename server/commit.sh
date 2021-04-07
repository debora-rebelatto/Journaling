#!/bin/bash

todaydate=$(date +'%d/%m/%Y')
echo "${backup_dir}"

git add .
git commit -m "${todaydate}"
git push