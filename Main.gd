extends Node2D


signal new_frame

var opening_scene = "spaceship"

func _ready():
	$TitleScreen.goto_titlescreen()

func choose_opening():
	$Choose.choices[0] = instantiate_plant("water")
	$Choose.choices[1] = instantiate_plant("fire")
	$Choose.choices[2] = instantiate_plant("grass")
	$Choose.goto_choose()

func _process(delta):
	emit_signal('new_frame')

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		var node_data = i.call("save");
		save_game.store_line(to_json(node_data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		opening_scene = "choose"
		return
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()
	save_game.open("user://savegame.save", File.READ)
	while not save_game.eof_reached():
		var current_line = parse_json(save_game.get_line())
		if typeof(current_line) != typeof({}):
			break
		var new_object = load(current_line["filename"]).instance()
		get_node(current_line["parent"]).add_child(new_object)
		for i in current_line.keys():
			if i == "filename" or i == "parent":
				continue
			new_object.set(i, current_line[i])
	save_game.close()

func to_spaceship():
	save_game()
	$Spaceship.goto_spaceship()

func to_tutorial():
	$Tutorial.goto_intro()

func to_map():
	save_game()
	$Map.goto_map()

func to_encyclopedia():
	$Encyclopedia.goto_encyclopedia()

func to_choose(plant_list):
	var new_list = [null, null, null]
	for plant in range(3):
		new_list[plant] = instantiate_plant(plant_list[plant])
	#equivalent to the much more readable-> [instantiate_plant(plant) for plant in plant_list]
	$Choose.choices = new_list
	$Choose.goto_choose()

func instantiate_plant(species):
	return $PlantFactory.instantiate_plant(species)

func _CHOOSE_choose_plant():
	$Spaceship.seedling = $Choose.user_chose
	to_spaceship()

func _on_Spaceship_open_map():
	to_map()

func _on_Map_open_spaceship():
	to_spaceship()

func _on_Spaceship_open_encyclopedia():
	to_encyclopedia()

func _on_Encyclopedia_open_spaceship():
	to_spaceship()

func _on_TitleScreen_open_spaceship():
	to_spaceship()
	to_tutorial()
