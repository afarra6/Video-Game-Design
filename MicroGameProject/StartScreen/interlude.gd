extends Control
@onready var ready_label = $Label



# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	get_tree().paused = false
	
	
	if GameManager.win_lose:
		$WinJingle.play()
	else:
		$LoseJingle.play()
	
	
	
	if GameManager.health <= 3:
		$Hearts/Heart4.modulate = Color(0.1, 0.0, 0.0, 0.8)
	
	if GameManager.health <= 2:
		$Hearts/Heart3.modulate = Color(0.1, 0.0, 0.0, 0.8)
	
	if GameManager.health <= 1:
		$Hearts/Heart2.modulate = Color(0.1, 0.0, 0.0, 0.8)
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	ready_label.modulate = Color.WHITE * (1.0 - (sin(Time.get_ticks_msec()/200.0) * 0.2) - 0.2)
	ready_label.modulate += Color(0,0,0,1) 
	pass


func _on_timer_timeout():
	
	GameManager.next_game()
	
	pass # Replace with function body.




