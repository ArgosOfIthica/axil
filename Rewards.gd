extends Control

var choices = [null, null, null]
var user_chose = null

signal choose_reward

func _on_Seed1_pressed():
	terminate_rewards_scene(0)

func _on_Seed2_pressed():
	terminate_rewards_scene(1)

func _on_Seed3_pressed():
	terminate_rewards_scene(2)

func terminate_rewards_scene(choice):
	user_chose = choices[choice]
	emit_signal("choose_reward")
	hide()

func goto_rewards():
	prepare_rewards_rendering()
	show()
	$PU.get_child(0).show()
	
func prepare_rewards_rendering():
	$Seed1.set_normal_texture(load(choices[0].seedling_image_path))
	$Seed2.set_normal_texture(load(choices[1].seedling_image_path))
	$Seed3.set_normal_texture(load(choices[2].seedling_image_path))
	show()
