extends Node2D

var current_scene = null


#External API

func _on_Choose_kill_choose_plant_1():
	add_plant_to_inventory($Choose.choice_1, 'seedling')


func _on_Choose_kill_choose_plant_2():
	add_plant_to_inventory($Choose.choice_2, 'seedling')


func _on_Choose_kill_choose_plant_3():
	add_plant_to_inventory($Choose.choice_3, 'seedling')



#Interal API

func _ready():
	current_scene = "choose"

func to_spaceship():
	current_scene = "spaceship"
	$Spaceship.goto_spaceship()


func add_plant_to_inventory(species, stage):
	$Spaceship.seedling = instantiate_plant(species, stage)
	to_spaceship()
	
func instantiate_plant(species, stage):
	var plantscene = load('res://Plant.tscn')
	var plant = plantscene.instance()
	return plant.Plant.new(species, stage)


