extends Control

var selected_pot

func goto_sendtoearth():
	show()
	$textbox_which.show()
	$which_plant_text.show()
	$textbox_confirm.hide()
	$confirm_text.hide()
	$yesButton.hide()
	$noButton.hide()

func _ready():
	hide()


func selection(chosen_pot):
	$textbox_which.hide()
	$which_plant_text.hide()
	$textbox_confirm.show()
	$confirm_text.show()
	$yesButton.show()
	$noButton.show()
	selected_pot = chosen_pot
	

func _on_yesButton_pressed():
	get_parent().pots[selected_pot].plant = null
	hide()


func _on_noButton_pressed():
	hide()
