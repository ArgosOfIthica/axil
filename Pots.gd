extends Node2D
var place = null
var plant = null
var spaceship = null
# Called when the node enters the scene tree for the first time.
func _ready():
	self.spaceship = get_parent()

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
		if plant.ready_to_grow():
			plant.next_stage()
	else:
		$Thirst.hide()
		$Nutrients.hide()
		$Button.set_normal_texture(load("res://assets/pots/pot_dirt_empty.png")) 

func _on_Button_pressed():
	spaceship.handle_pot_selection(place)
