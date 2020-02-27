extends Node2D

var plant = null
# Called when the node enters the scene tree for the first time.
func _ready():
	print("amihere?")

func report_plant():
	if plant != null:
		$Button.set_normal_texture(load(plant.current_render())) 
		if plant.need_water():
			$Thirst.show()
		else:
			$Thirst.hide()
		if plant.need_nutrient():
			$Nutrients.show()
		else:
			$Nutrients.hide()
	else:
		$Thirst.hide()
		$Nutrients.hide()
		$Button.set_normal_texture(load("res://assets/pots/pot_dirt_empty.png")) 
