extends Control
@onready var correct1: Label = $VBoxContainer/HBoxContainer/Button8/Label
@onready var wrong1c: Label = $VBoxContainer/HBoxContainer2/Button6/Label
@onready var wrong1d: Label = $VBoxContainer/HBoxContainer2/Button7/Label
@onready var wrong1a: Label = $VBoxContainer/HBoxContainer/Button9/Label

@onready var game_manager: Node = %GameManager

@onready var timer: Timer = %Timer

var done = true
var turn = 0
var times_up = false
var team1 = 0
var team2 = 2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.tema = 1
	correct1.add_theme_color_override("font_color", '#1c1f1e')
	wrong1a.add_theme_color_override("font_color", '#1c1f1e')
	wrong1c.add_theme_color_override("font_color", '#1c1f1e')
	wrong1d.add_theme_color_override("font_color", '#1c1f1e')


func _input(event) -> void:
	match GameManager.player:
		"player1":
			turn = 1
			done = false
		"player2":
			turn = 2
			done = false
	if done == false:
		match GameManager.option:
			"optionA":
				correct1.add_theme_color_override("font_color", '#a4c263')
				wrong1a.add_theme_color_override("font_color", '#823a48')
				wrong1c.add_theme_color_override("font_color", '#823a48')
				wrong1d.add_theme_color_override("font_color", '#823a48')
				done = true
				if turn == 1:
					GameManager.points[team1] += 5
				elif turn == 2:
					GameManager.points[team2] += 5

			"optionB":
				wrong1a.add_theme_color_override("font_color", '#823a48')
				if turn == 1:
					GameManager.points[team1] -= 2
					turn = 2
				elif turn == 2:
					GameManager.points[team2] -= 2
					turn = 1

			"optionC":
				wrong1c.add_theme_color_override("font_color", '#823a48')
				if turn == 1:
					GameManager.points[team1] -= 2
					turn = 2
				elif turn == 2:
					GameManager.points[team2] -= 2
					turn = 1

			"optionD":
				wrong1d.add_theme_color_override("font_color", '#823a48')
				if turn == 1:
					GameManager.points[team1] -= 2
					turn = 2
				elif turn == 2:
					GameManager.points[team2] -= 2
					turn = 1

		print("2: ", GameManager.points[team1])
		print("4: ", GameManager.points[team2])

	if Input.is_action_just_pressed("ui_accept") and done == true:
		get_tree().change_scene_to_file("res://scenes/ranks.tscn")
