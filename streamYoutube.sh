#!/bin/sh

while true ; do

/usr/bin/ffmpeg -f video4linux2 -i /dev/video0 \
\
-filter_complex "amovie='/home/pi/keygen.mp3':loop=999,asetpts=N/SR/TB,\
aformat=sample_fmts=fltp:sample_rates=44100:channel_layouts=stereo,volume=0.8" \
\
-vf drawtext="fontfile=OpenSans.ttf:textfile='/home/pi/tmp/text.txt':reload=1:fontsize=28:\
fontcolor=white:borderw=3:bordercolor=black:x=10:y=10" \
\
-c:v libx264 -shortest -preset ultrafast -crf 24 -g 3 \
\
-f flv rtmp://a.rtmp.youtube.com/live2/j992-qug5-cyaj-csm2-7b08

done
}
