extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	pass


class Plant:
	
	var species = "demo"
	var stage = "seed"
	var seedling_image_path = null
	var lifetime = 0
	
	
	func _init(species, stage):
		self.species = species 
		self.stage = stage
		species_to_path()
	
	func species_to_path():
		if self.species == "water" :
			self.seedling_image_path = "res://assets/plant_water_1.png"
		elif self.species == "grass":
			self.seedling_image_path = "res://assets/plant_grass_1.png"
		elif self.species == "fire":
			self.seedling_image_path = "res://assets/plant_fire_1.png"
