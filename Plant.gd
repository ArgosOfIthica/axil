extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class Plant:
	
	def __init__(self, species, stage):
		self.species = species 
		self. stage = stage
	
	var species = "demo"
	var stage = "seed"
	var seedling_image_path = null
	var lifetime = 0
	func species_to_path(self):
		if self.species == "water" :
			self.seedling_image_path = "plant_water_1.png"
		else if self.species == "grass":
			self.seedling_image_path = "plant_grass_1.png"
		else:
			self.seedling_image_path = "plant_fire_1.png"

func _ready():
	pass