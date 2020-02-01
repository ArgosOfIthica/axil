extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var plant_1 = null
var plant_2 = null
var plant_3 = null
var seedling = null
var water = null
var soil = null
var activated = null

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	
func goto_spaceship():
	show()
	$Seed.set_button_icon(load(seedling.seedling_image_path))
	#var plantscene = load('res://Plant.tscn')
	"""var plant = plantscene.instance()
	plant.position.x = 500
	plant.position.y = 500
	add_child(plant)"""
#	var plant = plantscene.Plant(species, stage)
	


#func render_plants():
	#Main.plant_1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Seed_pressed():
	activated = "seed"


func _on_Pot_1_pressed():
	if activated == "seed":
		plant_1 = seedling
		seedling = null
		activated = null


func _on_Pot_2_pressed():
	if activated == "seed":
		plant_2 = seedling
		seedling = null
		activated = null


func _on_Pot_3_pressed():
	if activated == "seed":
		plant_3 = seedling
		seedling = null
		activated = null
