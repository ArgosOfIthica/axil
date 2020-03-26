extends Node2D

var locked_image = null
var unlocked_image = null
var place = null
var plant_rarities = null

var locked = true

const starter_planet = {
	"fire": 1,
	"water": 1,
	"grass": 1,
	"spoon": 1,
	"redspider": 1,
	"digiveg": 0.5,
	"kniveleaves": 0.5,
	"livingblub": 1,
	"potatocoon": 1
	}

func _ready():
	pass

func render():
	if locked:
		$Button.set_normal_texture(load(locked_image))
	elif not locked:
		$Button.set_normal_texture(load(unlocked_image))

func give_plant_choices():
	var choices = [null, null, null]
	if place == 0:
		for picks in range(3):
			choices[picks] = give_plant_from_dict(starter_planet)
	return choices

func give_plant_from_dict(planetdict):
	var total_weight = 0
	for plant in planetdict:
		total_weight = total_weight + planetdict[plant]
	var rng = rand_range(0, total_weight)
	var running_total = 0
	for plant in planetdict:
		running_total = running_total + planetdict[plant]
		if rng < running_total:
			return plant

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed():
	var choices = give_plant_choices()
	get_parent().goto_choose_screen(choices)
	get_parent().goto_rewards_screen()
