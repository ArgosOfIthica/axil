extends Control


var pot1= null
var pot2 = null
var pot3 = null
var seedling = null
var water = null
var soil = null
var selected = null



#External API


func goto_spaceship():
	prepare_ship_rendering()
	show()
	
func add_seedling(plant_object):
	seedling = plant_object


#Internal API

func _ready():
	hide()
	
	
func _on_Seed_pressed():
	selected = "seed"
	
func _on_Water_pressed():
	selected = "water"

func _on_Pot_1_pressed():
	select_seed(1)
	water_plant(1)

func _on_Pot_2_pressed():
	select_seed(2)
	water_plant(2)

func _on_Pot_3_pressed():
	select_seed(3)
	water_plant(3)

func select_seed(pot):
	if selected == "seed":
		seedling.plant()
		if pot == 1:
			pot1 = seedling
		elif pot == 2:
			pot2 = seedling
		elif pot == 3:
			pot3 = seedling
		
		seedling = null
		selected = null
		prepare_ship_rendering()
		
func water_plant(pot):
	if selected == "water":
		if pot == 1:
			pot1.water_the_plant()
		if pot == 2:
			pot2.water_the_plant()
		if pot == 3:
			pot3.water_the_plant()
		selected = null

func prepare_ship_rendering():
	$ThirstyPot1.hide()
	$ThirstyPot2.hide()
	$ThirstyPot3.hide()
	if seedling != null:
		$Seed.set_button_icon(load(seedling.seedling_image_path))
	else:
		$Seed.set_button_icon(load("res://icon.png"))
	if pot1 != null:
		$Pot_1.set_normal_texture(load(pot1.stage_2_image_path))
		pot1.poll_for_needs()
		if pot1.needs_water:
			$ThirstyPot1.show()
	if pot2 != null:
		$Pot_2.set_normal_texture(load(pot2.stage_2_image_path))
		pot2.poll_for_needs()
		if pot2.needs_water:
			$ThirstyPot2.show()
	if pot3 != null:
		$Pot_3.set_normal_texture(load(pot3.stage_2_image_path))
		pot3.poll_for_needs()
		if pot3.needs_water:
			$ThirstyPot3.show()

func _on_Main_new_frame():
	prepare_ship_rendering()
