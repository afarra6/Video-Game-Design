extends Control

@export var current_health = 4

func _process(_delta):
	current_health = $"../..".lives
	
	if current_health < 4:
		$Empty1.visible = true
	
	if current_health < 3:
		$Empty2.visible = true
	
	if current_health < 2:
		$Empty3.visible = true
	
	if current_health < 1:
		$Empty4.visible = true
