extends Control

@onready var game_manager: Node = %GameManager

@onready var rank_box: VBoxContainer = $HBoxContainer/VBoxContainer
@onready var teamR1: TextureButton = $HBoxContainer/VBoxContainer/TextureButton

@onready var t_1: TextureButton = $HBoxContainer/VBoxContainer/T1
@onready var t_2: TextureButton = $HBoxContainer/VBoxContainer/T2
@onready var t_3: TextureButton = $HBoxContainer/VBoxContainer/T3
@onready var t_4: TextureButton = $HBoxContainer/VBoxContainer/T4
@onready var t_5: TextureButton = $HBoxContainer/VBoxContainer/T5
@onready var t_6: TextureButton = $HBoxContainer/VBoxContainer/T6

@onready var label_t: Label = $TileMap/Node2D/Label4

@onready var label_n: Label = $TileMap/Label3


func _ready():
	GameManager.question += 1
	
	var number = str(GameManager.question)
	if GameManager.question < 10:
		label_n.text = str("0"+number)
	else:
		label_n.text = str(number)
	
	match GameManager.question:
		1,2,3:
			label_t.text = str("Satelite")
		4,5,6:
			label_t.text = str("Bluetooth")
		7,8,9:
			label_t.text = str("Wifi")
		10,11,12:
			label_t.text = str("Radio")
		13,14,15:
			label_t.text = str("RFID")
		16,17,18:
			label_t.text = str("Internet")
	
	var teams = [
		{"name": "Team 1", "points": 12},
		{"name": "Team 2", "points": 25},
		{"name": "Team 3", "points": 7},
		{"name": "Team 4", "points": 18},
		{"name": "Team 5", "points": 30},
		{"name": "Team 6", "points": 14}
	]

	for i in teams.size():
		teams[i]["points"] = GameManager.points[i]

	teams.sort_custom(sort_by_points_descending)

	var i = 0
	for team in teams:
		var name = team["name"]
		var points = team["points"]
		match name:
			"Team 1":
				print("Team 1 scored ", points, " points.")
				rank_box.move_child(t_1,i)
			"Team 2":
				print("Team 2 scored ", points, " points.")
				rank_box.move_child(t_2,i)
			"Team 3":
				print("Team 3 scored ", points, " points.")
				rank_box.move_child(t_3,i)
			"Team 4":
				print("Team 4 scored ", points, " points.")
				rank_box.move_child(t_4,i)
			"Team 5":
				print("Team 5 scored ", points, " points.")
				rank_box.move_child(t_5,i)
			"Team 6":
				print("Team 6 scored ", points, " points.")
				rank_box.move_child(t_6,i)
			_:
				print(name, " has ", points, " points.")
		i += 1


func sort_by_points_descending(a, b) -> bool:
	return a["points"] > b["points"]

var next = "res://scenes/questions/question"+str(GameManager.question)+".tscn"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file(next)
		print(GameManager.question)
