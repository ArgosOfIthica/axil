extends Control

signal open_spaceship

func goto_map():
	prepare_map_rendering()
	show()
	
func _ready():
	hide()
	
func prepare_map_rendering():
	pass

func _on_return_arrow_pressed():
	emit_signal('open_spaceship')
	$ParallaxBackground/Space_BG.hide()
	hide()
