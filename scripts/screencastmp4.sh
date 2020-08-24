#!/bin/bash
slop=$(slop -f "%x %y %w %h %g %i") || exit 1
read -r X Y W H G ID < <(echo $slop)
ffmpeg -f x11grab -s "$W"x"$H" -i :0.0+$X,$Y -f pulse -ac 2 -i default -c:v libx264 -preset ultrafast -c:a aac -f segment -strftime 1 -segment_time 60 -segment_format mp4 ~/media/videos/screencasts/%F_%H-%M-%S.mp4

