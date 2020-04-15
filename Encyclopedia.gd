extends Control

signal open_spaceship

func hide_all():
	hide()
	$BG.get_child(0).hide() 

func goto_encyclopedia():
	show()
	$BG.get_child(0).show()

func _ready():
	hide_all() 

#water/nutrients --> plant.water/3600 + "hours"
const notes = {
	"fire" : ["very hot", "dummy hot", "gotdang that hot"]
	}

func _on_backbutton_pressed():
	hide_all()
	emit_signal('open_spaceship')
