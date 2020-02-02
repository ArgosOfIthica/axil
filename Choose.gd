extends Control

var choice_1 = 'water'
var choice_2 = 'fire'
var choice_3 = 'grass'


signal kill_choose_plant_1
signal kill_choose_plant_2
signal kill_choose_plant_3


#Internal API's

func _on_Button_1_pressed():
	emit_signal('kill_choose_plant_1')
	hide()

func _on_Button_2_pressed():
	emit_signal('kill_choose_plant_2')
	hide()

func _on_Button_3_pressed():
	emit_signal('kill_choose_plant_3')
	hide()
	
