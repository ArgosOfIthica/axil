extends Label

const hour = 3600
const minute = 60
var hours = 0
var minutes = 0
var seconds = 0

func SetCountdown(timer):
	hours = floor(timer/hour)
	minutes = floor(fmod(timer, hour)/minute)
	seconds = floor(fmod(fmod(timer, hour), minute))
	
func _process(delta):
	
	if seconds < 0:
		minutes -= 1
		seconds = 59
		
	if minutes < 0:
		hours -= 1
		minutes = 59
		
	elif hours < 1 and minutes < 1 and seconds < 1:
		hide()
	
	set_text(str(hours) + ":" + str(minutes) + ":" + str(seconds))


func _on_Countdown_timeout():
	seconds -= 1
