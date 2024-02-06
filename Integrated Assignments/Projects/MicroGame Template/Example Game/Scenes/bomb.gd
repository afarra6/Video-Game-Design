extends RigidBody2D

var can_play = true
# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = randf_range(0.125, 0.25)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	
	if can_play:
		
		$Thwack.play()
		can_play = false
		apply_impulse(Vector2(300, 0))
		
	pass # Replace with function body.
