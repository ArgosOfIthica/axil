extends Timer

var minutes = 60
var seconds = 1

func _ready():
	$Label.set_text(str(minutes) + ":" + str(seconds))
