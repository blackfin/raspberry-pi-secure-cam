#!/usr/bin/env bash

/usr/bin/ffmpeg -hide_banner -i rtmp://localhost/streamer/live -c copy -flags +global_header \
\
-f segment -strftime 1 -segment_time 60 -segment_format_options movflags=+faststart -reset_timestamps 1 CAM1_%Y-%m-%d_%H-%M-%S.mp4 

