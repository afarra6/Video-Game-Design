extends Node

@export var scene_array = [preload("res://Game Timer/game_timer.tscn")]

var score = 0

var lives = 4




#Changes the scene
func _switch_scene(scene):
	#Frees the previous micro-game scene
	if get_child(6):
		get_child(6).queue_free()
	
	#Creates an instance of a new micro-game scene
	var new_scene = scene.instantiate()
	add_child(new_scene)
	
	#Connects signals from the instanced scene
	new_scene.health_down.connect(_on_health_down)
	new_scene.win.connect(_on_win)


#Removes one life, checks if the lives are zero
func _on_health_down():
	lives -= 1
	$LoseSound.play()
	if lives <= 0:
		_game_over()
	else:
		_next_level()

#Loads end scene when out of lives
func _game_over():
	
	get_tree().paused = true
	
	pass


#Plays the level transition animation
func _next_level():
	$AnimationPlayer.play("transition_ready")
	$LevelDelay.start()
	pass

#Picks a random scene from the scene_array and sets the next_scene
func _on_timer_timeout():
	var next_scene = scene_array.pick_random()
	_switch_scene(next_scene)
	
	pass # Replace with function body.


#Plays the wind sound effect and increments score by one
func _on_win():
	$WinSound.play()
	score += 1
	_next_level()
	$ColorRect/Score.text = str(score)
	pass

#Start button
func _on_button_pressed():
	
	_next_level()
	
	$StartScreen/Button.visible = false
	pass # Replace with function body.
