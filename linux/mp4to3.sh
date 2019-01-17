#!/bin/bash
mp4source=("$@")
mp3target=$(echo "$HOME/Downloads")
declare -a mp4fnl
for (( i=0 ; i<"${#mp4source[@]}" ; i=i+1 ))
do
	mp4fnl[i]=$(basename "${mp4source[i]}")
done
mp3fnl=("${mp4fnl[@]/.mp4/.mp3}")
echo "[info] mp4 source : ${#mp4fnl[@]}"
printf '\t%s\n' "${mp4fnl[@]}"
echo "[info] mp3 target : ${#mp3fnl[@]}"
printf '\t%s\n' "${mp3fnl[@]}"
for (( i=0 ; i<"${#mp4source[@]}" ; i=i+1 ))
do
	ffmpeg -i "${mp4source[i]}" -b:a 256k "${mp3target}"\/"${mp3fnl[i]}"
done
exit 0
