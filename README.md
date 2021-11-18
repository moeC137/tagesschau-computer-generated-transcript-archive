# tagesschau-computer-generated-transcript-archive

Download source audio:
youtube-dl -i -f 249 --yes-playlist PL4A2F331EE86DCC22&index=1

generate subtitles:
for FILE in ./target_folder/*; do python3 test_srt.py $FILE >$FILE.srt; done

sort all subtitles in folder for word frequenzy
sed 's/\.//g;s/\(.*\)/\L\1/;s/\ /\n/g' *.srt | sort  | uniq -c | sort -n > wordfreq_all.txt

remove timestamps from list:
sed -i '/pattern to match/d' ./wordfreq_all.txt

reformat timestamps in files in folder so it sorts better:
#! /bin/bash
for f in *.srt ; do
    new=${f:6:4}${f:5:1}${f:3:3}${f:0:3}${f:10}
    if [[ -f $new ]] ; then
        echo "Can't rename $f: $new already exists!" >&2
    else
        mv "$f" "$new"
    fi
done

