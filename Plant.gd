extends Node2D


var species = "water"
var stage = 0
var seedling_image_path = null
var stage_1_image_path = "res://assets/pots/pot_dirt_filled.png"
var stage_2_image_path = null
var stage_3_image_path = null
var epoch = null
var water_threshold = null
var last_watered = 0
var nutrients_threshold = null
var last_nutrient = 0
var growth_intervals = null
		
func current_render():
	if stage == 0:
		return self.seedling_image_path
	elif stage == 1:
		return self.stage_1_image_path
	elif stage == 2:
		return self.stage_2_image_path
	elif stage == 3:
		return self.stage_3_image_path

func water_the_plant():
	last_watered = OS.get_unix_time()
	
func nutrient_the_plant():
	last_nutrient = OS.get_unix_time()

func need_water():
	return (OS.get_unix_time() - self.last_watered) > self.water_threshold

func need_nutrient():
	return (OS.get_unix_time() - self.last_nutrient) > self.nutrients_threshold

func ready_to_grow():
	if not need_water() and not need_nutrient():
		return OS.get_unix_time() % growth_intervals[stage] == 0
	else:
		return false

func next_stage():
	if stage < 3:
		stage = stage + 1

