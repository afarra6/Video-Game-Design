@tool
extends Marker3D
@export var output = 0
@export var box := preload("res://box.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var new_box = box.instantiate()
	add_child(new_box)
	
	pass # Replace with function body.
