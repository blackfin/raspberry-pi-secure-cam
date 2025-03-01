#!/bin/sh

#while true ; do

/usr/bin/ffmpeg -hide_banner -f video4linux2 -s 640x480 -r 30 -i /dev/video0 \
\
-filter_complex "amovie='./sound.mp3':loop=999,asetpts=N/SR/TB,\
aformat=sample_fmts=fltp:sample_rates=44100:channel_layouts=stereo,volume=0.1" \
\
-vf drawtext="fontfile=OpenSans.ttf:textfile='./sensors.txt':reload=1:fontsize=18:\
fontcolor=white:borderw=3:bordercolor=black:x=10:y=10" \
\
-c:v h264_v4l2m2m -b:v 1M -profile:v 100 \
-pix_fmt yuv420p \
-c:a aac -b:a 128k -b:v 16000k \
\
-f flv rtmp://192.168.0.143/streamer/moe_okno

#done


