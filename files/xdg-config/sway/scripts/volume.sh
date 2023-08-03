#! /bin/sh

echo THIS IS INCOMPLETE PLEASE DONT USE && exit 1

[ $1 = "toggle-mute" ] && wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle || wpctl set-volume @DEFAULT_AUDIO_SINK@ $1
[ $(wpctl get-volume @DEFAULT_AUDIO_SINK) | grep MUTED ] && Symbol="" || { 
	Symbol=""
	# PROBLEM : remove extra text output from wpctl get-volume
	Progressbar="--hint=int:value:$( expr $(wpctl get-volume @DEFAULT_AUDIO_SINK@) \* 100 )"
notify-send --hint=string:x-canonical-private-synchronous:volume $Progressbar $Symbol

notify-send --hint=string:x-canonical-private-synchronous:volume --hint=int:value:$( expr $(wpctl get-volume @DEFAULT_AUDIO_SINK@) \* 100 ) 
