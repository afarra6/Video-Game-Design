extends CharacterBody2D


@export var speed = 100

#1 Create four inputs, one for each direction: "left" "right" "up" "down"

func _ready():
	
	
	pass


func _process(delta):
	var target_velo = Vector2.ZERO
	
	
	#2: Set the if statement below to be true if pressing "right"
	
	if Input.is_action_pressed():
		
		target_velo.x -= 1
		pass
	
	#3: Using the above if statement as a template, make a new if statement below that is true when you press "left"
	# What do you have to change about the inside of the if statement to move to the left?
	
	
	
	#4: Set the if statement below to be true if pressing "down"
	if Input.is_action_pressed():
		
		target_velo.y -= 1
		
	
	
	#5: Using the above if statement as a template, make a new if statement below that is true when you press "up"
	# What do you have to change about the inside of the if statement to move up?
	
	
	velocity = target_velo.normalized() * speed
	
	move_and_slide()
	pass
