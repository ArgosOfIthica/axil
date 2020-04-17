extends Control

var choices = [null, null, null]
var user_chose = null

signal choose_plant

func _on_Button_1_pressed():
	terminate_choose_scene(0)

func _on_Button_2_pressed():
	terminate_choose_scene(1)

func _on_Button_3_pressed():
	terminate_choose_scene(2)
	
func terminate_choose_scene(choice):
	user_chose = choices[choice]
	emit_signal('choose_plant')
	hide()
	$BG.get_child(0).hide()
	

func _ready():
	$BG.get_child(0).hide()

func goto_choose():
	$Button_1.set_normal_texture(load(choices[0].seedling_image_path))
	$Button_2.set_normal_texture(load(choices[1].seedling_image_path))
	$Button_3.set_normal_texture(load(choices[2].seedling_image_path))
	show()
	$BG.get_child(0).show()
