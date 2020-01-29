extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func goto_spaceship():
	var plantscene = load('res://Plant.tscn')
	var plant = plantscene.instance()
	plant.position.x = 500
	plant.position.y = 500
	add_child(plant)


#func render_plants():
	#Main.plant_1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
