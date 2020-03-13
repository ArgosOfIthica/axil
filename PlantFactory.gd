extends Node


const minute = 60
const hour = 3600
const assets_folder = "res://assets/plants/"

const nutrients_dict = {
	"fire" : 15 * hour ,
	"water" : 10 ,#test value only
	"grass" : 11 * hour
	}
	
	
const water_dict = {
	"fire" : 11 * hour ,
	"water" : 8  ,#test value only
	"grass" : 6 * hour
	}

const growth_intervals = {
	"fire" : [1, 17, 45, 200],
	"grass": [1, 9, 30, 120],
	"water": [1, 6, 24, 60]
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
