extends ProgressBar

var CURRENT_TIME = 5

var running = true
func _process(delta):
	
	
	if not $"../Pivot/StartTimer/AnimationPlayer".is_playing() and running:
		
		CURRENT_TIME -= 1 * delta
		
	
	
	value = CURRENT_TIME/5 * 100
	



func _on_animation_player_animation_finished(_anim_name):
	visible = true
	$"../Timer".start()
	pass # Replace with function body.
