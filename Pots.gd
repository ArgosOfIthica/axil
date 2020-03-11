extends Node2D
signal pot0_clicked
signal pot1_clicked
signal pot2_clicked
var places = null
var plant = null
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pot0_clicked", get_parent(), "_on_Pot_1_pressed")

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

func _on_Button_pressed():
	if places == 0:
		emit_signal("pot0_clicked")
	elif places == 1:
		emit_signal("pot1_clicked")
	elif places == 2:
		emit_signal("pot2_clicked")
