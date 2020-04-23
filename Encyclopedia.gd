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
	"fire" : ["Raises the temperature in the room", "Makes a good torch-like light", 3],
	"water": ["this plant jiggles as if full of water", 2, 3],
	"grass": ["cubes glow in dim light", "little blocks of nutrients! Great for salads", 3],
	"spoon": ["collects water to pour over itself", "appears upset when someone tries to water it", 3],
	"redspider": ["eyes appear to blink occasionally", "each spider bristles angrily if they get dirt in their eyes", 3],
	"digiveg": ["weird transmissions can be heard from this plant", 2, 3],
	"kniveleaves": ["This one is very sharp", "Helps you peel your potatoes", 3],
	"livingblub": ["capable of turning itself off and on", "blinks at us in patterns, a code?", 3],
	"potatocoon": ["the plant appears to repair itself rapidly when it is damaged", 2, 3],
	"stonemoss": ["a strange aura is felt in it's presence", 2, 3],
	"purpletentacles": ["harmless, but likes to steal small objects", "will let go if you tickle it a bit", 3],
	"firefleur" : ["the fiery glow can be blindingly bright at times", 2, 3],
	"hand": ["Will gladly shake your hand", "Knows its manners and always lends a helping hand", 3],
	"alienboi": ["It is like growing your own little alien friend", "Not the best at giving high fives", 3],
	"strangerock" : ["ominous red liquid seeps out sometimes?", "red patches absorb small objects, which are never seen again", 3],
	"smileyboi" : ["sometimes.. I think I hear it humming?", 2, 3],
	"strugglepot" : ["Balance game is on point", "Good at worrying anyone who is in the room", 3],
	"stitchy" : ["Patches up any holes in clothes", "Keep a safe distance if it’s bored", 3],
	"ice" : ["it doesn't seem to melt at any temperature", 2, 3],
	"rainbowshine": [],
	"boomboi": ["smells a lot like gunpowder and iron", 2, 3]
	}
	
var counter = {
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

var collectedplants = []

func set_page():
	if collectedplants != null:
		pass
	else:
		pass

func _on_backbutton_pressed():
	hide_all()
	emit_signal('open_spaceship')
