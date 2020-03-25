extends Node2D

var current_scene = null

signal new_frame

func _ready():
	current_scene = "choose"
	$Choose.choices[0] = instantiate_plant("water")
	$Choose.choices[1] = instantiate_plant("fire")
	$Choose.choices[2] = instantiate_plant("grass")

func _process(delta):
	emit_signal('new_frame')

func to_spaceship():
	$Spaceship.goto_spaceship()
	
func to_map():
	$Map.goto_map()
	
func to_rewards(plant_list):
	var new_list = [null, null, null]
	for plant in range(3):
		new_list[plant] = instantiate_plant(plant_list[plant])
	$Rewards.choices = new_list
	$Rewards.goto_rewards()

func instantiate_plant(species):
	return $PlantFactory.instantiate_plant(species)

func _CHOOSE_choose_plant():
	$Spaceship.seedling = $Choose.user_chose
	to_spaceship()

func _on_Rewards_choose_reward():
	$Spaceship.seedling = $Rewards.user_chose
	to_spaceship()

func _on_Spaceship_open_map():
	to_map()

func _on_Map_open_spaceship():
	to_spaceship()
