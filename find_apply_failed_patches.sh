#!/bin/bash

code_path=$1
product=$2
if [ -z $code_path ] || [ -z $product ]; then
  echo "Usage: $0 code_path product"
  echo "For example: $0 /work/zhaofy/androidtv/gtv/ uproduct2"
  exit 1
else
  echo "[script]Code path: $code_path, finding apply failed patches for $product"
fi

error_log=`pwd`/patch_failed.log
cd $code_path
export mproduct_BUILD_TOP=`pwd`
. build/envsetup.sh >/dev/null 2>&1 
lunch $product-eng >/dev/null 2>&1 

while true; do
  ./vendor/mproduct/$product/overlays/apply_mproduct_patches.sh > $error_log 2>&1
  if [ $? = 0 ]; then
    break
  else
    failed_patch=`tail -10 $error_log | grep "Error: Fail to apply " | cut -d "\"" -f2`
    echo "Apply $failed_patch failed"
    sed -i -e "/$failed_patch/d" ./vendor/mproduct/$product/overlays/patches.config
  fi
done

echo "Done"





