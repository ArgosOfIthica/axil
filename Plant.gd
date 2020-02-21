extends Node2D

class Plant:
	
	#public
	
	var species = "demo"
	var stage = "seed"
	var seedling_image_path = null
	var stage_2_image_path = null
	var epoch = null
	var water_threshold = null
	var last_watered = 0
	var needs_water = false
	var nutrients_threshold = null
	var last_nutrient = 0
	var needs_nutrients = false
	var assets = "res://assets/plants/"
	
	func _init(species, stage):
		self.species = species 
		self.stage = stage
		self.water_threshold = get_water_threshold(self.species)
		self.nutrients_threshold = get_nutrients_threshold(self.species)
		species_to_path()
		
	func plant():
		set_epoch()
	
	func poll_for_needs():
		need_water()
		need_nutrients()
		
	func water_the_plant():
		self.last_watered = OS.get_unix_time()
		self.needs_water = false
		
	func nutrient_the_plant():
		self.last_nutrient = OS.get_unix_time()
		self.needs_nutrients = false

	#private
	
	func need_water():
		if (OS.get_unix_time() - self.last_watered) > self.water_threshold:
			self.needs_water = true
	
	func need_nutrients():
		if (OS.get_unix_time() - self.last_nutrient) > self.nutrients_threshold:
			self.needs_nutrients = true
	
	func set_epoch():
		self.epoch = OS.get_unix_time()
		
	func species_to_path():
		self.seedling_image_path = self.assets + self.species + "/1.png"
		self.stage_2_image_path = self.assets + self.species + "/2.png"
		
		
	const minute = 60
	const hour = 3600
	
	const WaterThreshold = {
		"fire" : 11 * hour ,
		"water" : 8  ,#test value only
		"grass" : 6 * hour
		
		}
	
	func get_water_threshold(alias):
		return WaterThreshold[alias]
		
	const NutrientsThreshold = {
		"fire" : 15 * hour ,
		"water" : 10 ,#test value only
		"grass" : 11 * hour
		
	}
		
	func get_nutrients_threshold(alias):
		return NutrientsThreshold[alias]
