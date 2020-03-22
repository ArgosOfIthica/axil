extends Control

var planets = [null, null, null]

func goto_map():
	prepare_map_rendering()
	show()

func _ready():
	var explorescene = load('res://Explore.tscn')

func prepare_map_rendering():
	pass
