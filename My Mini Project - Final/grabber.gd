extends CharacterBody2D



var holding := false
var food_to_hold = null

@onready var spring = $Spring


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	
	
	pass


func _input(event):
	
	
	if event is InputEventMouseMotion:
		
		global_position = event.global_position
	
	
	
	
	if event is InputEventMouseButton and holding and event.pressed:
		
		
		
		if food_to_hold == null:
			
			spring.node_b = get_path()
			holding = false
		
		
	elif event is InputEventMouseButton and event.pressed:
		
		if food_to_hold != null:
			
			spring.node_b = food_to_hold.get_path()
			holding = true
		
		
		


func _on_area_2d_body_entered(body):
	
	food_to_hold = body
	
	
	
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	
	
	food_to_hold = null
	
	
	pass # Replace with function body.
