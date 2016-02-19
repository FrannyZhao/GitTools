#!/bin/bash
# Usage:
#   cd $your_git_folder
#   ./${path}/find_removed_line.sh "$removed_string"

current_dir=`pwd`
removed_string=$1
rm -rf failed_revision
git rev-list --all | ( 
    while read revision; do
        git grep -F "$removed_string" $revision >/dev/null 2>&1
        if [ $? != 0 ]; then
          failed_revision=$revision
          echo "$revision" > failed_revision
        else
          break
        fi
    done 
) 

commit=`cat failed_revision`
echo "The line $removed_string is removed in commit: $commit"
git show $commit --stat
rm -rf failed_revision
