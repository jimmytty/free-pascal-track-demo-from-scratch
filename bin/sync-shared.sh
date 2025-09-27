#/bin/bash

while read dest; do
    echo "Syncing $dest..."
    rsync --archive --out-format='%i %n' ../shared/ "$dest" |
        awk '!(NR==1&&$0=".d..t...... ./")'
done < <(find ../ -maxdepth 3 -type d -path '../exercises/practice/*')
