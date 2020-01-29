extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal kill_choose

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Button_1_pressed():
	emit_signal('kill_choose')
	hide()

func _on_Button_2_pressed():
	emit_signal('kill_choose')
	hide()

func _on_Button_3_pressed():
	emit_signal('kill_choose')
	hide()
	