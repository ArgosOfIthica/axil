extends Node2D

var locked_image = null
var unlocked_image = null
var place = null
var plant_rarities = null

var locked = true


func _ready():
	pass # Replace with function body.
	
func render():
	if locked:
		$Button.set_normal_texture(load(locked_image))
	elif not locked:
		$Button.set_normal_texture(load(unlocked_image))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
