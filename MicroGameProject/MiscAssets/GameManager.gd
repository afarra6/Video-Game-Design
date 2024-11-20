extends Node

var health := 4
var points := 0
var win_lose = true

@export var scene: String
@export var fade_out_speed: float = 0.5
@export var fade_in_speed: float = 0.5
@export var fade_out_pattern: String = "fade"
@export var fade_in_pattern: String = "fade"
@export var fade_out_smoothness = 0.1 # (float, 0, 1)
@export var fade_in_smoothness = 0.1 # (float, 0, 1)
@export var fade_out_inverted: bool = false
@export var fade_in_inverted: bool = false
@export var color: Color = Color(0, 0, 0)
@export var timeout: float = 0.0
@export var clickable: bool = false
@export var add_to_back: bool = true

@onready var fade_out_options = SceneManager.create_options(fade_out_speed, fade_out_pattern, fade_out_smoothness, fade_out_inverted)
@onready var fade_in_options = SceneManager.create_options(fade_in_speed, fade_in_pattern, fade_in_smoothness, fade_in_inverted)
@onready var general_options = SceneManager.create_general_options(color, timeout, clickable, add_to_back)

@onready var games = load("res://game_names.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func game_over():
	
	SceneManager.change_scene("game_over_screen", fade_out_options, fade_in_options, general_options)
	
	pass


func next_game():
	
	var new_game = games.array[randi_range(0, len(games.array) - 1)]
	
	SceneManager.change_scene(new_game, fade_out_options, fade_in_options, general_options)
	
	

func to_interlude():
	
	
	SceneManager.change_scene("interlude", fade_out_options, fade_in_options, general_options)


func restart():
	
	SceneManager.change_scene("start_screen", fade_out_options, fade_in_options, general_options)
	health = 4
	points = 0
	
