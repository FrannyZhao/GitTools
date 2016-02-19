#!/bin/bash

code_path=$1
if [ -z $code_path ]; then
  echo "Usage: $0 code_path"
  echo "For example: $0 /work/zhaofy/androidl_bg2q4k/androidl/vendor/mproduct/uproduct1/overlays"
  exit 1
else
  echo "[script]Code path: $code_path"
fi

cd $code_path
for patch in `ls *.patch`; do
  grep $patch patches.config
  if [ $? != 0 ]; then
    echo "rm -rf $patch"
    rm -rf $patch
  fi
done

echo "Done"

