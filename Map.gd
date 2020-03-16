extends Control

signal open_spaceship

func goto_map():
	prepare_map_rendering()
	show()
	$BG.get_child(0).show()
	
func _ready():
	$BG.get_child(0).hide()
	hide()
	
func prepare_map_rendering():
	pass

func _on_return_arrow_pressed():
	hide()
	$BG.get_child(0).hide()
	emit_signal('open_spaceship')
