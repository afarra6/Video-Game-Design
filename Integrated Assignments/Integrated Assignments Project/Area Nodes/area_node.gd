extends Node2D

@export var power = 500
var icon = preload("res://Area Nodes/physics_icon.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if randi_range(0,1000) > 980:
		var icon_ins = icon.instantiate()
		
		add_child(icon_ins)
		
		icon_ins.position = position
		icon_ins.apply_impulse(Vector2(power * randf_range(0.85,1.8), 10))
	
	
	
	
	
	pass
