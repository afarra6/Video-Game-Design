extends "res://addons/godot_tours/tour.gd"

var main_root


func _build():
	
	queue_command(func reset_editor_state_for_tour():
		interface.canvas_item_editor_toolbar_grid_button.button_pressed = false
		interface.canvas_item_editor_toolbar_smart_snap_button.button_pressed = false
		interface.bottom_button_output.button_pressed = false
	)
	
	initial()
	steps_010_intro()
	adding_a_camera()
	lights()
	adding_a_light()
	materials()
	pass


func initial():
	auto_next()
	complete_step()


##Adding a mesh instance to the scene
func steps_010_intro():
	
	
	context_set_3d()
	scene_open("res://main.tscn")
	
	bubble_set_title("")
	bubble_add_text([bbcode_wrap_font_size("[center]Intro to 3D[/center]", 32)])
	bubble_add_text(
		["[center]In addition to Godot's 2D engine is a powerful 3D engine.[/center]",
		"[center]Many of the nodes we've used so far have 3D [b]counterparts[/b]. This allows us to transfer our 2D knowledge over to the 3D side of the engine easily, without having to learn too many new nodes. [/center]"]
	)
	
	bubble_add_text([
		"[center]This tour was created using the GDQuest Godot Tours framework[/center]"
	]
	)
	complete_step()
	
	highlight_controls([interface.context_switcher], true)
	bubble_add_text([
		"[center]In the context switcher, we've mainly looked at the 2D view, but in this project we'll be focusing on 3D.[/center]"
		])
	
	complete_step()
	
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	highlight_controls([interface.scene_tree], true)
	highlight_controls([interface.main_screen], true)
	bubble_add_text([
		"[center]Over in the scene tree is an empty 3D scene with a Node3D as its root. Let's go ahead and add a new node to the scene, a [b]MeshInstance3D[/b]"
	])
	
	bubble_add_task("Add a MeshInstance3D to the scene",
	1,
	func add_a_mesh(task: Task) -> int:
		main_root = EditorInterface.get_edited_scene_root()
		var new_child = EditorInterface.get_edited_scene_root().get_child(0)
		if new_child == null:
			return 0
		elif new_child is MeshInstance3D == false:
			return 0
		elif new_child is MeshInstance3D:
			return 1
		else: return 0
		)
	
	complete_step()
	
	
	bubble_add_text([
		"[center]Great! We've added a mesh to our scene. A mesh, or a model, is what we use to represent objects in 3D. Let's set the mesh instance's Mesh attribute to the BoxMesh in the MeshInstance3D's inspector[/center]",
		"[center]And, while we're at it, let's change the node's name to 'box'[/center]"
	])
	
	highlight_controls([interface.inspector_dock, interface.scene_tree], true)
	bubble_add_task("Set the MeshInstance3D's mesh to BoxMesh in the inspector",
	1,
	func set_to_boxmesh(task: Task) -> int:
		var mesh = EditorInterface.get_edited_scene_root().get_child(0)
		if mesh.mesh is BoxMesh:
			return 1
		else:
			return 0
		
		)
	
	bubble_add_task("Change MeshInstance3D's name to 'box'",
	1,
	func change_box_name(task: Task)-> int:
		var mesh = EditorInterface.get_edited_scene_root().get_child(0)
		if mesh.name == "box":
			return 1
		else:
			return 0
		
		)
	
	
	
	complete_step()
	
	highlight_controls([interface.run_bar_play_button], true)
	bubble_add_text(["[center]Go ahead and run your scene, what do you see?[/center]"])
	
	complete_step()


func adding_a_camera():
	var cam
	bubble_add_text(["[center]A gray screen, correct? Don't worry, nothing is broken. This is because, unlike in 2D, 3D scenes require a Camera3D to view the world. Let's add a Camera3D to the scene[/center]"])
	highlight_controls([interface.scene_tree], true)
	
	bubble_add_task("Add a Camera3D to the scene, make sure it is a child of 'main' not 'box'",
	1,
	func add_cam(task: Task)->int:
		
		if main_root.get_child_count() > 1:
			cam = main_root.get_child(1)
			if cam is Camera3D:
				return 1
			elif cam == null:
				return 0
			else:
				return 0
		else:
			return 0
		
		)
	
	
	complete_step()
	
	
	bubble_add_text(["[center]Our camera spawned inside of our box, let's pull the camera out of the box. We can tell which way the camera is looking from the pyramid being projected from its front.[/center]"])
	highlight_controls([interface.main_screen, interface.scene_tree, interface.inspector_dock])
	
	
	
	bubble_add_task("Move the camera at least [b]3 meters[/b] away from the box on the Z axis, check the inspector to make sure it's moving in the right direction.",
	1,
	func move_cam(task: Task) -> int:
		if main_root.get_child_count() > 1:
			cam = main_root.get_child(1)
			if cam.position.z > 3:
				return 1
			else:
				return 0
		else:
			return 0
		)
	
	
	complete_step()
	
	
	bubble_add_text(["[center]Great! Let's run the scene again![/center]"])
	highlight_controls([interface.run_bar_play_button], true)
	
	complete_step()
	
	
	bubble_add_text(["[center]Ah, there's our box! But it's a little bit dark. We can brighten the scene up by adding a light to it. We do this using one of three lighting nodes:[/center]",
	"[center][b]DirectionalLight3D[/b][/center]",
	"[center][b]OmniLight3D[/b][/center]",
	"[center][b]SpotLight3D[/b][/center]",
	"[center]Let's take a closer look at them.[/center]"
	])
	
	
	complete_step()
	
	pass


func lights():
	
	bubble_set_title("")
	
	scene_open("res://lighting.tscn")
	
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_LEFT, 16.0)
	
	highlight_controls([interface.main_screen, interface.scene_tree])
	bubble_add_text(["[center]This scene already has some lights set up for us, let's check them out[/center]"])
	
	bubble_add_task("Enable the DirectionalLight3D by changing its visibility, feel free to move and rotate the light after you enable it", 1,
	func enable_direct(task: Task) -> int:
		var light = EditorInterface.get_edited_scene_root().get_child(1)
		if light.visible == true:
			next()
			return 1
		else:
			return 0
		
		)
	
	complete_step()
	
	highlight_controls([interface.main_screen, interface.scene_tree])
	
	bubble_add_text(["[center][b]DirectionalLight3D[/b] works like the sun, shining a light from the distance.[/center]"])
	
	bubble_add_task("Disable the DirectionalLight3D. Enable the OmniLight3D by changing its visibility, feel free to move and rotate the light", 1,
	func enable_direct(task: Task) -> int:
		var light1 = EditorInterface.get_edited_scene_root().get_child(1)
		var light2 = EditorInterface.get_edited_scene_root().get_child(2)
		if light1.visible == false and light2.visible == true:
			next()
			return 1
		else:
			return 0
		
		)
	
	
	
	complete_step()
	
	
	highlight_controls([interface.main_screen, interface.scene_tree])
	bubble_add_text(["[center][b]OmniLight3D[/b] works like a lightbulb, shining a light from a single point.[/center]"])

	bubble_add_task("Disable the OmniLight3D. Enable the SpotLight3D by changing its visibility, feel free to move and rotate the light", 1,
	func enable_direct(task: Task) -> int:
		var light1 = EditorInterface.get_edited_scene_root().get_child(2)
		var light2 = EditorInterface.get_edited_scene_root().get_child(3)
		if light1.visible == false and light2.visible == true:
			next()
			return 1
		else:
			return 0
		
		)
	
	complete_step()
	
	highlight_controls([interface.main_screen, interface.scene_tree])
	bubble_add_text(["[center][b]SpotLight3D[/b] works like a flashlight, shining a light in a specific direction from a point.[/center]"])
	bubble_add_text(["[center]Let's return to our main scene and add a light to it![/center]"])
	
	complete_step()
	
	
func adding_a_light():
	scene_open("res://main.tscn")
	
	highlight_controls([interface.main_screen, interface.scene_tree])
	
	
	bubble_add_task("Add a new light to the scene as a child of main that acts like the sun", 1,
	func add_light(task: Task) -> int:
		var new_light = EditorInterface.get_edited_scene_root().get_child(2)
		if new_light is DirectionalLight3D:
			return 1
		else:
			return 0
		)
	
	bubble_add_task("Move the light at least 2 meters above the cube", 1,
	func add_light(task: Task) -> int:
		var new_light = EditorInterface.get_edited_scene_root().get_child(2)
		if new_light.position.y > 2:
			return 1
		else:
			return 0
		)
	
	
	bubble_add_task("Change the x rotation of the light so that it is pointing downward", 1,
	func add_light(task: Task) -> int:
		var new_light = EditorInterface.get_edited_scene_root().get_child(2)
		if new_light.rotation_degrees.x < -80:
			return 1
		else:
			return 0
		)
	
	complete_step()



func materials():
	
	highlight_controls([interface.run_bar_play_button])
	bubble_add_text(["[center]Great! Now our scene has lighting, go ahead and run the game to see it in action[/center]"])
	
	complete_step()
	
	
	
	bubble_add_text(["[center]Now that we can see our cube, let's give it some color. Unlike working in 2D where we have flat textures, in 3D we'll use something called a 'Material'. Think of this like wrapping paper that is wrapped [b]around[/b] the mesh[/center]",
	"[center]We can add a new material by clicking on our box in the scene tree, going to the inspector, clicking on the picture of the Mesh, and adding a new StandardMaterial3D to the empty 'Material' property[/center]"])
	
	highlight_controls([interface.main_screen, interface.scene_tree, interface.inspector_dock])
	
	bubble_add_task("Add a new material to the box. Make it your favorite color by editing the material's Albedo (hint: Open the material in the same way that you opened the mesh)", 1,
	func apply_mat(task: Task) -> int:
		var box = EditorInterface.get_edited_scene_root().get_child(0)
		var box_color = box.mesh.material.albedo_color
		
		if box.mesh.material == null and box.mesh.material.albedo_color != box_color:
			return 0
		else:
			return 1
		
		
		)
	
	complete_step()
	
	bubble_add_text(["[center]Last thing, add your name to this assignment by adding a new Node3D to the scene and renaming it[/center]"])
	
	
	highlight_controls([interface.scene_tree])
	bubble_add_task("Add a new Node3D to the scene and change it's name to be your name", 1,
	func add_name(task: Task) -> int:
		var named_node = EditorInterface.get_edited_scene_root().get_child(3)
		
		if named_node is Node3D and named_node.name != "Node3D":
			return 1
		else:
			return 0
		)
	complete_step()
