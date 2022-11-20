#!/bin/sh

filePath=env.json
# echo "before:"
# cat $filePath

cat "$filePath" | jq -c 'keys[]' | while IFS= read -r i;
do
    if [ ! -z ${i+z} ]; then
        echo "set"
        # jq -c ".${i} = env.${i}" $filePath > $filePath.tmp && mv $filePath.tmp $filePath
    fi
done

# echo "after:"
# cat $filePath
