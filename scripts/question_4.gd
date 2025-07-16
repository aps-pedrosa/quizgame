extends Control
@onready var correct1: Label = $VBoxContainer/HBoxContainer2/Button6/Label
@onready var wrong1c: Label = $VBoxContainer/HBoxContainer/Button9/Label2
@onready var wrong1d: Label = $VBoxContainer/HBoxContainer2/Button7/Label
@onready var wrong1a: Label = $VBoxContainer/HBoxContainer/Button8/Label

@onready var game_manager: Node = %GameManager

@onready var timer: Timer = %Timer

var done = true
var turn = 0
var times_up = false
var team1 = 0
var team2 = 4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.tema = 1
	correct1.visible = false
	wrong1a.visible = false
	wrong1c.visible = false
	wrong1d.visible = false
	

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
			"optionC":
				correct1.visible = true
				wrong1a.visible = true
				wrong1d.visible = true
				wrong1c.visible = true
				done = true
				if turn == 1:
					GameManager.points[team1] += 5
				elif turn == 2:
					GameManager.points[team2] += 5

			"optionA":
				wrong1a.visible = true
				if turn == 1:
					GameManager.points[team1] -= 2
					turn = 2
				elif turn == 2:
					GameManager.points[team2] -= 2
					turn = 1

			"optionB":
				wrong1c.visible = true
				if turn == 1:
					GameManager.points[team1] -= 2
					turn = 2
				elif turn == 2:
					GameManager.points[team2] -= 2
					turn = 1

			"optionD":
				wrong1d.visible = true
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
