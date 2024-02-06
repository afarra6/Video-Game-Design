extends TextureRect



func _process(delta):
	var time = Time.get_ticks_msec()
	var pos_x = sin(time * 0.001) 
	position = Vector2(pos_x * 100,0)
	
	

