#!/bin/bash

rm -rf copy_fail.log copy.log
src_path=$1
dst_path=$2

if [ -z $src_path ] || [ -z $dst_path ]; then
  echo "Usage: $0 src_path dst_path"
  echo "For example: $0 /work/zhaofy/release/debugithub/technicolor/3067_z1_alpha/gtv /work/zhaofy/release/debugithub/technicolorfhd/gtv/vendor"
  exit 1
else
  echo "[script]Coping .gitignore from $src_path to $dst_path"
fi

find_path="vendor/mproduct-sdk/ampsdk/amp vendor/mproduct-sdk/linux vendor/mproduct-sdk/MV88DE3100_SDK vendor/mproduct-sdk/tee vendor/mproduct"
cd $src_path
for gitignore_file in `find $find_path -name .gitignore`; do
    echo $gitignore_file
    folder=`echo $gitignore_file | awk -F '/' '{for (i=2;i<NF;i++){printf("%s/", $(i))}}'`
    mkdir -p $dst_path/$folder
    cp -rvf $gitignore_file $dst_path/$folder
    if [ $? != 0 ]; then
      echo $gitignore_file >> copy_fail.log
    else
      echo $gitignore_file >> copy.log
    fi
#  fi
done





