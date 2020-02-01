extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_scene = null





# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func to_spaceship():
	$Spaceship.goto_spaceship()


func add_plant_to_inventory(species, stage):
	var plantscene = load('res://Plant.tscn')
	var plant = plantscene.instance()
	var plant_class = plant.Plant.new(species, stage)
	$Spaceship.seedling = plant_class
	to_spaceship()
	

func _on_Choose_kill_choose_plant_1():
	add_plant_to_inventory($Choose.choice_1, 'seedling')


func _on_Choose_kill_choose_plant_2():
	add_plant_to_inventory($Choose.choice_2, 'seedling')


func _on_Choose_kill_choose_plant_3():
	add_plant_to_inventory($Choose.choice_3, 'seedling')
