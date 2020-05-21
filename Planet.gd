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

const planet1 = {
	"fire": 0,
	"water": 0,
	"grass": 1,
	"spoon": 1,
	"redspider": .5,
	"digiveg": .1,
	"kniveleaves": 0,
	"livingblub": .5,
	"potatocoon": 0,
	"stonemoss": 1,
	"purpletentacles": 0,
	"firefleur" : 0,
	"hand": .1,
	"alienboi": .1,
	"strangerock" : .5,
	"smileyboi" : 0,
	"strugglepot" : 0,
	"stitchy" : 1,
	"ice" : 0,
	"rainbowshine": 1,
	"boomboi": 0,
	"coffeebiote": .1
	}

const planet2 = {
	"fire": 1,
	"water": 0,
	"grass": 0,
	"spoon": 0,
	"redspider": .5,
	"digiveg": .1,
	"kniveleaves": 1,
	"livingblub": .5,
	"potatocoon": 1,
	"stonemoss": 0,
	"purpletentacles": 0,
	"firefleur" : 1,
	"hand": .1,
	"alienboi": .1,
	"strangerock" : .5,
	"smileyboi" : 0,
	"strugglepot" : 0,
	"stitchy" : 0,
	"ice" : 0,
	"rainbowshine": 0,
	"boomboi": 1,
	"coffeebiote": .1
	}

const planet3 = {
	"fire": 0,
	"water": 1,
	"grass": 0,
	"spoon": 0,
	"redspider": .5,
	"digiveg": .1,
	"kniveleaves": 0,
	"livingblub": .5,
	"potatocoon": 0,
	"stonemoss": 0,
	"purpletentacles": 1,
	"firefleur" : 0,
	"hand": .1,
	"alienboi": .1,
	"strangerock" : .5,
	"smileyboi" : 1,
	"strugglepot" : 1,
	"stitchy" : 0,
	"ice" : 1,
	"rainbowshine": 0,
	"boomboi": 0,
	"coffeebiote": .1
	}

func _ready():
	$Label.hide()
	$readytocollect.hide()
	

func _on_Timer_timeout():
	timer.stop()
	$readytocollect.show()


func render():
	if locked:
		$Button.set_normal_texture(load(locked_image))
	elif not locked:
		$Button.set_normal_texture(load(unlocked_image))


func give_plant_choices():
	var choices = [null, null, null]
	if place == 0:
		for picks in range(3):
			choices[picks] = give_plant_from_dict(planet1)
		get_parent().get_parent().get_child(0).get_child(4).get_child(0).set_texture(load("res://assets/background/planet_1.png"))	
	if place == 1:
		for picks in range(3):
			choices[picks] = give_plant_from_dict(planet2)
		get_parent().get_parent().get_child(0).get_child(4).get_child(0).set_texture(load("res://assets/background/planet_2.png"))
	if place == 2:
		for picks in range(3):
			choices[picks] = give_plant_from_dict(planet3)
		get_parent().get_parent().get_child(0).get_child(4).get_child(0).set_texture(load("res://assets/background/planet_3.png"))
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
		get_parent().get_child(7).hide()
		get_parent().get_child(6).hide()
	if active and timer.is_stopped():
		var choices = give_plant_choices()
		get_parent().goto_choose_screen(choices)
		active = false
		$Label.hide()
		$readytocollect.hide()
		get_parent().get_child(7).show()
		get_parent().get_child(6).show()



