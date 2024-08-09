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
	classes_section()
	inheritance()
	
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
	
	
	context_set_2d()
	scene_open("res://testing.tscn")
	
	bubble_set_title("")
	bubble_add_text([bbcode_wrap_font_size("[center]Object Oriented Programming[/center]", 32)])
	bubble_add_text(
		["[center]Object Oriented Programming, often abbreviated as OOP, is a common paradigm used in many high-level languages including GDScript (Godot's programming language). If you have experience with languages like javascript, C#, python, or similar many of the concepts discussed in this tour will be familiar to you![/center]"]
	)
	complete_step()
	
	bubble_add_text([bbcode_wrap_font_size("[center]Object Oriented Programming[/center]", 32)])
	bubble_add_text(
		["[center]In OOP we create virtual 'objects' that we can then either manipulate or recieve \
information about or from them. Each 'object' is created from a [color=lime]Class[/color] (you can think of a [color=lime]Class[/color] as a 'blueprint'). \
For the remainder of this tour 'Class' and 'object' will be used interchangably! All [color=lime]Classes[/color] have two important concepts \
attached to them:[/center]", 
"[color=skyblue]methods()[/color]",
"and",
"[color=skyblue]properties[/color]",
"",
"We'll discuss these more in depth at a later point in this tour, but first let's talk more in depth about [color=lime]Classes[/color] in general."]
	)
	complete_step()
	

func classes_section():
	
	bubble_add_text([
"[center]As stated before, [color=lime]Classes[/color] can be thought of as 'blueprints' for objects. Every language has its own \
collection of these 'blueprints' that allow us (the programmer) to perform many tasks, both complex and simple. Let's make this more concrete with an example.[/center]"
		])
	
	complete_step()
	
	
	bubble_add_text([
"[center]In our example, our hypothetical [color=lime]Class[/color] is called [color=lime]MyVehicle[/color]. Notice that [color=lime]Classes[/color] are always written in \
[b]PascalCase[/b] (meaning that it begins with a capital letter, has no spaces, and each new word begins with a capital as well) and appear in a [b]light green[/b]. This is true in the built in IDE (integrated developement environment) as well.[/center] \
The process of using a [color=lime]Class[/color] to create an 'object' is called [b]instancing[/b]. Here we can see one (1) [b]instance[/b] of a [color=lime]MyVehicle[/color] class.",
		])
	
	
	bubble_move_and_anchor(interface.main_screen, Bubble.At.BOTTOM_RIGHT)
	highlight_controls([interface.main_screen])
	
	
	complete_step()
	
	bubble_add_text([
"[center]First, let's talk about this [color=lime]Class[/color] and what it might be used for. Consider that we are \
running a virtual car dealership. Each vehicle would be unique, but they may have many similar characteristics. This is \
a perfect situation for a [color=lime]Class[/color]! Currently we only have one (1) [b]instance[/b] of [color=lime]MyVehicle[/color] but in the future we can add more. \
Let's use this [b]instance[/b] to explore one of the most important OOP concepts: [color=skyblue]properties[/color]. [/center]" 
		])
	complete_step()
	
	highlight_controls([interface.main_screen, interface.inspector_dock])
	
	bubble_add_text([
"[center][color=skyblue]properties[/color] (again, note that the word 'properties' are in all lowercase) can be thought of as \
descriptors of an object. They tell us all sorts of useful information. Godot shows us these properties in the [b]inspector[/b]. \
We can see under the 'MyVehicle' section five (5) different properties: [/center]",
"Color",
"Doors",
"Top Speed",
"Price",
"Accidents",
"We can also edit these properties in the inspector! Go ahead and try changing them!"
		])
	complete_step()
	
	bubble_add_text([
"[center]Let's add another [b]instance[/b] of [color=lime]MyVehicle[/color] to the scene by clicking the '+' button 
at the top of the [b]Scene Dock[/b] and searching for [color=lime]MyVehicle[/color].[/center]"
		])
	
	
	bubble_add_task("Add a new instance of [color=lime]MyVehicle[/color].", 1,
	func new_instance(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.get_child_count() > 1 and root.find_child("MyVehicle2") is MyVehicle:
			return 1
		
		return 0
		
		)
	complete_step()
	
	


func inheritance():
	
	
	bubble_add_text([
"[center]We can see that the new [b]instance[/b] has all of the same [color=skyblue]properties[/color] as the first [b]instance[/b] but that we can change their values independently. \
This is the power of [color=lime]Classes[/color], we can make many [b]instances[/b] of a [color=lime]Class[/color] \
that all have the same [color=skyblue]properties[/color] but each [b]instance[/b] can have its own values and be manipulated separately.[/center]",
"[center]We should also mention another important OOP concept: [b]Inheritance[/b]. [color=lime]Classes[/color] can have [color=lime]SubClasses[/color] that \
[b]inheret[/b] their parent's [color=skyblue]properties[/color] but add additional functionality. For example, add an [b]instance[/b] of [color=lime]MyTruck[/color] to the scene.[/center]"
	])
	
	bubble_add_task("Add a new instance of [color=lime]MyVehicle[/color].", 1,
	func new_instance(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.get_child_count() > 1 and root.find_child("MyTruck") is MyTruck:
			return 1
		
		return 0
		
		)
	
	complete_step()
	
	
	
	
	
	
	
	pass
