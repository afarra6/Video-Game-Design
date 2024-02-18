extends "res://addons/godot_tours/tour.gd"

var red_text = "[color=red]red[/color]"
const GD_ICON = preload("res://icon.svg")

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
	#title()
	new_section()
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
	
	bubble_set_title("Collision Shapes")
	bubble_add_text([bbcode_wrap_font_size("[center]Put Title Here[/center]", 32)])
	bubble_add_text(
		["[center]Add description here[/center]",
		"[center]Add more description here (creates a new paragraph)[/center]"]
	)
	complete_step()
	
	
	bubble_set_title("Collision Shapes 2")
	
	bubble_add_text([
		"[left]This is my new text.[/left]",
		"[center]This is a line break.[/center]",
		"[center]We're writing a particularly long sentence with many large words and we \
want to keep all of the text visible in the IDE.[/center]"
	])
	
	bubble_add_text([
		"[center][b]BOLD[/b], [i]italics[/i] " + red_text + ".[/center]"
	])
	
	complete_step()
	

func new_section():
	
	bubble_move_and_anchor(interface.main_screen, bubble.At.CENTER_LEFT, 16.0, Vector2(-30, 30) )
	scene_open("res://testing.tscn")
	bubble_set_title("New Section")
	highlight_controls([interface.scene_dock, interface.run_bar_play_current_button, interface.inspector_dock])
	
	complete_step()
	
	bubble_add_task("Add a Camera3D and rename it Camera1", 1,
	func my_task(task: Task) -> int:
		var root_node = EditorInterface.get_edited_scene_root()
		var cam_node = root_node.find_child("Camera1")
		
		if cam_node is Camera3D:
			return 1
		else:
			return 0
		
	)
	
	bubble_add_texture(GD_ICON)
	
	complete_step()
	pass
