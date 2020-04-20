extends Label

onready var countdown = get_node("Countdown")

var hours = 0
var minutes = 0
var seconds = 0

func _process(delta):
	pass


func SetCountdown(timer):
	countdown.wait_time = timer


func DisplayTimer():
	hours += countdown.wait_time / 3600
	
	if seconds < 0:
		minutes -= 1
		seconds = 59
	
	if minutes < 0:
		hours -= 1
		minutes = 59

	if hours < 1:
		hours = 0
		if minutes < 1:
			minutes = 0
			if seconds < 1:
				seconds = 0
	
	set_text(str(hours) + ":" + str(minutes) + ":" + str(seconds))


#func _on_Countdown_timeout():
#	countdown -= 1
