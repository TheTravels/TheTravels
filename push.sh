#!/bin/bash

if (("$#" < 1)) ; then
echo "Please input commit info"
exit
else
echo "commit is " $1
make clean
git add .
git commit -m "$1"
git push origin master
#git tag $1
#git push origin $1
fi

