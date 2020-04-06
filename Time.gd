extends Node2D


var end = 0

func time_left():
	var time_left = end - OS.get_unix_time()
	if time_left > 0:
		return time_left
	else:
		return 0
