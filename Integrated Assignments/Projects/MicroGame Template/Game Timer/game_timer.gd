extends Control

#This UI should be placed in your micro-game scene
signal health_down

signal win
@export var instruction_text = "Go!"
#Set condition to true when your player wins your micro-game
var condition = false
var fail = false
var time_over = false
var can_send = true

func _ready():
	var animation = $Pivot/StartTimer/AnimationPlayer.get_animation("Start")
	get_tree().paused = true
	var track = 0 # or an integer
	
	var last_key = animation.track_get_key_count(track) - 1
	animation.track_set_key_value(track, last_key, instruction_text)
	
	pass


func _on_timer_timeout():
	
	time_over = true
	pass 


func _process(_delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		fail = true
	
	if condition == true and can_send:
		win.emit()
		$ProgressBar.running = false
		can_send = false
	
	if fail and can_send:
		health_down.emit()
		$ProgressBar.running = false
		can_send = false
		
	
	
	
	if condition == false and time_over == true and can_send == true:
		health_down.emit()
		can_send = false
		
	
	


func _on_win_area_body_entered(body):
	
	condition = true
	pass # Replace with function body.
