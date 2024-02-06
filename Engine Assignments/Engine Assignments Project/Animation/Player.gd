extends CharacterBody2D

var can_open = true
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	if velocity.x > 0 and is_on_floor():
		
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0 and is_on_floor():
		
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = true
	elif velocity.x == 0 and is_on_floor():
		$AnimatedSprite2D.play("Idle")
	

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("Jump")

	
	if Input.is_action_just_pressed("ui_up") and can_open:
		
		$"../AnimatableBody2D/AnimationPlayer".play("Lift")
		can_open = false
	
	
	
	
	
	
	
	move_and_slide()
