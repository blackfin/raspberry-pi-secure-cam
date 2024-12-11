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
-c:v h264_v4l2m2m -profile:v 100 -r 24 \
-bf 1 -b_strategy 0 -sc_threshold 0 -pix_fmt yuv420p \
-c:a aac -b:a 128k -ac 2 -b:v 16000k \
\
-f flv -hls_time 4 -hls_playlist_type event rtmp://localhost/streamer/live

#done

