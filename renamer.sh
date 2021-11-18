#! /bin/bash
for f in *.srt ; do
    new=${f:6:4}${f:5:1}${f:3:3}${f:0:3}${f:10}
    if [[ -f $new ]] ; then
        echo "Can't rename $f: $new already exists!" >&2
    else
        mv "$f" "$new"
    fi
done
