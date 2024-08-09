@tool
extends Sprite2D
class_name MyVehicle

#@export var style : String:
	#set(new_style):
		#match new_style:
			#"sedan":
				#wheels = 4
				#top_speed = 120
				#doors = 4
			#"coupe":
				#wheels = 4
				#top_speed = 180
				#doors = 2
const wheels : int = 4
@export var color : Color = Color.DEEP_SKY_BLUE
@export_enum("2", "4") var doors : int = 4
@export var top_speed : int = 120
@export var price : int = 30000
@export var accidents : int = 0
var coupe_image = load("res://TourAssets/spr_casualcar_0.png")
var sedan_image = load("res://TourAssets/spr_bluecar_0.png")
var curr_doors = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	
	if find_child("WheelLabel") and int(find_child("WheelLabel").text) != wheels:
		find_child("WheelLabel").text = "Wheels: " + str(wheels)
		
	if find_child("SpeedLabel") and int(find_child("SpeedLabel").text) != top_speed:
		find_child("SpeedLabel").text = "Top Speed: " + str(top_speed)
		
	if find_child("PriceLabel") and int(find_child("PriceLabel").text) != price:
		find_child("PriceLabel").text = "Price: " + str(price)
		
	
	if find_child("AccidentLabel") and int(find_child("AccidentLabel").text) != accidents:
		find_child("AccidentLabel").text = "Accidents: " + str(accidents)
		
	
	
	if doors == 0 and curr_doors != doors:
		texture = coupe_image
		curr_doors = doors
		print("coupe")
	
	if doors == 1 and curr_doors != doors:
		texture = sedan_image
		curr_doors = doors
		print("sedan")
	
	
	self_modulate = color
