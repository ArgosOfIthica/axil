extends Control

signal open_spaceship

func goto_titlescreen():
	show()
	$BG.get_child(0).show()
	$BG_Music.play()


func _ready():
	pass # Replace with function body.


func _on_start_button_pressed():
	hide()
	$BG.get_child(0).hide()
	$BG_Music.stop()
	emit_signal('open_spaceship')
