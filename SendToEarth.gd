extends Control

var chosen_pot
bool confirm

func goto_sendtoearth():
	show()
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
	if confirm = true:
		$Spaceship.pots[chosen_pot].plant = null
		hide()
	if $noButton.pressed:
		-_on_noButton_pressed()
	

func _on_yesButton_pressed():
	confirm = true


func _on_noButton_pressed():
	hide()
