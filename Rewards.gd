extends Control

var water = null
var nutrient = null

signal open_choose

func goto_rewards():
	#prepare_rewards_rendering()
	show()
	$PU.get_child(0).show()

func _ready():
	hide()

#func random_resources(resource):
#	var rng = randi()%4+1
#	return rng.resource

#func prepare_rewards_rendering():
#	random_resources(water)
#	#random_resources(nutrient)

func _on_Button_pressed():
	emit_signal("open_choose")
	$PU/Reward_PU.hide()
	hide()
