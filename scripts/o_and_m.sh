#!/bin/bash
# This script is used to fecth the last commit tagged: #release and compare to this commit
# It will then diff the commit and generate a report to find out if O & M docs have been updated
# If the O & M docs have been updated, it will generate a report and initiate approval flow

# Get the last commit tagged #release
files=$(ls $1/*)

git gc --force --quiet

instScript=()
instScript_files=()

sha_id=$(git rev-list -n 1 $(git describe --tags --match "release*" --abbrev=0 --tags $(git rev-list --tags --max-count=1)))

for i in ${files[@]}; do
    code=$(
        git diff --quiet $sha_id -- $i
        echo $?
    )
    if [ $code -ne 0 ]; then
        instScript='true'
        instScript_files+=($i)
    fi
done

if [ $instScript ]; then
    echo "O & M docs have been updated"
    echo "Files updated: ${instScript_files[@]}"
    echo "true"
else
    echo "false"
fi
