extends TextureRect

@export var time_low = 0.5
@export var time_high = 1.5

@export var fruits = [preload("res://Fruits/apple.tscn"),preload("res://Fruits/bananas.tscn"),preload("res://Fruits/cherries.tscn")]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var fruit_to_spawn = fruits[randi_range(0,2)].instantiate()
	fruit_to_spawn.position = Vector2(randf_range(100,1000),$Marker2D.position.y)
	fruit_to_spawn.rotation = randf_range(-3,3)
	add_child(fruit_to_spawn)
	$Timer.wait_time = randf_range(time_low,time_high)
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	
	body.queue_free()
	pass # Replace with function body.
