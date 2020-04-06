extends Control

var selected_pot
var plant

func goto_sendtoearth():
	show()
	$textbox_which.show()
	$which_plant_text.show()
	$textbox_confirm.hide()
	$confirm_text.hide()
	$yesButton.hide()
	$noButton.hide()
	$textbox_response.hide()
	$response_text.hide()
	$closeButton.hide()

func _ready():
	hide()


func selection(chosen_pot):
	$textbox_which.hide()
	$which_plant_text.hide()
	$textbox_confirm.show()
	selected_pot = chosen_pot
	if get_parent().pots[selected_pot].plant != null:
		if get_parent().pots[selected_pot].plant.stage == 3:
			$confirm_text.text = "Would you like to send this plant back to Earth?"
			$confirm_text.show()
			$yesButton.show()
			$noButton.show()
		else:
			$confirm_text.text = "This plant is not fully grown yet!"
			$confirm_text.show()
			$closeButton.show()
	elif get_parent().pots[selected_pot].plant == null:
		$confirm_text.text = "There is no plant here to send back!"
		$confirm_text.show()
		$closeButton.show()
	
	

func _on_yesButton_pressed():
	$textbox_confirm.hide()
	$confirm_text.hide()
	$yesButton.hide()
	$noButton.hide()
	$textbox_response.show()
	$response_text.show()
	$closeButton.show()
	$response_text.text = response_dict[get_parent().pots[selected_pot].plant.species]
	get_parent().pots[selected_pot].plant = null
	
func _on_closeButton_pressed():
	hide()

const response_dict = {
	"fire" : "We are so very glad that you sent this plant along when you did! The heater in the lab has gone out and we have been wearing our winter coats for a week! But this specimen has been heating the whole complex! Your research is helping us already!",
	"water" : "I just wanted to let you know that we received your aquatic sample and have started testing the water that it produces. Apparently, it’s rich in chlorine, so the lab may be getting a pool pretty soon. Thanks again for all of your research!",
	"grass" : "Hello there! We have some great news about the newest plant that you have sent. One of our technicians was eating a salad and got curious; long story short, apparently this plant is extremely nutritious and flavorful! We are thinking that it’ll help with food shortages, so please keep up your important exploration!",
	"spoon" : "I’m glad you have been able to send another specimen. I have never seen such an independent plant! It’s so grown up, what’s next? Is it going to head off to college and leave me, too? Oh, sorry, got carried away there. Anyway, keep on cultivating!",
	"redspider": "I’m glad to see that you have sent another plant along, but my goodness, this one is quite spider-y. I get the heebie-jeebies while studying it, and I’m pretty sure it’s watching me somehow. Regardless, keep sending plants our way!",
	"digiveg": "H€ll≠ ag°in, I j¢st w§nted to łet yøu kno₩ th@t yo‰r la$t płant sæmple is quįte unšt@ble. The łaboratøry ¢ompu/ers are stiłl a lîttl« ßuggy. Øh welł, keęp up the gœd w…rk!",
	"kniveleaves": "You have a sharp eye for interesting specimens, my friend. I have nearly ran out of tiny bandages for my fingers, but I think I have just about figured out how to handle this foliage. Keep sending us some cutting edge plants from your expedition.",
	"livingblub": "Hello there, I wanted to check in and tell you that we got your... plant. It seems that this specific specimen is rather lively; the pistil has not stopped waving at us and making bright light flares. We’re thinking it’s like Morse code. We may be close to learning a new vegetation language! Thanks for your help!",
	"potatocoon": "Thank you for sending yet another sample! A few of the lab technicians have reported hearing a skittering sound from inside and some have even seen the plant ungulate. Hope there isn’t a terrifying surprise inside. Anyway, we wish you luck with your exploration!",
	"stonemoss": "This moss has been astounding to study. Well, for everyone except for our newest geologist who left a couple of specimens out last night. They’ve assimilated with your newest donation, but c’est la vie. We can always get more rocks from our own planet. Until next time!",
	"purpletentacles": "Avast, my space traveling colleague! Sorry, your last plant has really gotten me in a sea-faring mood. These little tentacle leaves are quite possessive, but that’s alright because they help me hold extra tools! Arrgh! Thank ye for your continued research!",
	"firefleur": "Thank you for sending this flower when you did! It has been so sad and overcast lately that being able to study this warm, powerful plant has been great for all of us in the lab. It feels like the middle of summer with the amount of heat that this plant makes. Thanks for sending all your plants back here!",
	"hand": "We just received your latest specimen and... well, the plant opened the shipping container on its own. The lab assistants were scared at first, but the plant seems to want to lend them a hand with research. Keep them coming!",
	"alienboi": "Let me begin this transmission with some clarification: your other specimens have been amazing... but this “plant” is by far the most fantastic! This little extraterrestrial is studying us as much as we are studying them. The alien, as well as the rest of the lab is excited to see what you send us next!",
	"strangerock": "Hello again, we got your newest specimen and it has created quite the buzz around the office! Due to an odd idea from one of our interns, we have discovered that the crystals on the plant are actually gelatinous, and if prompted, will absorb our lab tools. Keep up the good work, and if you have any extra forceps, we may need a new pair for no reason in particular.",
	"smileyboi" : "Thank you for sending this sample! Keep 'em coming!",
	"strugglepot" : "Thank you for sending this sample! Keep 'em coming!"
	}


func _on_noButton_pressed():
	hide()
