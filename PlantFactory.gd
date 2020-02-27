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


func instantiate_plant(species):
	var plantscene = load('res://Plant.tscn')
	var plant = plantscene.instance()
	plant.epoch = OS.get_unix_time()
	plant.stage = 0
	plant.species = species
	#TODO: fix the image paths
	plant.seedling_image_path = assets_folder + species + '/1.png'
	plant.stage_1_image_path = assets_folder + species + '/1.png'
	plant.stage_2_image_path = assets_folder + species + '/2.png'
	plant.water_threshold = water_dict[species]
	plant.nutrients_threshold = nutrients_dict[species]
	return plant
