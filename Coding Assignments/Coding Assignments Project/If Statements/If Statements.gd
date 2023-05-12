extends Node2D

@export var pos_node := Control


#1: Create a new typed variable, set its default value to true

#2: Create a new export variable, set its default value to any positive integer up to 100

#3: Create a new export variable, set its default value to any negative integer up to -100


func _ready():
	#You can skip this question and come back to it at the end of this assignment
	
	#4 Create an if statement that prints "Input out of range" if either variable 2 or 3 are greater than 100
	# or less than -100
	
	
	
	pass



func _process(delta):
	#This variable's value changes over time, use it as a placeholder to test your code
	var x = pos_node.position.x
	
	
	#5: Create an if statement that prints "Higher" if x is greater than your positive variable
	
	
	#6 Create an if statement that prints "Lower" if x is less than your negative variable
	
	
	
	#7 Create an if statement that prints "Exact Positive" if x is equal to your positive variable
	
	
	#8 Create an if statement that prints "Exact Negative" if x is equal to your negative variable
	
	
	
	#9 Create an if statement that prints "Inside" if x is between your negative and positive variables
	
	
	
	pass
