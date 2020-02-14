extends Node2D

class Plant:
	
	#External API
	
	var species = "demo"
	var stage = "seed"
	var seedling_image_path = null
	var stage_2_image_path = null
	var epoch = null
	var assets = "res://assets/plants/"
	
	func _init(species, stage):
		self.species = species 
		self.stage = stage
		
		species_to_path()
		
	func plant():
		set_epoch()
	
	#Internal API
	
	
	func set_epoch():
		self.epoch = OS.get_unix_time()
		
	func species_to_path():
		self.seedling_image_path = self.assets + self.species + "/1.png"
		self.stage_2_image_path = self.assets + self.species + "/2.png"
