#!/bin/sh

/usr/bin/ffmpeg -hide_banner -i rtmp://localhost/streamer/live -c copy -flags +global_header \
\
-f segment -segment_time 360 -segment_format_options movflags=+faststart -reset_timestamps 1 CAM1_%d.mp4 

