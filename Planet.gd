extends Node2D

var locked_image = null
var unlocked_image = null
var place = null
var plant_rarities = null
var active = false

onready var timer = get_node("Timer")
const hours = 3600
const minutes = 60

var locked = true

const starter_planet = {
	"fire": .5,
	"water": .5,
	"grass": .5,
	"spoon": .75,
	"redspider": .75,
	"digiveg": 1,
	"kniveleaves": .75,
	"livingblub": .75,
	"potatocoon": .75,
	"stonemoss": .75,
	"purpletentacles": .75,
	"firefleur" : .75,
	"hand": 1,
	"alienboi": 1,
	"strangerock" : 1,
	"smileyboi" : 1,
	"strugglepot" : 1,
	"stitchy" : 1,
	"ice" : 1,
	"rainbowshine": 1
	}
	

func _ready():
	$Label.hide()
	

func _on_Timer_timeout():
	timer.stop()


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


func _on_Button_pressed():
	if !active:
		timer.wait_time = 10 #test value only
		timer.start()
		active = true
		$Label.show()
		$Label.SetCountdown(timer.wait_time)
	if active and timer.is_stopped():
		var choices = give_plant_choices()
		get_parent().goto_choose_screen(choices)
		active = false
		$Label.hide()



