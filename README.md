# tagesschau-computer-generated-transcript-archive

Download source audio:
youtube-dl -i -f 249 --yes-playlist PL4A2F331EE86DCC22&index=1

generate subtitles:
for FILE in ./target_folder/*; do python3 test_srt.py $FILE >$FILE.srt; done

sort all subtitles in folder for word frequenzy
sed 's/\.//g;s/\(.*\)/\L\1/;s/\ /\n/g' *.srt | sort  | uniq -c | sort -n > wordfreq_all.txt

remove timestamps from list:
sed -i '/pattern to match/d' ./wordfreq_all.txt
