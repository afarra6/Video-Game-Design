extends "res://addons/godot_tours/tour.gd"

const HL_TEXTURE := preload("res://lang_levels.png")
const NUM_SCRIPT := preload("res://numbers.gd")
const STR_SCRIPT := preload("res://strings_script.gd")
var curr_num_scrip : Script
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
	intro_to_gdscript()
	numbers()
	mixing_nums()
	num_rev()
	strings()
	concat()
	str_rev()
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
#region Title screen and intro

##A title bubble, detail what the subject of the tour is here.
func title():
	
	
	context_set_3d()
	scene_open("res://main.tscn")
	
	bubble_set_title("")
	bubble_add_text([bbcode_wrap_font_size("[center]Data Types[/center]", 32)])
	bubble_add_text(
		[
		"[center]Godot's scripting language, GDScript, provides powerful tools for \
the creation of games, applications, or anything you can imagine. When working in GDScript \
we'll use different [b]Data Types[/b]. This tour will go over the most common[/center]"
		]
	)
	complete_step()
	



func intro_to_gdscript():
	
	bubble_set_title("What is GDScript?")
	bubble_add_text([
		"[center]From the Godot documentation: [/center]",
		"[center]GDScript is a high-level, object-oriented, imperative, and gradually typed programming language built for Godot. It uses an indentation-based syntax similar to languages like Python. Its goal is to be optimized for and tightly integrated with Godot Engine, allowing great flexibility for content creation and integration.[/center]",
		"[center]Don't worry if this sounds intimidating, we'll be breaking down the core concepts, but first let's familiarize ourselves with some common coding terms.[/center]"
	])
	
	complete_step()
	
	bubble_set_title("")
	
	bubble_add_text([bbcode_wrap_font_size("[center]Data Types[/center]", 32)])
	bubble_add_text([
		"[center]Data is information, and computers can only understand certain [b]Types[/b] of data. \
the most common data types, and the ones we'll work the most with, are: [/center]",
		"[center][b]Integers[/b] or [color=sky blue]int[/color] are whole numbers[/center]",
		"[center][b]Floats[/b] or [color=red]float[/color] are numbers with decimal places[/center]",
		"[center][b]Strings[/b] or [color=sky blue]String[/color] are text, always written inside quotation marks: 'Like this'[/center]",
		"[center][b]Booleans[/b] or [color=red]bool[/color] are either [color=red]true[/color] or [color=red]false[/color][/center]"
	])
	
	
	
	
	bubble_add_text([
		"[center]Let's familiarize ourselves with these [b]Data Types[/b]![/center]"
	])
	
	complete_step()
	

#endregion
#region Floats and Integers

func numbers():
	
	bubble_set_title("Integers and Floats")
	
	bubble_add_text(["[center][b]Integers[/b] and [b]Floats[/b] are the most common [b]Data Types[/b] \
we'll run in to. It's important to distinguish between these as in some situation the computer expects \
one or the other, and giving it the wrong type will result in an [color=red]error[/color]![/center]",
"[center]Let's jump in to some code![/center]"])
	
	complete_step()
	
	
	highlight_controls([interface.filesystem_dock])
	
	bubble_add_text([
		"[center]Let's go ahead and open the 'numbers.gd' file from the file dock. You can do \
	this by double clicking it.[/center]"
	])
	
	bubble_add_task("Open the numbers.gd file", 1,
	func open_numbers(task: Task) -> int:
		if EditorInterface.get_script_editor().get_current_script() == NUM_SCRIPT:
			curr_num_scrip = EditorInterface.get_script_editor().get_current_script()
			
			return 1
		else:
			return 0
	)
	
	
	complete_step()
	
	highlight_controls([interface.main_screen])
	bubble_move_and_anchor(interface.main_screen, Bubble.At.BOTTOM_RIGHT)
	bubble_add_text([
		"[center]Great! You'll notice that by opening the script that we've also changed views. \
We're now inside of Godot's IDE, the Integrated Development Environment. The IDE has built in tools \
that help us write code faster and more accurately. While out of the scope of this tour, we recommend \
exploring the documentation to learn more about Godot and GDScript in general.[/center]"
	])
	
	complete_step()
	
	highlight_code(10,12)
	bubble_add_text([
		"[center]Let's work some with [color=red]floats[/color] and [color=sky blue]ints[/color]. \
We can see at the bottom of the highlighted portion is a [b]Variable[/b] called 'output', we'll talk about [b]Variables[/b] later \
but for now we'll use it to store some numbers. Let's start by storing an [color=sky blue]int[/color] by setting the [b]Variable[/b] output [b]=[/b] some whole number.[/center]"
		
		
	])
	
	
	
	bubble_add_task("Set output equal to a whole number", 1,
	func whole_ouput(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.output is int:
			return 1
		else:
			return 0
		
		)
	
	complete_step()
	
	highlight_code(10,12)
	bubble_add_text([
		"[center]Now let's set output equal to a float![/center]"
	])
	
	bubble_add_task("Set output equal to a number with a decimal place", 1,
	func float_point(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.output is float:
			return 1
		else:
			return 0
		
		
		)
	
	complete_step()
	
	highlight_code(10,12)
	bubble_add_text([
		"[center]Great! Now that we can write both integers and floats, let's perform some [b]operations[/b] using them. \
GDScript includes many familiar [b]operators[/b] such as: [/center]",
		"[center]Addition: +[/center]",
		"[center]Subtraction: -[/center]",
		"[center]Multiplication: *[/center]",
		"[center]Division: /[/center]",
		"[center]Let's start by adding two [color=sky blue]ints[/color] together, we can do this by setting output = operand + operand.[/center]"
	])
	
	bubble_add_task("Set ouput equal to the sum of 1064 and 30783", 1,
	func summin(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		
		if num_node.output == (1064 + 30783):
			return 1
		else:
			return 0
	)
	
	
	complete_step()
	highlight_code(10,12)
	bubble_add_task("Now set the ouput to the difference of 700 and 364", 1,
	func summin(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		
		if num_node.output == (700 - 364):
			return 1
		else:
			return 0
	)
	
	complete_step()
	highlight_code(10,12)
	bubble_add_text([
		"[center]Now let's work with some [color=red]floats[/color]. Remember a [color=red]floats[/color] \
is a number with decimal places.[/center]"
	])
	
	bubble_add_task("Set the ouput to the product of 76.8 and 183.92", 1,
	func summin(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		
		if num_node.output == (76.8 * 183.92):
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	highlight_code(10,12)
	bubble_add_task("And now set the ouput to the quotient of 37.2 and 2.7", 1,
	func summin(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		
		if num_node.output == (37.2 / 2.7):
			return 1
		else:
			return 0
	)
	
	complete_step()

func mixing_nums():
	bubble_move_and_anchor(interface.main_screen, bubble.At.BOTTOM_RIGHT)
	bubble_set_title("")
	bubble_add_text([
		"[center]So far, we've only used floats and integers separately. However, we can use both at the same time! \
The important thing to remember that any [b]operation[/b] that uses both [color=red]floats[/color] and [color=sky blue]ints[/color] \
will result in a [color=red]float[/color]. This holds true even when the result of an operation would be a whole number. For instance, the result of this equation: [/center]",
		"[center]2 * 1.5[/center]",
		"[center]Which is 3, will actually output 3.0. This is important to keep in mind as you continue \
working in GDScript and moving on to more complicated projects.[/center]"
	])
	
	complete_step()
	
	bubble_add_text([
		"[center]Let's do some practice![/center]"
	])
	
	highlight_code(10,12)
	bubble_add_task("Set ouput to the difference of 100.3 and 0.3", 1,
	func summin(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.output == (100.3 - 0.3) and num_node.output is float:
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	highlight_code(10,12)
	bubble_add_task("Set ouput to the product of 36 and 1.82", 1,
	func summin(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.output == (36 * 1.82) and num_node.output is float:
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	
	
	pass

func num_rev():
	
	bubble_add_text([
		"[center]Now that we've familiarized ourselves with how GDScript handles numbers let's do some review. \
Select the 'num review' node in the node tree and put your answers in the inspector.[/center]"
	])
	highlight_controls([interface.inspector_dock, interface.scene_dock])
	bubble_add_task("Question 1: Which [b]Data Type[/b] are whole numbers?", 1,
	func summin(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("num review")
		if num_node.question_one == "int" or num_node.question_one == "integer" or num_node.question_one == "Integer" or num_node.question_one == "Int":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	highlight_controls([interface.inspector_dock])
	bubble_add_task("Question 2: An integer can [b]not[/b] be multiplied by a float. T/F", 1,
	func summin(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("num review")
		if num_node.question_two == "F" or num_node.question_two == "False" or num_node.question_two == "f" or num_node.question_two == "false":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	
	highlight_controls([interface.inspector_dock])
	bubble_add_task("Question 3: The ouput of this equation, 183 * 0.5, will be:
		A: an Integer
		B: a Float
		C: an Error", 1,
	func summin(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("num review")
		if num_node.question_three == "B" or num_node.question_three == "b":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	highlight_controls([interface.inspector_dock])
	bubble_add_task("Question 4: You can only perform operations on two numbers at a time. T/F", 1,
	func summin(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("num review")
		if num_node.question_four == "F" or num_node.question_four == "False" or num_node.question_four == "f" or num_node.question_four == "false":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	
	pass

#endregion
#region Strings

func strings():
	
	bubble_move_and_anchor(interface.main_screen, bubble.At.CENTER)
	bubble_set_title("Strings")
	
	bubble_add_text([
		"[center]Now that we have a good handle of [color=sky blue]ints[/color] and [color=red]floats[/color] \
we'll move on to [color=sky blue]Strings[/color]! Strings are text, or more accurately a collection of characters. \
these are used most often in User Interfaces but have myriad uses elsewhere too![/center]"
	])
	
	bubble_add_text([
		"[center]The most important thing to remember about [color=sky blue]Strings[/color] is that they always appear in quotation marks.[/center]"
	])
	
	
	complete_step()
	
	highlight_controls([interface.filesystem_dock])
	
	bubble_add_text([
		"[center]Let's go ahead and open the 'strings_script.gd' file from the file dock. You can do \
	this by double clicking it.[/center]"
	])
	
	bubble_add_task("Open the strings_script.gd file", 1,
	func open_numbers(task: Task) -> int:
		if EditorInterface.get_script_editor().get_current_script() == STR_SCRIPT:
			curr_num_scrip = EditorInterface.get_script_editor().get_current_script()
			
			return 1
		else:
			return 0
	)
	
	
	complete_step()
	bubble_move_and_anchor(interface.main_screen, bubble.At.BOTTOM_RIGHT)
	highlight_code(10,12)
	bubble_add_text([
		"[center]Here we can see that ouput has been set to a [color=sky blue]String[/color]. This is a good point to note that the \
[b]=[/b] sign is used to [i]assign[/i] a value to a [b]Variable[/b]. So by saying output = 'Hi there' we are storing 'Hi there' in the variable![/center]",
		"[center]Let's start by changing the [b]value[/b] of the [color=sky blue]String[/color].[/center]"
	])
	
	
	bubble_add_task("Set output to the string: Hello World!", 1,
	func hello_world(task: Task) -> int:
		var str_node = EditorInterface.get_edited_scene_root().find_child("strings")
		
		if str_node.output == "Hello World!":
			return 1
		else:
			return 0
		)
	
	complete_step()
	highlight_code(10,12)
	bubble_add_text([
		"[center][color=sky blue]Strings[/color] are case sensitive, meaning that a [color=sky blue]String[/color] with the value 'Hi there' is not the same as one with the value 'hi there'.[/center]"
	])
	
	bubble_add_task("Change Hello World! to: hello world!", 1,
	func hello_world(task: Task) -> int:
		var str_node = EditorInterface.get_edited_scene_root().find_child("strings")
		if str_node.output == "hello world!":
			return 1
		else:
			return 0
		)
	
	
	complete_step()
	
	highlight_code(10,12)
	bubble_add_text([
		"[center]This also goes for things like spaces and symbols!.[/center]"
	])
	
	bubble_add_task("Remove all of the spaces from hello world! and replace the [b]![/b] with a [b]?[/b]", 1,
	func hello_world(task: Task) -> int:
		var str_node = EditorInterface.get_edited_scene_root().find_child("strings")
		if str_node.output == "helloworld?":
			return 1
		else:
			return 0
		)
	
	
	complete_step()
	
	
	
	

func concat():
	
	bubble_add_text([
		"[center]Now that we have a handle of [color=sky blue]Strings[/color], let's introduce a new concept: Concatenation[/center]",
		"[center]Concatenation is the stitching together of [color=sky blue]Strings[/color]. This becomes \
very useful when working with a User Interface that has values that change and values that stay the same.[/center]",
		"[center]We can concatenate two [color=sky blue]Strings[/color] by using the [b]+[/b] operator. The second \
[color=sky blue]String[/color] will be 'stitched' onto the first when we do this.[/center]"
	])
	
	complete_step()
	
	highlight_code(15,17)
	bubble_add_text([
		"[center]Let's start by giving output2 a default value.[/center]"
	])
	
	bubble_add_task("Set ouput2 equal to: Concatenation", 1,
	func hello_world(task: Task) -> int:
		var str_node = EditorInterface.get_edited_scene_root().find_child("strings")
		if str_node.output2 == "Concatenation":
			print(str_node.output2)
			return 1
		else:
			return 0
		)
	
	complete_step()
	
	highlight_controls([interface.bottom_button_output])
	
	bubble_add_text([
		"[center]Let's check the Output in the debugger. We can print to the ouput by using the print() [b]Method[/b]. This will be discussed in a later tour. There's no need to add a print() method, this has been done for you.[/center]"
	])
	
	complete_step()
	
	highlight_code(15,17)
	bubble_add_text([
		"[center]We can see that we're currently outputting the value being stored in output2! \
Let's do some concatenation now.[/center]",
		"[center]Hint: Remember, we can concatenate strings using the [b]+[/b] operator[/center]"
	])
	
	bubble_add_task("Concatenate this String to the end of Concatenation: stitches", 1,
	func hello_world(task: Task) -> int:
		var str_node = EditorInterface.get_edited_scene_root().find_child("strings")
		if str_node.output2 == "Concatenationstitches":
			print(str_node.output2)
			return 1
		else:
			return 0
		)
	
	complete_step()
	
	
	highlight_code(15,17)
	bubble_add_text([
		"[center]Oh no something isn't quite right, look at the output. Both of our strings have smashed together. \
This is because we haven't concatenated any spaces between the strings. Let's go ahead and concatenate a space between Concatenation and stitches. [/center]",
		"[center]Important!: Remember, spaces are considered characters as well in a string![/center]"
	])
	
	bubble_add_task("Concatenate concatenate a space between 'Concatenation' and 'stitches'", 1,
	func hello_world(task: Task) -> int:
		var str_node = EditorInterface.get_edited_scene_root().find_child("strings")
		if str_node.output2 == "Concatenation stitches":
			print(str_node.output2)
			return 1
		else:
			return 0
		)
	
	complete_step()
	
	
	highlight_code(15,17)
	bubble_add_text([
		"[center]That's better! Concatenation is a powerful tool but, as you saw, \
if we're not careful it can have unintended consequences. Now, let's review![/center]"
	])
	
	complete_step()
	
	

func str_rev():
	
	highlight_controls([interface.scene_dock, interface.inspector_dock])
	bubble_add_text([
		"[center]Select the 'strings review' node in the scene tree and answer the questions in the inspector.[/center]"
	])
	highlight_controls([interface.inspector_dock, interface.scene_dock])
	bubble_add_task("Question 1: What are [color=sky blue]Strings[/color] made of:
		A: Numbers
		B: Characters
		C: Data
		D: Booleans", 1,
	func string_quiz(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("strings review")
		if num_node.question_one == "B" or num_node.question_one == "b":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	highlight_controls([interface.inspector_dock])
	bubble_add_task("Question 2: What is it called when we 'stitch' two [color=sky blue]Strings[/color] together", 1,
	func string_quiz(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("strings review")
		if num_node.question_two == "Concatenation" or num_node.question_two == "concatenation":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	highlight_controls([interface.inspector_dock])
	bubble_add_task("Question 3: Spaces are characters. T/F", 1,
	func string_quiz(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("strings review")
		if num_node.question_three == "t" or num_node.question_three == "T":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	highlight_controls([interface.inspector_dock])
	bubble_add_task("Question 4: All [color=sky blue]Strings[/color] have these around them: 
		A: Brackets
		B: Question Marks
		C: Addition symbols
		D: Quotation Marks", 1,
	func string_quiz(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("strings review")
		if num_node.question_four == "D" or num_node.question_four == "d":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	highlight_controls([interface.inspector_dock])
	bubble_add_task("Question 5: What operator is used to concatenate [color=sky blue]Strings[/color]? Hint: write the symbol, not the name of the operator", 1,
	func string_quiz(task: Task) -> int:
		EditorInterface.get_inspector()
		var num_node = EditorInterface.get_edited_scene_root().find_child("strings review")
		if num_node.question_five == "+":
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	

#endregion



#region Variables and other concepts

func vars():
	#highlight_controls([interface.main_screen])
	highlight_code(1,8)
	bubble_move_and_anchor(interface.main_screen, Bubble.At.BOTTOM_RIGHT)
	bubble_add_text([
		"[center]Great! You'll notice that by opening the script that we've also changed views. \
We're now inside of Godot's IDE, the Integrated Development Environment.[/center]", 
		"[center]At the top of this script \
are two [b]Variables[/b]. We can think of [b]Variables[/b] as containers that can hold [b]Data[/b]. \
We create a new [b]Variable[/b] by using the keyword [color=red]var[/color] and then giving the a name \
for the [b]Variable[/b]. Here we see a [b]Variable[/b] named [b]my_integer[/b]. Currently it is not holding \
any [b]Data[/b]. We can store data inside of a [b]Variable[/b] by setting it [b]=[/b] (equal) to something. \
go ahead and give [b]my_integer[/b] a default value of 100. Save your script by pressing ctrl+s.[/center]"
	])
	
	bubble_add_task("Set the default value of my_integer to 100", 1,
	func set_my_int(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.my_integer == 100:
			return 1
		else:
			return 0
	)
	
	complete_step()
	
	
	highlight_code(1,8)

	
	bubble_add_text([
		"[center]Now [b]my_integer[/b] will start with a default value of 100! Let's make a new variable now \
we'll store a [color=red]float[/color] in this one. Use [b]my_integer[/b] as a template for declaring a new variable \
named [b]my_float[/b] and give it a default value of 103.86.[/center]",
		"[center]Hint: Make sure to add the @export keyword as well[/center]"
	])
	
	
	bubble_add_task("Add a new [b]Variable[/b] named [b]my_float[/b]", 1,
	func make_my_float(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.my_float != null:
			return 1
		else:
			return 0
		
		)
	
	bubble_add_task("Set [b]my_float's[/b] default value to 103.86", 1,
	func make_my_float(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.my_float == 103.86:
			return 1
		else:
			return 0
		
		)
	
	complete_step()
	
	highlight_code(11,16)
	
	bubble_add_text([
		"[center]Great, now we have two variables! What makes variables so powerful though \
is that the [b]value[/b] that they hold can be [b]changed[/b]. Let's go ahead and change the values \
of our variables. We can do this by setting the [i]variable name[/i] [b]=[/b] a new value.[/center]"
	])
	
	bubble_add_task("Set [b]my_float's[/b]  value to -46.8134", 1,
	func make_my_float(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.my_float == -46.8134:
			return 1
		else:
			return 0
		
		)
	
	bubble_add_task("Set [b]my_integer's[/b]  value to 2000000", 1,
	func make_my_float(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.my_integer == 2000000:
			return 1
		else:
			return 0
		
		)
	
	complete_step()
	
	highlight_code(11,16)
	bubble_add_text([
		"[center]Not only can we change their values, we can use them in equations. Let's start by \
adding both of our variables together. We'll store them in a variable called [b]my_product[/b], this has \
already been made for you.[/center]",
		"[center]Hint: Think about how we stored a value in a variable before. How would you add two variables together?[/center]"
	])
	
	bubble_add_task("Add [b]my_integer[/b] and [b]my_float[/b] together, store their product in [b]my_product[/b]", 1,
	func make_my_float(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.my_product == num_node.my_integer + num_node.my_float:
			return 1
		else:
			return 0
		
		)
	
	
	complete_step()
	
	highlight_code(11,16)
	bubble_add_text([
		"[center]GDScript is what is called a 'dynamically typed' language. This means that, unless specified, a [b]Variable[/b] can hold [b]Data[/b] of \
[b]Type[/b] and have the [b]Data Type[/b] be changed at any time. Let's test this by setting the value \
of [b]my_float[/b] to a [color=mint]String[/color]. We can make a string by using [b]quotation marks[/b]. Put your name inside these quotation marks.[/center]",
		"[center]Hint: You can set the value of the variable using the [b]=[/b] sign."
	])
	
	
	bubble_add_task("Change the value of [b]my_float[/b] to a String that is your name", 1,
	func make_my_float(task: Task) -> int:
		var num_node = EditorInterface.get_edited_scene_root().find_child("numbers")
		if num_node.my_float is String:
			return 1
		else:
			return 0
		
		)
	
	
	complete_step()
	pass



func larger_concepts():
	# What does High-Level mean?
	bubble_set_title("Language Levels")
	bubble_add_texture(HL_TEXTURE)
	bubble_add_text([
		"[center]Coding languages have different 'levels'; refering not to the difficulty \
or complexity of the language, but rather the level of abstraction from the 'language' \
the computer 'speaks'. GDScript is a high-level language, meaning that it works more like \
how people talk than how a computer does.[/center]"
	])
	bubble_add_text([
		"[center]This means we'll be discussing things in terms of words instead of binary \
or working closely with how the computer hardware is actually functioning. The language does that \
part for us![/center]"
	])
	complete_step()
	
	# Object oriented
	bubble_set_title("Object Oriented Programming")
	bubble_add_text([
		"[center]Like many other high-level programming languages, GDScript is what we call 'Object Oriented. \
In this programming style we use [b]Classes[/b] (essentially a blueprint), to create 'Objects' that we \
can then manipulate. Godot calls these 'objects' Nodes. This becomes intuitive as any object that we want to make in the world \
is created from a [b]Class[/b], which we can then move around or otherwise change![/center]"
	])
	
	complete_step()
	
	bubble_add_text([
		"[center]All [b]Classes[/b] have two coding concepts attached to them. These are \
[b]Properties[/b] and [b]Methods[/b]. [b]Properties[/b] tell us about the current state of an object. This \
could be something such as position, size, or shape. [b]Methods[/b] are things that an object can do, or have done \
to it. Think of [b]Properties[/b] as nouns or adjectives and [b]Methods[/b] as verbs.[/center]"
	])
	
	complete_step()
	
	

#endregion
