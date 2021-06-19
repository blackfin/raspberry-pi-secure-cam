#!/bin/sh

while true ; do

/usr/bin/ffmpeg -f video4linux2 -i /dev/video0 \
\
-filter_complex "amovie='/home/pi/keygen.mp3':loop=999,asetpts=N/SR/TB,\
aformat=sample_fmts=fltp:sample_rates=44100:channel_layouts=stereo,volume=0.8" \
\
-vf drawtext="fontfile=OpenSans.ttf:textfile='/home/pi/sensors.txt':reload=1:fontsize=28:\
fontcolor=white:borderw=3:bordercolor=black:x=10:y=10" \
\
-vcodec h264_omx -preset ultrafast \
-c:v h264_omx -x264opts "keyint=24:min-keyint=24:no-scenecut" -r 24 \
-bf 1 -b_strategy 0 -sc_threshold 0 -pix_fmt yuv420p \
-c:a aac -b:a 128k -b:v 16000k \
\
-f flv rtmp://192.168.10.200/streamer/moe_okno

done
}

