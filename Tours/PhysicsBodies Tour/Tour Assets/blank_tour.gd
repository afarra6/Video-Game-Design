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
	static_bodies()
	adding_platforms()
	rigidbodies()
	character_bodies()
	quiz()
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
#region Title

##A title bubble, detail what the subject of the tour is here.
func title():
	
	
	context_set_3d()
	scene_open("res://main.tscn")
	
	bubble_set_title("")
	bubble_add_text([bbcode_wrap_font_size("[center]PhysicsBodies[/center]", 32)])
	bubble_add_text(
		["[center]In Godot, the nodes that interact with physics are called [b]PhysicsBodies[/b][/center]",
		"[center]The PhysicsBodies nodes can be used to make characters, walls, projecticles, and so much more. \
However, we need to use the right [b]PhysicsBody[/b] for each job. In this tour we'll go over the three main \
[b]PhysicsBodies[/b]:[/center]",
"[center][b]StaticBody2D[/b][center]",
"[center][b]RigidBody2D[/b][center]",
"[center]and [b]CharacterBody2D[/b][center]"]
	)
	complete_step()

#endregion


#region StaticBodies part 1: Adding them to a prexisting scene and making a platform


func static_bodies():
	
	
	bubble_set_title("StaticBody2D")
	bubble_add_text([bbcode_wrap_font_size("[center][/center]", 32)])
	bubble_add_text(
		["[center][b]StaticBody2D[/b] is the simplest of all the [b]PhysicsBodies[/b]. This body is used for \
objects that are stationary such as walls, floors, platforms, and ceilings. [b]StaticBodies[/b] are an important \
part of many game, often being used to build the level itself. Let's practice making a few [b]StaticBodies[/b][/center]",
]
	)
	complete_step()
	
	scene_open("res://Tour Scenes/static_bodies.tscn")
	context_set_2d()
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.main_screen, Bubble.At.BOTTOM_RIGHT)
	bubble_add_text([bbcode_wrap_font_size("[center]Creating a PhysicsBody[/center]", 32)])
	bubble_add_text(
		["[center]Let's start by adding a new [b]StaticBody2D[/b] to this scene.[/center]",
]
	)
	
	bubble_add_task("Create a new [b]StaticBody2D[/b] node and name it 'Ground'", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sb = root.find_child("Ground")
		
		if sb is StaticBody2D:
			return 1
		return 0
	)
	
	complete_step()
	
	highlight_controls([interface.scene_dock])
	
	bubble_add_text([
		"[center]Great, a new [b]StaticBody[/b]! However, did you notice the warning on our newly created node? \
This warning tells us that our [b]PhysicsBody[/b] is missing an important piece, a [b]CollisionShape2D[/b]. \
While the [b]StaticBody2D[/b] tells Godot how the [b]PhysicsBody[/b] will act, the [b]CollisionShape2D[/b] \
tells Godot what the actual [i]shape[/i] of the [b]PhysicsBody[/b] is. Let's go ahead and add a [b]CollisionShape2D[/b] \
as a child of our [b]StaticBody2D[/b].[/center]"
	])
	
	bubble_add_task("Create a new [b]CollisionShape2D[/b] node as a child of 'Ground'", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sb = root.find_child("Ground")
		for i in sb.get_children():
			
			if i is CollisionShape2D:
				return 1
			else:
				return 0
		
		
		return 0
	)
	
	complete_step()
	
	
	
	highlight_controls([interface.scene_dock, interface.inspector_dock, interface.main_screen])
	
	bubble_add_text([
		"[center]We'll also need to define the actual shape of the [b]CollisionShape2D[/b], we'll do this \
in the inspector. Click on the [b]CollisionShape2D[/b] in the [b]SceneTree[/b] and then find the [b]shape[/b] property \
in the inspector. From here, set its shape to a [b]RectangleShape2D[/b]. We can then edit the shape to align with the purple ground.[/center]"
	])
	
	bubble_add_task("Set the [b]CollisionShape2D[/b]'s shape to a [b]RectangleShape2D[/b] and align it with the ground", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sb = root.find_child("Ground")
		var cs = sb.get_child(0)
		
		if cs.shape is RectangleShape2D and cs.shape.size.x > 1050 and cs.position.y > 500:
			return 1
		
		
		return 0
	)
	
	complete_step()
	
	
	
	highlight_controls([interface.scene_dock])
	
	bubble_add_text([
		"[center]Great! Now let's focus on the 3 pillars. While we could use one [b]StaticBody2D[/b] per pillar \
we can also use just one [b]StaticBody2D[/b] with 3 [b]CollisionShape2D[/b]'s, one for each pillar. Let's start by making \
a new [b]StaticBody2D[/b] and naming it 'Pillars'.[/center]"
	])
	
	bubble_add_task("Create a new [b]StaticBody2D[/b] and name it 'Pillars'. Make sure it is a child of the [b]root[/b] node, [b]StaticBodies[/b].", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sb = root.find_child("Pillars")
		
		
		if sb is StaticBody2D:
			return 1
		
		
		return 0
	)
	
	complete_step()
	
	
	
	bubble_move_and_anchor(interface.main_screen, Bubble.At.CENTER)
	highlight_controls([interface.scene_dock, interface.inspector_dock])
	
	bubble_add_text([
		"[center]Now let's add 3 [b]CollisionShape2D[/b]'s as children of [b]Pillars[/b]. Name them as follows:[/center]",
		"[b]Pillar1[/b]",
		"[b]Pillar2[/b]",
		"[b]Pillar3[/b]",
		"[center]Give each [b]CollisionShape2D[/b] a [b]RectangleShape2D[/b] in the inspector."
	])
	
	bubble_add_task("Rename a [b]CollisionShape2D[/b] to [b]Pillar1[/b] and give it a [b]RectangleShape2D[/b].", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sb = root.find_child("Pillars")
		var p1 = sb.find_child("Pillar1")
		var p2 = sb.find_child("Pillar2")
		var p3 = sb.find_child("Pillar3")
		
		if p1 is CollisionShape2D and p1.shape is RectangleShape2D:
			return 1
		
		
		return 0
	)
	
	bubble_add_task("Rename a [b]CollisionShape2D[/b] to [b]Pillar2[/b] and give it a [b]RectangleShape2D[/b].", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sb = root.find_child("Pillars")
		
		var p2 = sb.find_child("Pillar2")
		
		
		if p2 is CollisionShape2D and p2.shape is RectangleShape2D:
			return 1
		
		
		return 0
	)
	
	bubble_add_task("Rename a [b]CollisionShape2D[/b] to [b]Pillar3[/b] and give it a [b]RectangleShape2D[/b].", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sb = root.find_child("Pillars")
		var p3 = sb.find_child("Pillar3")
		
		if p3 is CollisionShape2D and p3.shape is RectangleShape2D:
			return 1
		
		
		return 0
	)
	complete_step()
	
	
	bubble_move_and_anchor(interface.main_screen, Bubble.At.BOTTOM_RIGHT)
	highlight_controls([interface.scene_dock, interface.main_screen])
	
	bubble_add_text([
		"[center]Go ahead and align the [b]CollisionShape2Ds[/b] with the [b]tops[/b] of the pillars. \
There is no need to align the shapes with the entire pillar, as we would only want other [b]PhysicsBodies[/b] \
to interact with the very top of the pillar, not the entirety of it. Make sure to place the shapes on the right \
pillars counting from left to right![/center]"
	])
	var pillar_area = 180 * 50
	bubble_add_task("Align [b]Pillar1[/b] with the top of the left pillar.", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sb = root.find_child("Pillars")
		var p1 = sb.find_child("Pillar1")
		
		
		if p1.position.y > 300 and p1.position.x < 200 and (p1.shape.size.x * p1.shape.size.y) < pillar_area:
			return 1
		
		
		return 0
	)
	
	bubble_add_task("Align [b]Pillar2[/b] with the top of the center pillar.", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sb = root.find_child("Pillars")
		
		var p2 = sb.find_child("Pillar2")
		
		
		if p2.position.y < 300 and p2.position.x < 600 and p2.position.x > 500 and (p2.shape.size.x * p2.shape.size.y) < pillar_area:
			return 1
		
		
		return 0
	)
	
	bubble_add_task("Align [b]Pillar3[/b] with the top of the right pillar.", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sb = root.find_child("Pillars")
		var p3 = sb.find_child("Pillar3")
		
		if p3.position.y > 300 and p3.position.x > 800 and (p3.shape.size.x * p3.shape.size.y) < pillar_area:
			return 1
		
		
		return 0
	)
	complete_step()
	
	
	
	
	bubble_add_text([
"[center]Great, Now all of our surfaces have a [b]StaticBody2D[/b]![/center]",
"[center]However, we'll often not be attaching a [b]PhysicsBody[/b] to a prexisting image like we have here. \
Instead, we'll often add a [b]Sprite2D[/b] as a child of the [b]PhysicsBody[/b] itself! Let's practice this by creating a Platform [b]Scene[/b][/center]"
	])
	
	
	complete_step()
	
	highlight_controls([interface.main_screen_tabs, interface.main_screen, interface.scene_dock])
	bubble_move_and_anchor(interface.main_screen, Bubble.At.BOTTOM_RIGHT)
	bubble_add_text([
"[center]Go ahead and make a new [b]Scene[/b] by clicking the [b]plus[/b] button at the top of the main screen. \
(This should be by the other [b]Scene[/b] tabs)[/center]",
"[center]Next, in the [b]SceneTree[/b] click the 'Other Node' button and set the [b]scene root[/b] to be a [b]StaticBody2D[/b]. \
Rename this node 'Platform'. Don't forget to save your scene after by pressing [b]ctrl+s[/b].[/center]"
	])
	
	
	bubble_add_task("Create a new scene, make the root node a [b]StaticBody2D[/b] and rename it 'Platform'.", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root is StaticBody2D and root.name == "Platform":
			return 1
		
		
		return 0
	)
	
	complete_step()
	
	bubble_move_and_anchor(interface.main_screen, Bubble.At.CENTER)
	highlight_controls([interface.scene_dock, interface.filesystem_dock, interface.inspector_dock])
	
	bubble_add_text([
"[center]Unlike before where there was already an image, here we'll need to use a [b]Sprite2D[/b] to give our \
[b]StaticBody2D[/b] a graphic. Go ahead and add [b]Sprite2D[/b] as a child of 'Platform'. Then, set the [b]texture[/b] \
to the 'grassy_platform.png' provided with this tour. A rocky platform with grass on top should apper. We should also make sure \
not to move the [b]Sprite2D[/b], keeping it at origin. If you accidentally move the sprite you can reset its positon from the \
[b]transform[/b] in the the [b]inspector[/b].[/center]"
	])
	
	bubble_add_task("Add a Sprite2D to the platform and give it the 'grassy_platform.png'.", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sprite = root.find_child("Sprite2D")
		print(sprite.texture.load_path)
		if sprite is Sprite2D and sprite.texture.load_path == "res://.godot/imported/grassy_platform.png-e30fabfc6edfdc03ecf45806fd3de5ad.ctex":
			return 1
		
		
		return 0
	)
	
	
	
	complete_step()
	
	
	bubble_move_and_anchor(interface.main_screen, Bubble.At.BOTTOM_RIGHT)
	highlight_controls([interface.main_screen, interface.inspector_dock, interface.scene_dock])
	
	bubble_add_text([
"[center]Just like before, we'll have to add a [b]CollisionShape2D[/b] to give the [b]StaticBody2D[/b] an actual shape. Be careful though, \
in order for [b]StaticBody2D[/b] to recognize the [b]CollisionShape2D[/b] the [b]CollisionShape2D[/b] must be a [b]child[/b] of [b]StaticBody2D[/b] \
meaning there should be no nodes in between them. This means the [b]Sprite2D[/b] and the [b]CollisionShape2D[/b] will be [b]siblings[/b]. \
Here we'll give the [b]CollisionShape2D[/b] a [b]RectangleShape2D[/b]. However, we notice that the shape of the platform is \
not rectangular. In this case we'll need to make a compromise about where we place the rectangle. Go ahead and make the [b]CollisionShape2D[/b] \
The width of the platform, but only about half the height. Then place it so the top of the [b]CollisionShape2D[/b] is about \
halfway up the green portion of the platform image.[/center]"
	])
	
	
	bubble_add_task("Add a [b]CollisionShape2D[/b] as a child of platform.", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var cs = root.find_child("CollisionShape2D")
		
		if cs is CollisionShape2D:
			return 1
		
		
		return 0
	)
	
	
	bubble_add_task("Give the [b]CollisionShape2D[/b] a [b]RectangleShape2D[/b] in the inspector.", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var cs = root.find_child("CollisionShape2D")
		
		if cs.shape is RectangleShape2D:
			return 1
		
		
		return 0
	)
	
	
	bubble_add_task("Align the [b]CollisionShape2D[/b] with the platform image.", 1,
	func check_task(task:Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var cs = root.find_child("CollisionShape2D")
		
		if cs.shape.size.x > 250 and (cs.position.y < 100 and cs.position.y > -200):
			return 1
		
		
		return 0
	)
	
	
	complete_step()
	


#endregion

#region StaticBodies part 2: Adding a StaticBody scene to a main scene.

func adding_platforms():
	
	
	
	highlight_controls([interface.main_screen_tabs, interface.filesystem_dock])
	
	bubble_add_text([
"Now that we've set up our platform we can add it to our 'static_bodies' scene! Go ahead and open the 'static_bodies' \
scene by clicking the 'static_bodies' tab or double clicking the 'static_bodies.tscn' file from the file system."
	])
	
	
	bubble_add_task("Open the 'static_bodies' scene", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.name == "StaticBodies":
			return 1
		
		return 0
	)
	
	
	complete_step()
	
	bubble_move_and_anchor(interface.inspector_dock, Bubble.At.BOTTOM_CENTER, 16.0, Vector2(-200, 0))
	highlight_controls([interface.main_screen, interface.scene_dock, interface.filesystem_dock])
	
	bubble_add_text([
"We can easily add some platforms to our scene by dragging the 'platform.tscn' file (if that is what you named your platform scene), from the file system into this scene. Go ahead and try it!"
	])
	
	bubble_add_task("Add 3 platforms to the 'static_bodies' scene.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.find_child("Platform") is StaticBody2D and root.find_child("Platform2") is StaticBody2D and root.find_child("Platform3") is StaticBody2D:
			return 1
		
		return 0
	)
	
	complete_step()
	
	
	highlight_controls([interface.main_screen_tabs, interface.main_screen])
	bubble_add_text([
"Woah, those platforms are way too big. To fix this we'll need to edit the 'platform' scene itself. Don't worry, any changes we make to the scene will happen to these copies (called instances) as well! Let's jump over to the platform scene now."
	])
	
	bubble_add_task("Open the 'platform' scene", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.name == "Platform":
			return 1
		
		return 0
	)
	
	complete_step()
	
	highlight_controls([interface.main_screen, interface.scene_dock, interface.inspector_dock])
	bubble_move_and_anchor(interface.main_screen, Bubble.At.BOTTOM_CENTER)
	
	bubble_add_text([
"We can change the size of this platform by using the [b]scale[/b] property in the inspector. However, Godot does not like \
when a [b]PhysicsBody[/b]s scale is changed directly. This means we must change the scale of the [b]Sprite2D[/b] and the [b]CollisionShape2D[/b] \
instead. You may also need to adjust their alignment after scaling them. Let's go ahead and do that."
	])
	
	bubble_add_task("Change the [b]Sprite2D[/b]'s scale to be 0.4, make sure this is for both x and y!", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sprite = root.find_child("Sprite2D")
		if sprite.scale.x <= 0.6:
			return 1
		
		return 0
	)
	
	bubble_add_task("Change the [b]CollisionShape2D[/b]'s scale to be 0.4, make sure this is for both x and y!", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var cs = root.find_child("CollisionShape2D")
		if cs.scale.y <= 0.6:
			return 1
		
		return 0
	)
	
	
	complete_step()
	
	
	highlight_controls([interface.main_screen_tabs])
	
	bubble_add_text([
"Make sure to save by pressing [b]ctrl+s[/b] and let's jump back over to the 'static_bodies' scene!"
	])
	
	bubble_add_task("Open the 'static_bodies' scene", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.name == "StaticBodies":
			return 1
		
		return 0
	)
	
	complete_step()
	
	highlight_controls([interface.main_screen, interface.scene_dock])
	bubble_move_and_anchor(interface.main_screen, Bubble.At.BOTTOM_RIGHT)
	bubble_add_text([
"Much better! Now our platforms fit the size of the level much better. Let's go ahead and place them in our scene. We'll put \
the platform named 'Platform' between the first and second pillars and the other two platforms between the center and right pillars."
	])
	
	
	
	bubble_add_task("Place the platform named 'Platform' between the left and center pillars.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var pf = root.find_child("Platform")
		
		if (pf.position.x > 250 and pf.position.x < 450) and (pf.position.y > 300 and pf.position.y < 360):
			return 1
		
		return 0
	)
	
	bubble_add_task("Place the other platforms named 'Platform2' and 'Platform3' between the center and right pillars. Make sure they don't overlap.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var pf2 = root.find_child("Platform2")
		var pf3 = root.find_child("Platform3")
		if (pf2.position.x > 640 and pf2.position.x < 920) and (pf2.position.y > 260 and pf2.position.y < 400) and (pf3.position.x > 640 and pf3.position.x < 920) and (pf3.position.y > 260 and pf3.position.y < 400):
			return 1
		
		return 0
	)
	
	
	complete_step()
	pass

#endregion

#region Rigidbodies

func rigidbodies():
	
	
	bubble_set_title("")
	
	bubble_add_text([
"Now that we have a well built play area, let's add some moving components! While [b]StaticBodies[/b] are stationary, [b]CharacterBodies[/b] and [b]RigidBodies[/b] are used for \
elements that move. In general, we'll use [b]CharacterBody2D[/b] when we want direct control over an entity and [b]RigidBody2D[/b] when we want \
physics to dictate the movement of the body. In this next section we'll focus on [b]RigidBodies[/b] specifically."
	])
	
	complete_step()
	
	
	highlight_controls([interface.main_screen_tabs, interface.scene_dock])
	bubble_set_title("RigidBodies")
	
	bubble_add_text([
"[b]RigidBodies[/b] are useful for anything that we want to move but that we don't want or need to control directly. This could be anything from a \
cannonball an enemy fires off to falling boulders or a collectible that scatters when an enemy is defeated. Let's go ahead and make a new [b]RigidBody[/b] scene!"
	])
	
	
	bubble_add_task("Make a new scene, set the root node to be a [b]RigidBody2D[/b] and name it [b]Boulder[/b].", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root is RigidBody2D and root.name == "Boulder":
			return 1
		return 0
	)
	
	complete_step()
	
	highlight_controls([interface.scene_dock])
	
	bubble_add_text([
"Just like the [b]StaticBody[/b] our [b]RigidBody[/b] needs a [b]CollisionShape[/b] to define the space it takes up in the world.
We'll also want to add a graphic to show our player what that shape looks like. Go ahead and add a [b]CollisionShape2D[/b] and a [b]Sprite2D[/b] just like we did in the 'platform' scene"
	])
	
	bubble_add_task("Add a [b]CollisionShape2D[/b] as a child of 'Boulder'.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var cs = root.find_child("CollisionShape2D")
		
		if cs is CollisionShape2D:
			return 1
		return 0
	)
	bubble_add_task("Add a [b]Sprite2D[/b] as a child of 'Boulder'.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		var sprite = root.find_child("Sprite2D")
		if sprite is Sprite2D:
			return 1
		return 0
	)
	
	complete_step()
	
	highlight_controls([interface.scene_dock, interface.filesystem_dock, interface.inspector_dock])
	
	bubble_add_text([
"Great! Now, in order to see what kind of [b]Shape[/b] to use we should add an image to our [b]Sprite2D[/b]. Go ahead and add the [b]boulder.png[/b] image to the sprite. This image is too big so let's also reset its scale."
	])
	
	bubble_add_task("Add the [b]boulder.png[/b] image to the [b]texture[/b] property of the [b]Sprite2D[/b] in the inspector, then set its scale to 0.1 under [b]Transform[/b] in the inspector.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sprite = root.find_child("Sprite2D")
		
		
		
		if sprite.texture is CompressedTexture2D and sprite.scale.x <= 0.031 and sprite.scale.y <= 0.031:
			
			return 1
		
		return 0
	)
	
	complete_step()
	
	highlight_controls([interface.main_screen, interface.scene_dock, interface.inspector_dock])
	
	bubble_add_text([
"The [b]RectangleShape2D[/b] we've been using so far doesn't seem very appropriate for this image. Let's use a [b]CircleShape2D[/b] instead. Resize it to align with the boulder image."
	])
	
	bubble_add_task("Set the [b]Shape[/b] property of the [b]CollisionShape2D[/b] to a [b]CircleShape2D[/b] and resize it to align with the boulder image.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var cs = root.find_child("CollisionShape2D")
		var shape = cs.shape
		
		if shape is CircleShape2D and shape.radius >= 15 and shape.radius <= 20:
			
			return 1
		
		return 0
	)
	
	complete_step()
	
	highlight_controls([interface.main_screen_tabs])
	bubble_add_text([
"Let's head back over to the 'static_bodies' scene and add our boulders."
	])
	
	bubble_add_task("Open the 'static_bodies' scene.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.name == "StaticBodies":
			return 1
		
		
		return 0
		
	)
	
	complete_step()
	
	highlight_controls([interface.main_screen, interface.filesystem_dock])
	
	bubble_add_text([
"In the same way that we added our platforms, let's add 3 boulders. Place them wherever you would like."
	])
	
	bubble_add_task("Add 3 boulders to your scene by dragging the 'boulder.tscn' file into the scene.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var b1 = root.find_child("Boulder")
		var b2 = root.find_child("Boulder2")
		var b3 = root.find_child("Boulder3")
		
		if b1 is RigidBody2D and b2 is RigidBody2D and b3 is RigidBody2D:
			
			return 1
		
		return 0
	)
	
	
	complete_step()
	
	highlight_controls([interface.run_bar_play_current_button])
	
	bubble_add_text([
"In order to see our [b]RigidBodies[/b] move we'll have to run our game. Go ahead and run the current scene. If we've done everything correctly we should see the [b]RigidBodies[/b] move."
	])
	
	bubble_add_task_press_button(interface.run_bar_play_current_button)
	
	complete_step()
	
	

#endregion


func character_bodies():
	
	highlight_controls([interface.main_screen_tabs, interface.scene_dock])
	
	bubble_add_text([
"Great! Now we have some moving parts! But, sometimes we want to control something, like a player or enemy. For these we'll use [b]CharacterBody2D[/b]. Let's go ahead and make a new scene and make the root at [b]ChacterBody2D[/b] and rename it 'Player'."
	])
	
	bubble_add_task("Make a new scene, make the root node a [b]CharacterBody2D[/b], and rename it [b]'Player'[/b]. Remember to save by pressing [b]ctrl+s[/b] after.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root is CharacterBody2D and root.name == "Player":
			return 1
		
		
		
		return 0
	)
	
	complete_step()
	
	highlight_controls([interface.scene_dock])
	
	
	bubble_add_text([
"Just like our other [b]PhysicsBodies[/b] we'll need to add a [b]CollisionShape2D[/b] and a [b]Sprite2D[/b]. Go ahead and do that now."
	])
	
	bubble_add_task("Add a [b]CollisionShape2D[/b] as a child of 'Player'.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var cs = root.find_child("CollisionShape2D")
		if cs is CollisionShape2D:
			return 1
		
		
		
		return 0
	)
	
	bubble_add_task("Add a [b]Sprite2D[/b] as a child of 'Player'.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sprite = root.find_child("Sprite2D")
		if sprite is Sprite2D:
			return 1
		
		
		
		return 0
	)
	
	complete_step()
	
	#Add text and task about assigning images, and scripts. Use a CapsuleShape2D for CollisionShape.
	highlight_controls([interface.filesystem_dock, interface.inspector_dock, interface.scene_dock, interface.main_screen])
	
	bubble_add_text([
"[center]Go ahead an set the [b]Sprite2D[/b]'s texture to the 'character_sprite.png' from the [b]FileSystem[/b]. Then set the [b]CollisionShape2D[/b]'s shape to a [b]CapsuleShape2D[/b] and align it with the 'character_sprite.png' image.[/center]"
	])
	
	
	bubble_add_task("Set the [b]Sprite2D[/b]'s texture to the 'character_sprite.png'. Also, increase the scale of the [b]Sprite2D[/b] to 2.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sprite = root.find_child("Sprite2D")
		if sprite is Sprite2D and sprite.texture and sprite.scale.x == 2:
			return 1
		
		
		
		return 0
	)
	
	
	
	bubble_add_task("Set the [b]CollisionShape2D[/b]'s shape to 'CapsuleShape2D'. Align it with the sprite as a best as possible, you'll probably have to compromise (that's ok!).", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var sprite = root.find_child("CollisionShape2D")
		if sprite is CollisionShape2D and sprite.shape is CapsuleShape2D:
			return 1
		
		
		
		return 0
	)
	complete_step()
	
	
	highlight_controls([interface.main_screen_tabs, interface.main_screen, interface.scene_dock, interface.run_bar_play_current_button, interface.filesystem_dock])
	
	bubble_add_text([
"[center]Great! Let's head back over to the 'static_bodies' scene and add our player to it by dragging the player.tscn file into the static_bodies scene. Then let's run our game![/center]"
	])
	
	
	bubble_add_task("Go back to the 'static_bodies' scene.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.name == "StaticBodies":
			return 1
		return 0
	)
	
	bubble_add_task("Add the player to the scene. Make sure it is a child of the root node 'StaticBodies'!", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var player = root.find_child("Player")
		if player is CharacterBody2D:
			return 1
		return 0
	)
	
	bubble_add_task_press_button(interface.run_bar_play_current_button)
	complete_step()
	
	highlight_controls([interface.filesystem_dock, interface.main_screen_tabs, interface.scene_dock])
	
	bubble_add_text([
"[center]You'll notice that our player doesn't move. This is because, unlike [b]RigidBodies[/b], to move a [b]CharacterBody[/b] we need to attach a script to it. If you look in the [b]FileSystem[/b] you'll notice a file called 'player.gd', this is a script! Let's go back to the Player scene and add this script by dragging and dropping it on the root node of the scene.[/center]"
	])
	
	bubble_add_task("Go back to the 'player' scene.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.name == "Player":
			return 1
		return 0
	)
	
	
	bubble_add_task("Drag and drop the 'player.gd' script onto the root node.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.script:
			return 1
		return 0
	)
	
	
	
	complete_step()
	
	highlight_controls([interface.main_screen_tabs, interface.run_bar_play_current_button])
	
	
	bubble_add_text([
"[center]Now that we've added our script, let's return to the 'static_bodies' scene and run our game.[/center]"
	])
	
	bubble_add_task("Go back to the 'static_bodies' scene.", 1,
	func new_task(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		
		if root.name == "StaticBodies":
			return 1
		return 0
	)
	
	
	bubble_add_task_press_button(interface.run_bar_play_current_button)
	
	complete_step()
	pass


func quiz():
	
	highlight_controls([interface.main_screen_tabs, interface.inspector_dock, interface.scene_dock])
	
	bubble_add_text([
"[center]Now that we've learned how to make and use [b]PhysicsBodies[/b] let's take a quick quiz. Go ahead and open the 'main' scene and click on the root node to start. Answer the questions in the inspector. Make sure to hit 'enter' to submit your answer.[/center]"
	])
	
	bubble_add_task("Change the scene to 'main'", 1,
	func change(task: Task) -> int:
		if EditorInterface.get_edited_scene_root() is Node3D:
			return 1
		
		return 0
		)
	
	bubble_add_task("Question 1: What [b]PhysicsBody[/b] is used for objects that do not move", 1,
	func answer(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var answer = root.question_1
		
		if answer == "StaticBody2D" or answer == "StaticBody":
			return 1
		return 0
		)
	
	
	bubble_add_task("Question 2: What kind of Node is added to all [b]PhysicsBodies[/b] that allows them to interact with the game world.", 1,
	func answer(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var answer = root.question_2
		
		if answer == "CollisionShape2D" or answer == "CollisionShape":
			return 1
		return 0
		)
	
	
	bubble_add_task("Question 3: What type of Node is used to show what a [b]PhysicsBody[/b] looks like.", 1,
	func answer(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var answer = root.question_3
		
		if answer == "Sprite2D" or answer == "Sprite":
			return 1
		return 0
		)
	
	
	bubble_add_task("Question 4: What needs to be added to a [b]CharacterBody2D[/b] to allow it to move?", 1,
	func answer(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var answer = root.question_4
		
		if answer == "Script" or answer == "script" or answer == "a script" or answer == "a Script" or answer == "A script" or answer == "A Script":
			return 1
		return 0
		)
	
	bubble_add_task("Question 5: If you need to change the size of a [b]PhysicsBody[/b] you should change the size or scale of it's children instead of the [b]PhysicsBody[/b] itself. True or False", 1,
	func answer(task: Task) -> int:
		var root = EditorInterface.get_edited_scene_root()
		var answer = root.question_5
		
		if answer == "true" or answer == "True" or answer == "t" or answer == "T":
			return 1
		return 0
		)
	
	
	
	
	complete_step()
