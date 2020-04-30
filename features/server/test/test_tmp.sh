#!/usr/bin/env bash

rootfsDir=$1
targetBaseDir=$2

rc=0
echo "checking for an empty /tmp"
rootfsDir=$(readlink -f "$rootfsDir")
nr=$(shopt -s nullglob dotglob; f=(${rootfsDir}/tmp/*); echo ${#f[@]})

if [[ "$nr" -ne 0 ]]; then
	echo "/tmp is not empty!"
	echo "expected: 0"
	echo "got:      ${nr}"
	rc=1
fi

exit $rc
