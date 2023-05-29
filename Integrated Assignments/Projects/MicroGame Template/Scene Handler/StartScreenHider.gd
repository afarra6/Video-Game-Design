extends Control





func _on_animation_player_animation_finished(_anim_name):
	
	queue_free()
	pass # Replace with function body.


func _on_button_pressed():
	$StartButton.play()
	$StartMusic.stop()
	pass # Replace with function body.
