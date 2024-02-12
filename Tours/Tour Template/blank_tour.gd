extends "res://addons/godot_tours/tour.gd"



# Add sections in the order you want them to appear in the build function.
# Remember to edit the godot_tours.tres in the inspector when you rename the tour script.
# You must save the tour script for your changes to take effect.
func _build():
	
	queue_command(func reset_editor_state_for_tour():
		interface.canvas_item_editor_toolbar_grid_button.button_pressed = false
		interface.canvas_item_editor_toolbar_smart_snap_button.button_pressed = false
		interface.bottom_button_output.button_pressed = false
	)
	
	initial()
	title()
	
	pass

# Useful methods: 
#complete_step() -> tells the build function the end of the current bubble
#context_set_3d(), context_set_2D(), context_set_script() -> Change the current context
#scene_open() -> open a scene to view
#bubble_add_text([String]) -> add text to the bubble
#highlight_controls() -> highlight part of the UI
#bubble_move_and_anchor() -> move the bubble around.
#bubble_add_task() -> add a task to the bubble. Here's an example:
#
#bubble_add_task("Disable the OmniLight3D. Enable the SpotLight3D by changing its visibility, feel free to move and rotate the light", 1,
	#func enable_direct(task: Task) -> int:
		#var light1 = EditorInterface.get_edited_scene_root().get_child(2)
		#var light2 = EditorInterface.get_edited_scene_root().get_child(3)
		#if light1.visible == false and light2.visible == true:
			#next()
			#return 1
		#else:
			#return 0
		#
		#)

# An initial blank section. This is not shown but stops a bug from happening where you cannot pass
# the first bubble.
func initial():
	auto_next()
	complete_step()


# Add new sections as functions below.

##A title bubble, detail what the subject of the tour is here.
func title():
	
	
	context_set_script()
	scene_open("res://main.tscn")
	
	bubble_set_title("")
	bubble_add_text([bbcode_wrap_font_size("[center]Put Title Here[/center]", 32)])
	bubble_add_text(
		["[center]Add description here[/center]",
		"[center]Add more description here (creates a new paragraph)[/center]"]
	)
	complete_step()
	
