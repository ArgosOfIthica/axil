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

func instantiate_plant(species):
	return $PlantFactory.instantiate_plant(species)


func _CHOOSE_choose_plant():
	$Spaceship.seedling = $Choose.user_chose
	to_spaceship()
