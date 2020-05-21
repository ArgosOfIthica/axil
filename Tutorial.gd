extends Control

func goto_intro():
	show()
	$howto_textbox.hide()
	$howto_text.hide()
	$howto_next0.hide()
	$howto_next1.hide()
	$howto_next1a.hide()	
	$howto_next2.hide()
	$howto_next3.hide()
	$howto_next4.hide()
	$howto_next4a.hide()	
	$arrow0.hide()
	$close.hide()
	$textboxIntro.show()
	$nextIntro.show()
	$textIntro.show()

func _ready():
	hide()


func _on_nextIntro_pressed():
	$textboxIntro.hide()
	$nextIntro.hide()
	$textIntro.hide()
	$howto_text.set_text("This is the horticulture deck, \nwhere you grow and care for specimens.")
	$howto_textbox.show()
	$howto_text.show()
	$howto_next0.show()


func _on_howto_next0_pressed():
	$howto_text.set_text("Access the map to send out your rover \nto explore planets and collect seeds.")
	$arrow0.show()
	$pointAnimated.set_current_animation("pointMap")
	$pointAnimated.play()
	$howto_next0.hide()
	$howto_next1.show()

func _on_howto_next1_pressed():
	$howto_text.set_text("The seed you receive from exploration \nwill be displayed here.")
	$pointAnimated.set_current_animation("point seed")
	$pointAnimated.play()
	$howto_next1.hide()
	$howto_next1a.show()

func _on_howto_next1a_pressed():
	$howto_text.set_text("Press the seed and then the desired pot \nto plant the specimen.")
	$howto_next1a.hide()
	$howto_next2.show()

func _on_howto_next2_pressed():
	$howto_text.set_text("To care for the plant, water and distribute nutrients to the specimen when needed.")
	$pointAnimated.set_current_animation("pointWaterNutrient")
	$pointAnimated.play()
	$howto_next2.hide()
	$howto_next3.show()

func _on_howto_next3_pressed():
	$howto_text.set_text("When a plant is fully-grown, send it back to Earth by pressing Earth and then the specimen.")
	$pointAnimated.set_current_animation("pointSend")	
	$pointAnimated.play()
	$howto_next3.hide()
	$howto_next4.show()

func _on_howto_next4_pressed():
	$howto_text.set_text("Every plant you send back \nis recorded in your journal.")
	$pointAnimated.set_current_animation("pointEncyclopedia")
	$pointAnimated.play()
	$howto_next4.hide()
	$howto_next4a.show()

func _on_howto_next4a_pressed():
	$howto_text.set_text("Each time a plant is sent back, \nmore information is recorded in the journal.")
	$howto_next4a.hide()
	$close.show()

func _on_close_pressed():
	hide()
