extends Area2D


var in_the_pot = []

@onready var spawn_point = $"../../SpawnPoint"

@export var foods = [preload("res://tomato.tscn"), preload("res://bread.tscn")]



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	
	body.queue_free()
	if len(in_the_pot) < 3:
		in_the_pot.append(body.food_type)
	else:
		print("too full")
	
	
	print(in_the_pot)
	
	
	
	spawn_food(body.food_type)
	pass # Replace with function body.



func spawn_food(food):
	var food_to_spawn = 0
	
	match food:
		"tomato":
			food_to_spawn = 0
		"bread":
			food_to_spawn = 1
	
	var new_food = foods[food_to_spawn].instantiate()
	
	new_food.global_position = spawn_point.global_position
	
	
	
	get_parent().get_parent().add_child(new_food)
	
	
	
	
	
	pass
