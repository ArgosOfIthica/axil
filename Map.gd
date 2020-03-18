extends Control

var planets = null

signal open_spaceship

func goto_map():
	prepare_map_rendering()
	show()
	$BG.get_child(0).show()
	
func _ready():
	$Planet1.locked_image = 'res://assets/planets/Planet_Starter_Gray.png'
	$Planet2.locked_image = 'res://assets/planets/Planet_Lava_gray.png'
	$Planet3.locked_image = 'res://assets/planets/Planet_03_gray.png'
	$Planet1.unlocked_image = 'res://assets/planets/Planet_Starter.png'
	$Planet2.unlocked_image = 'res://assets/planets/Planet_Lava.png'
	$Planet3.unlocked_image = 'res://assets/planets/Planet_03.png'
	$Planet1.locked = false
	$BG.get_child(0).hide()
	hide()
	planets = [$Planet1, $Planet2, $Planet3]
	
func prepare_map_rendering():
	for planet in planets:
		planet.render()

func _on_return_arrow_pressed():
	hide()
	$BG.get_child(0).hide()
	emit_signal('open_spaceship')
