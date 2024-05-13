extends "res://addons/godot_tours/tour.gd"

const VARIABLES_PIC := preload("res://addons/godot_tours/assets/icons/lock.svg")
const VAR_EXAM_SCRIPT := preload("res://var_examples.gd")
const EXP_VAR_SCRIPT := preload("res://export variables.gd")

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
	#declaring_variables()
	#quiz_one()
	export_vars()
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
#region Declaring Vars

##A title bubble, detail what the subject of the tour is here.
func title():
	
	
	context_set_script()
	scene_open("res://main.tscn")
	
	bubble_set_title("")
	bubble_add_text([bbcode_wrap_font_size("[center]Variables[/center]", 32)])
	bubble_add_text(
		["[center]Variables are a powerful tool that allow us to store and manipulate data.[/center]"]
	)
	complete_step()
	
	
	bubble_add_text(["[center]Variables in depth[/center]"])
	
	bubble_add_text(["[center]A variable can be thought of as a container that holds data. This data \
can be anything from integers and floats to entire scenes. We use variables whenever we want to use the same \
data in multiple parts of our code, when we are performing operations that change data, or when we need to store data. \
An important thing to remember is that variables can only hold one piece of data at a time. Whenever we store new data \
in a variable, the old data is lost![/center]"])
	
	bubble_add_texture(VARIABLES_PIC)
	complete_step()


func declaring_variables():
	
	bubble_add_text(["[center]Declaring variables[/center]"])
	
	bubble_add_text(["[center]To add a variable to a script, we first have to [b]declare[/b] it. \
We do this by using the keyword [color=RED]var[/color], and then giving the variable a name.[/center]",
"[center]Let's take look at some examples.[/center]"])
	
	bubble_add_task("Open the var_examples.gd file by double clicking it", 1,
	func var_exam(task : Task) -> int:
		if EditorInterface.get_script_editor().get_current_script() == VAR_EXAM_SCRIPT:
			#curr_num_scrip = EditorInterface.get_script_editor().get_current_script()
			
			return 1
		else:
			return 0
		
		
		
		)
	
	highlight_controls([interface.filesystem_dock])
	complete_step()
	
	bubble_move_and_anchor(interface.main_screen, Bubble.At.BOTTOM_RIGHT)
	
	bubble_add_text(["[center]Here we can see a variable declartion. As noted before, the [color=RED]var[/color] keyword \
	tells the computer that we are declaring a variable, which we then follow with the variable name. Remember! Variable names are case-sensitive! (This one is named global_var)[/center]",
	"[center][/center]"])
	
	highlight_code(4, 4)
	
	complete_step()
	
	bubble_add_text(["[center]Let's go ahead and declare our own variable here. Create a new variable \
using the [color=RED]var[/color] keyword and name it 'global_var_2'.[/center]"])
	
	highlight_code(6, 6)
	
	complete_step()
	
	bubble_add_text(["[center]So far, all of these variables are empty. We can store, or assign, data in a variable \
by setting the variable name [b]=[/b] to a value. Highlighted is an example of this.[/center]"])
	
	highlight_code(8,8)
	
	complete_step()
	
	bubble_add_text(["[center]Let's go ahead and assign a value to our 'global_var' variable. Go ahead and set it \
[b]=[/b] to your name. (Remember, this must be written as a String). Then, set ouput = global_var. Make sure to save \
save your script by pressing ctrl+s.[/center]"])
	
	highlight_code(15, 15)
	
	highlight_code(23, 23)
	
	bubble_add_task("Assign your name as a string to global_var and set ouput = to global_var", 1,
	func glob_var(task: Task) -> int:
		var var_exam = EditorInterface.get_edited_scene_root().find_child("variables example", true, false)
		
		if var_exam.output is String:
			return 1
		else:
			return 0
		
		)
	
	complete_step()
	
	bubble_add_text(["[center]It's important to remember that code executes from top to bottom. \
This means if we assign a new value to global_var between the first global_var and ouput the first \
value will be overwritten. Let's go ahead and test this by assigning the value 6 to global_var.[/center]"])
	
	highlight_code(16, 18)
	
	bubble_add_task("Assign the value 6 to global_var. Don't forget to save by pressing ctrl+s!", 1,
	func reassign(task: Task) -> int:
		var var_exam = EditorInterface.get_edited_scene_root().find_child("variables example", true, false)
		
		if var_exam.output is int and var_exam.output == 6:
			return 1
		else:
			return 0
		
		)
	
	complete_step()
	
	bubble_add_text(["[center]We can also perform mathmatical operations on variables! If you remember, global_var_3 was \
initialized with the value 22. Let's assign the product of global_var_3 and the number 78.1 to global_var.[/center]"])
	
	highlight_code(16, 18)
	
	bubble_add_task("Assign the product (+) of 78.1 and global_var_3 to global_var", 1,
	func reassign(task: Task) -> int:
		var var_exam = EditorInterface.get_edited_scene_root().find_child("variables example", true, false)
		
		if var_exam.output is float and var_exam.output == 100.1:
			return 1
		else:
			return 0
		
		)
	
	complete_step()
	
	bubble_add_text(["[center]Let's get global_var_2 involved as well. Let's start by assigning the value 13.8 \
to global_var_2. Then, let's subtract global_var_2 from the product of 78.1 and global_var_3.[/center]"])
	
	
	bubble_add_task("Subtract global_var_2 from the product of 78.1 and global_var_3 and assign the value to global_var", 1,
	func reassign(task: Task) -> int:
		var var_exam = EditorInterface.get_edited_scene_root().find_child("variables example", true, false)
		
		if var_exam.output is float and var_exam.output == 86.3:
			return 1
		else:
			return 0
		
		)
	
	
	complete_step()
	
	
	
	pass

#endregion


func quiz_one():
	
	bubble_add_text(["[center]Let's review. Start by selecting the Quiz 1 node in the node tree and answer the questions in the inspector.[/center]"])
	
	highlight_controls([interface.inspector_dock, interface.scene_dock])
	bubble_add_task("Question 1: What can be stored in a variable?
A: Integers
B: Floats
C: Data
D: Strings
E: All of the above
	", 1,
	func summin(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("Quiz 1")
		if num_node.question_one == "E" or num_node.question_one == "e":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	
	highlight_controls([interface.inspector_dock, interface.scene_dock])
	bubble_add_task("Question 2: What is the keyword used to declare a variable? Make sure to use proper capitalization.", 1,
	func summin(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("Quiz 1")
		if num_node.question_two == "var":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	highlight_controls([interface.inspector_dock, interface.scene_dock])
	bubble_add_task("Question 3: A variable can only store piece of data at a time. T/F", 1,
	func summin(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("Quiz 1")
		if num_node.question_three == "T" or num_node.question_three == "t" or num_node.question_three == "True" or num_node.question_three == "true":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	
	highlight_controls([interface.inspector_dock, interface.scene_dock])
	bubble_add_task("Question 4: Two variables can have the same name. T/F", 1,
	func summin(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("Quiz 1")
		if num_node.question_four == "f" or num_node.question_four == "F" or num_node.question_four == "false" or num_node.question_four == "False":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	
	
	
	pass



func export_vars():
	
	highlight_controls([interface.filesystem_dock])
	bubble_add_text(["[center]In GDScript we can add some special tags before a variable declaration \
to give extra functionality or access to a variable. The most common tag is: [/center]",
"[center]@export[/center]",
"[center]Which allows increased access to the variable through the inspector. Let's practice declaring some export variables by \
opening the 'export variables.gd' script.[/center]"])
	
	bubble_add_task("Open the var_examples.gd file by double clicking it", 1,
	func var_exam(task : Task) -> int:
		if EditorInterface.get_script_editor().get_current_script() == EXP_VAR_SCRIPT:
			#curr_num_scrip = EditorInterface.get_script_editor().get_current_script()
			
			return 1
		else:
			return 0
		
		
		
		)
	
	complete_step()
	
	bubble_add_text(["[center]Let's start by looking at this example. Just as before we see the [color=RED]var[/color] \
keyword before the variable name 'output'. However, we now see the tag [color=YELLOW]@export[/color] in front of the \
declaration. Unlike a normal variable declaration, an @export declaration requires a default value as well. \
Let's go ahead and declare our first @export variable and give it the name 'input'.[/center]"])
	
	highlight_code(4, 8)
	bubble_add_task("Declare a new @export variable named input. Give it the default value 'input'.", 1,
	func reassign(task: Task) -> int:
		var var_exam = EditorInterface.get_edited_scene_root().find_child("export variables", true, false)
		
		if var_exam.input and var_exam.input == 'input':
			return 1
		else:
			return 0
		
		)
	
	complete_step()
	
	bubble_add_text(["[center]Now, let's set output = to input.[/center]"])
	bubble_add_task("Set output = to input.", 1,
	func reassign(task: Task) -> int:
		var var_exam = EditorInterface.get_edited_scene_root().find_child("export variables", true, false)
		
		if var_exam.output == 'input':
			return 1
		else:
			return 0
		
		)
	
	highlight_code(15,15)
	
	complete_step()
	
	
	
	bubble_add_text(["[center]When we declare an [color=YELLOW]@export[/center] variable it is added \
to the inspector. Go ahead and select the 'export variables' node in the scene tree to see our input and output vairables in the inspector.[/center]"])
	
	complete_step()
	pass


