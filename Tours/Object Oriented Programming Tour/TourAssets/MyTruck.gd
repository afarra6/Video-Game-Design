@tool
extends "res://TourAssets/new_script.gd"
class_name MyTruck

## Towing capacity in kilograms
@export var towing_capacity = 100

var truck_image = load("res://TourAssets/sprite6_0.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	texture = truck_image
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	self_modulate = color
	pass
