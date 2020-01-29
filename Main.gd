extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_scene = null

var plant_1 = null
var plant_2 = null
var plant_3 = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func to_spaceship():
	$Spaceship.goto_spaceship()



func _on_Choose_kill_choose():
	to_spaceship()
