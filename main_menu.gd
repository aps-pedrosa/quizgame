extends Control
@onready var node_2d: Node2D = $Node2D
@onready var v_box_container: VBoxContainer = $VBoxContainer

var duels = [
	[2, 4],
	[0, 3],
	[1, 5],
	[0, 2],
	[1, 4],
	[3, 5],
	[0, 5],
	[2, 5],
	[1, 3],
	[0, 1],
	[3, 4],
	[2, 3],
	[0, 4],
	[1, 2],
	[4, 5]
]

var questionID = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	node_2d.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	questionID = 1
	get_tree().change_scene_to_file("res://question1.tscn")


func _on_rules_pressed() -> void:
	if node_2d.visible == false:
		node_2d.visible = true
		v_box_container.visible = false


func _on_exit_pressed() -> void:
	get_tree().quit()
	


func _on_rules_back_pressed() -> void:
	if node_2d.visible == true:
		node_2d.visible = false
		v_box_container.visible = true
