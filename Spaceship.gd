extends Control


var pots = [null, null, null]
var seedling = null
var water = null
var nutrients = null
var selected = null

#External API


func goto_spaceship():
	prepare_ship_rendering()
	show()

#Internal API

func _ready():
	var potscene = load('res://Pots.tscn')
	pots[0] = potscene.instance()
	pots[0].position = $Pot1.position
	pots[0].places = 0
	pots[1] = potscene.instance()
	pots[1].position = $Pot2.position
	pots[1].places = 1
	pots[2] = potscene.instance()
	pots[2].position = $Pot3.position
	pots[2].places = 2
	add_child(pots[0])
	add_child(pots[1])
	add_child(pots[2])
	hide()
	
	
func _on_Seed_pressed():
	selected = "seed"
	
func _on_Water_pressed():
	selected = "water"
	
func _on_Nutrients_pressed():
	selected = "nutrients"

func _on_Pot_1_pressed():
	print('reached2')
	handle_selection(0)

func _on_Pot_2_pressed():
	handle_selection(1)

func _on_Pot_3_pressed():
	handle_selection(2)

func handle_selection(chosen_pot):
	if seedling != null:
		select_seed(chosen_pot)
		water_plant(chosen_pot)
		add_nutrients(chosen_pot)

func select_seed(chosen_pot):
	if selected == "seed":
		pots[chosen_pot].plant = seedling
		seedling = null
		selected = null
		prepare_ship_rendering()
		
func water_plant(chosen_pot):
	if selected == "water":
		pots[chosen_pot].water_the_plant()
		selected = null
		
func add_nutrients(chosen_pot):
	if selected == "nutrients":
		pots[chosen_pot].nutrient_the_plant()
		selected = null

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


func _on_map_button_pressed():
	pass


func _on_SendToEarth_pressed():
	pass
