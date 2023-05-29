extends Control

#This UI should be placed in your micro-game scene
signal health_down

signal win

#Set condition to true when your player wins your micro-game
var condition = false


var time_over = false
var can_send = true



func _on_timer_timeout():
	
	time_over = true
	pass 


func _process(_delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		condition = true
		$ProgressBar.running = false
	
	if condition == true and can_send:
		win.emit()
		can_send = false
	
	
	if condition == false and time_over == true and can_send == true:
		health_down.emit()
		can_send = false
		
	
	
