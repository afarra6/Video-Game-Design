extends Control



@onready var progress_bar = $ProgressBar
@onready var animation_player = $AnimationPlayer

var win_condition = false
var state_change = false

## If true, player wins when the timer runs out. If false the player loses.
@export var win_on_timeout = false

## The text to be displayed after the countdown
@export var instruction_text : String





# Called when the node enters the scene tree for the first time.
func _ready():
	var anim = animation_player.get_animation("countdown")
	anim.track_set_key_value(0, 3, instruction_text)
	get_tree().paused = true
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !get_tree().paused:
		if not win_condition and progress_bar.value > 0:
			
			progress_bar.value -= 100 * (delta/5)
			
		elif win_on_timeout and !state_change:
			win()
			state_change = true
		elif !state_change:
			lose()
			state_change = true
	
	
	
	
	
	pass




func win():
	
	GameManager.points += 1
	GameManager.win_lose = true
	GameManager.to_interlude()
	print("win")
	
	
	


func lose():
	
	GameManager.health -= 1
	GameManager.win_lose = false
	if GameManager.health <= 0:
		GameManager.game_over()
	else:
		GameManager.to_interlude()
	
	


func _on_animation_player_animation_finished(anim_name):
	get_tree().paused = false
	pass # Replace with function body.
