extends Node


const minute = 60
const hour = 10 #this is just for the demo, actual value is 3600
const assets_folder = "res://assets/plants/"

const nutrients_dict = {
	"fire" : 15 * hour ,
	"water" : 10 * hour,
	"grass" : 11 * hour,
	"spoon" : 6 * hour,
	"redspider": 18 * hour,
	"digiveg": 7 * hour,
	"kniveleaves": 8 * hour,
	"livingblub": 6 * hour,
	"potatocoon": 17 * hour,
	"stonemoss": 20 * hour,
	"purpletentacles": 10 * hour,
	"firefleur": 13 * hour,
	"hand": 19 * hour,
	"alienboi": 13 * hour,
	"strangerock" :10 * hour,
	"smileyboi" : 2 * hour,
	"strugglepot" : 7 * hour,
	"stitchy" : 4 * hour,
	"ice" : 8 * hour,
	"rainbowshine" : 12 * hour,
	"boomboi": 10 * hour,
	"coffeebiote": 9 * hour
	}
	
	
const water_dict = {
	"fire" : 11 * hour ,
	"water" : 8  * hour,
	"grass" : 6 * hour,
	"spoon" : 16 * hour,
	"redspider" : 9 * hour,
	"digiveg": 7 * hour,
	"kniveleaves": 8 * hour,
	"livingblub": 11 * hour,
	"potatocoon": 7 * hour,
	"stonemoss": 10 * hour,
	"purpletentacles": 5 * hour,
	"firefleur": 10 * hour,
	"hand": 3 * hour,
	"alienboi": 13 * hour,
	"strangerock" :10 * hour,
	"smileyboi" : 5 * hour,
	"strugglepot" : 10 * hour,
	"stitchy" : 7 * hour,
	"ice" : 9 * hour,
	"rainbowshine" : 7 * hour,
	"boomboi": 2 * hour,
	"coffeebiote": 5 * hour
	}

const growth_intervals = {
	"fire" : [5, 17, 45, 200],
	"grass": [5, 9, 30, 120],
	"water": [5, 6, 24, 60],
	"spoon": [5, 8, 35, 300],
	"redspider": [5, 9, 35, 250],
	"digiveg": [5, 16, 250, 250],
	"kniveleaves":[5, 11, 60, 350],
	"livingblub":[5, 12, 40, 250],
	"potatocoon":[5, 9, 40, 130],
	"stonemoss": [5, 12, 40, 250] ,
	"purpletentacles": [5, 9, 40, 130], 
	"firefleur": [5, 17, 45, 200],
	"hand": [5, 9, 30, 120],
	"alienboi": [5, 12, 40, 250],
	"strangerock" : [5, 11, 60, 350],
	"smileyboi" : [5, 9, 30, 120],
	"strugglepot" : [5, 8, 35, 300],
	"stitchy" : [5, 8, 35, 300],
	"ice" : [5, 9, 40, 130],
	"rainbowshine" : [5, 16, 250, 250],
	"boomboi": [5, 17, 45, 200],
	"coffeebiote": [5, 17, 45, 200]
}


func instantiate_plant(species):
	var plantscene = load('res://Plant.tscn')
	var plant = plantscene.instance()
	plant.epoch = OS.get_unix_time()
	plant.stage = 1
	plant.species = species
	plant.seedling_image_path = assets_folder + species + '/1.png'
	plant.stage_1_image_path = 'res://assets/pots/pot_dirt_filled.png'
	plant.stage_2_image_path = assets_folder + species + '/2.png'
	plant.stage_3_image_path = assets_folder + species + '/3.png'
	plant.water_threshold = water_dict[species]
	plant.nutrients_threshold = nutrients_dict[species]
	plant.growth_intervals = growth_intervals[species]
	return plant
