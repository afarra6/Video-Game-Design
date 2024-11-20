extends Control
@onready var score_label = $"Score Label"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	score_label.text = "Final Score: " + str(GameManager.points)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	
	GameManager.restart()
	pass # Replace with function body.


func _on_audio_stream_player_2_finished():
	$AudioStreamPlayer.play()
	pass # Replace with function body.
