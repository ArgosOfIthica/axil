extends Control

signal open_spaceship

var page_num

func hide_all():
	hide()
	$BG.get_child(0).hide() 
	$BG_Music.stop()

func goto_encyclopedia():
	page_num = 0
	set_page(page_num)
	show()
	$BG.get_child(0).show()
	$BG_Music.play()

func _ready():
	hide_all() 

const names = {
	"fire" : "Fire Grass",
	"water" : "Aqua Drop",
	"grass" : "Cube Grass",
	"spoon" : "Spoon Tipper",
	"redspider": "Red Spider",
	"digiveg": "Digiveg",
	"kniveleaves": "Knife Leaves",
	"livingblub": "Living Bulb",
	"potatocoon": "Potatocoon",
	"stonemoss": "Stonemoss",
	"purpletentacles": "Orchid Ocean Dweller",
	"firefleur": "Fire Fleur",
	"hand": "Graspberry",
	"alienboi": "Alien Boi",
	"strangerock" : "Strange Rock",
	"smileyboi" : "Beaming Blossom",
	"strugglepot" : "Struggle Pot",
	"stitchy" : "Stitchweed",
	"ice" : "Frostcane",
	"rainbowshine" : "Rainbowshine",
	"boomboi": "Boom Bloom",
	"coffeebiote": "Coffeebiote"
}

const notes = {
	"fire" : ["pot requires frequent cleaning due to all the ash the specimen produces", "shrinks in colder temperatures", "seems to deplete the oxygen in the area (rapidly)"],
	"water": ["seed found 30 meters below the surface of a warm, violet lake", "jiggles as if full of water", "squirts liquid from its top occasionally… is it playing?"],
	"grass": ["cubes glow in dim light", "creatures of the planet grazed on specimen’s geometric fruit (tasty?)", "little blocks of nutrients! Great for salads"],
	"spoon": ["webbing between stems for support", "collects water to pour over itself", "slumps, appearing upset when someone tries to water it"],
	"redspider": ["eyes appear to blink occasionally", "each flower - no, not flower ... spider? - bristles angrily if they get dirt in their eyes", "when in full bloom, spiders will pop off the stem"],
	"digiveg": ["weird transmissions can be heard from this plant", "all nearby computers restart every time it grows… EVERY time", "seems to cause mutations in other plants"],
	"kniveleaves": ["ouch! note to self: keep bandages nearby", "actually pretty helpful with peeling potatoes", "sharpens its leaves using the rim of the pot"],
	"livingblub": ["capable of turning its internal light off and on", "blinks at us in patterns (a code?)", "sometimes its leaves sway like it’s waving (cute!)"],
	"potatocoon": ["the plant appears to repair itself rapidly when it is damaged", "flesh looks very web-like", "if you shine a light through it, you can see movement within"],
	"stonemoss": ["a strange, calming aura is felt in its presence", "collects nearby rocks with its levitational pull", "a glowing rune marks each stone the moss touches"],
	"purpletentacles": ["likes to steal small objects", "will let go if you tickle it a bit", "will squirt ink at you if you don’t let it hold your hand (unrelated: buy stain remover when back on Earth)"],
	"firefleur" : ["the fiery glow can be blindingly bright at times", "lovely scent of cinnamon and spices", "the forest where these grow in great numbers never experiences night"],
	"hand": ["will gladly lend a hand wherever needed; very helpful!", "fingernails fall off as seeds (kind of hard to watch)", "can unroot itself to crawl around and then reroot when it’s returned to the pot"],
	"alienboi": ["Seed found near an asteroid collision site", "Not the best at giving high fives", "Occasionally caught phoning home???"],
	"strangerock" : ["ominous red liquid seeps out sometimes?", "red patches absorb small objects, which are never seen again", "sometimes I think I see the reflection of a different world within each red patches"],
	"smileyboi" : ["sometimes... I think I hear it humming?", "radiates a very, very positive energy!", "indicates that it is thirsty by blinking up at you, as if saying ‘Pretty please’"],
	"strugglepot" : ["it’s really, really trying its best", "can radiate a feeling of uncertainty and worry if in a bad mood", "will dance a little when happy, bouncing its pots left and right"],
	"stitchy" : ["when in a good mood, will patch up any holes in clothes!", "when bored, keep a safe distance; specimen gets a bit stabby", "the thread produced by it is extremely durable!"],
	"ice" : ["it doesn't seem to melt at any temperature (I’ve tried)", "found in the ice caves of the desolate tundra", "use of thick gloves is necessary to avoid frostbite when interacting with this plant"],
	"rainbowshine": ["scent seems to be ever changing; one moment it smells of the darkest berries and the next it is the brightest citrus", "skin of this plant twinkles like the stars", "found on the high mountains, where the ground meets the sky"],
	"boomboi": ["smells a lot like gunpowder and iron", "the comical bomb-like sprout grows in size until bloom", "speaking of which.. can be dangerous when it blooms (watch out for flying debris)"],
	"coffeebiote": ["grows emotionally attached to cups", "the limbs of this plant are extremely soft!", "it loves to tickle… everything"]
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
	"boomboi": 0,
	"coffeebiote": 0
	}

var collectedplants = []

func set_page(page_num):
	if (collectedplants.empty() == false):
		var species = collectedplants[page_num]
		$sketch.set_texture(load("res://assets/plants/" + collectedplants[page_num] + '/sketch.png'))
		$name.text = names[species]
		var plantinfo_route = get_parent().get_child(2)
		$nutrient.text = "every " + str(plantinfo_route.nutrients_dict[species]*10) + " seconds" #will be hours in mobil ver
		$water.text = "every " + str(plantinfo_route.water_dict[species]*10) + " seconds" #will be hours in mobil ver
		if(plantinfo_route.growth_intervals[species][2] <= 150):
			$growthrate.text = "Quick"
		elif(plantinfo_route.growth_intervals[species][2] >= 275):
			$growthrate.text = "Slow"
		else:
			$growthrate.text = "Average"
		if(counter[species] >= 2):
			$fact1.text = "• " + notes[species][0]
		else:
			$fact1.text = " "
		if(counter[species] >= 3):
			$fact1.text += " \n• " + notes[species][1]
		if(counter[species] >= 4):
			$fact1.text += " \n• " + notes[species][2]




func _on_backbutton_pressed():
	hide_all()
	emit_signal('open_spaceship')


func _on_turn_page_back_pressed():
	if (page_num != 0):
		page_num -= 1
		set_page(page_num)


func _on_turn_page_forward_pressed():
	if (page_num != collectedplants.size()-1):
		page_num += 1
		set_page(page_num)
