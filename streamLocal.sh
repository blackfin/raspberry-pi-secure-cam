#!/bin/sh

#while true ; do

/usr/bin/ffmpeg -hide_banner -f video4linux2 -video_size 640x480 -framerate 30 -i /dev/video0 \
\
-filter_complex "amovie='./sound.mp3':loop=999,asetpts=N/SR/TB,\
aformat=sample_fmts=fltp:sample_rates=44100:channel_layouts=stereo,volume=0.1" \
\
-vf drawtext="fontfile=OpenSans.ttf:textfile='./sensors.txt':reload=1:fontsize=18:\
fontcolor=white:borderw=3:bordercolor=black:x=10:y=10" \
\
-vcodec h264_v4l2m2m -profile:v 100  -preset ultrafast \
-c:v h264_v4l2m2m -x264opts "keyint=24:min-keyint=24:no-scenecut" -r 24 \
-bf 1 -b_strategy 0 -sc_threshold 0 -pix_fmt yuv420p \
-c:a aac -b:a 128k -b:v 16000k \
\
<<<<<<< HEAD
-f flv rtmp://192.168.0.143/streamer/moe_okno
=======
-f flv rtmp://192.168.1.124/streamer/live
>>>>>>> 8088229422be927f6554a93654817ab288152bb1

#done

