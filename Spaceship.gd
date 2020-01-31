extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var plant_1 = null
var plant_2 = null
var plant_3 = null
var inventory = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func goto_spaceship():
	print('his')
	print(inventory)
	$Seed.set_button_icon(load(inventory.seedling_image_path))
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
