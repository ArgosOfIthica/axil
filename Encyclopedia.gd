extends Control

signal open_spaceship

func hide_all():
	hide()
	$BG.get_child(0).hide() 
	$BG_Music.stop()

func goto_encyclopedia():
	show()
	$BG.get_child(0).show()
	$BG_Music.play()

func _ready():
	hide_all() 

#water/nutrients --> plant.water/3600 + "hours"
const notes = {
	"fire" : ["very hot", "dummy hot", "dang that hot"],
	"water": [],
	"grass": [],
	"spoon": [],
	"redspider": [],
	"digiveg": [],
	"kniveleaves": [],
	"livingblub": [],
	"potatocoon": [],
	"stonemoss": [],
	"purpletentacles": [],
	"firefleur" : [],
	"hand": [],
	"alienboi": [],
	"strangerock" : [],
	"smileyboi" : [],
	"strugglepot" : [],
	"stitchy" : [],
	"ice" : [],
	"rainbowshine": [],
	"boomboi": []
	}
	
const collection = {
	"fire" : 0,
	"water": 0,
	"grass": 0,
	"spoon": 0,
	"redspider": 0,
	"digiveg": 0,
	"kniveleaves": 0,
	"livingblub": 0,
	"potatocoon": 0,
	"stonemoss": 0,
	"purpletentacles": 0,
	"firefleur" : 0,
	"hand": 0,
	"alienboi": 0,
	"strangerock" : 0,
	"smileyboi" : 0,
	"strugglepot" : 0,
	"stitchy" : 0,
	"ice" : 0,
	"rainbowshine": 0,
	"boomboi": 0
	}

func _on_backbutton_pressed():
	hide_all()
	emit_signal('open_spaceship')
