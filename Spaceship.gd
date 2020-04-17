extends Control


var pots = [null, null, null]
var seedling = null
var water = null
var nutrients = null
var selected = null

signal open_map
signal send_to_earth
signal open_encyclopedia

#External API

func goto_spaceship():
	prepare_ship_rendering()
	show()
	$BG.get_child(0).show()
	$BG_Music.play()

#Internal API

func _ready():
	hide()
	pots = [$Pot1, $Pot2, $Pot3]
	for pot in range(len(pots)):
		pots[pot].place = pot
	
	
func _on_Seed_pressed():
	selected = "seed"
	
func _on_Water_pressed():
	selected = "water"
	
func _on_Nutrients_pressed():
	selected = "nutrients"

func _on_SendToEarth_pressed():
	$SendToEarth.goto_sendtoearth()
	selected = "send"

func handle_pot_selection(chosen_pot):
	if selected == "seed" and seedling != null:
		select_seed(chosen_pot)
	elif selected == "water":
		water_plant(chosen_pot)
	elif selected == "nutrients":
		add_nutrients(chosen_pot)
	elif selected == "send":
		$SendToEarth.selection(chosen_pot)
		selected = null

func select_seed(chosen_pot):
		pots[chosen_pot].plant = seedling
		seedling = null
		selected = null
		prepare_ship_rendering()
		
func water_plant(chosen_pot):
	pots[chosen_pot].plant.water_the_plant()
	selected = null
	prepare_ship_rendering()

func add_nutrients(chosen_pot):
	pots[chosen_pot].plant.nutrient_the_plant()
	selected = null
	prepare_ship_rendering()

func prepare_ship_rendering():
	if seedling != null:
		$Seed.set_button_icon(load(seedling.seedling_image_path))
	else:
		$Seed.set_button_icon(load("res://icon.png"))
	pots[0].report_plant()
	pots[1].report_plant()
	pots[2].report_plant()

func _on_Main_new_frame():
	prepare_ship_rendering()

func _on_Map_pressed():
	emit_signal('open_map')
	$BG/Spaceship_BG.hide()
	$BG_Music.stop()
	hide()

func _on_Journal_pressed():
	emit_signal('open_encyclopedia')
	$BG/Spaceship_BG.hide()
	$BG_Music.stop()
	hide()
