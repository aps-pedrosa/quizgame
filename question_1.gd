extends Control
@onready var correct1: Label = $VBoxContainer/HBoxContainer/Button9/Label2
@onready var wrong1b: Label = $VBoxContainer/HBoxContainer2/Button6/Label
@onready var wrong1c: Label = $VBoxContainer/HBoxContainer2/Button7/Label
@onready var wrong1a: Label = $VBoxContainer/HBoxContainer/Button8/Label

var pontosA = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	correct1.visible = false
	wrong1a.visible = false
	wrong1b.visible = false
	wrong1c.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event) -> void:
	if Input.is_action_just_pressed("correct"):
		pontosA += 5
		correct1.visible = true
		wrong1a.visible = true
		wrong1b.visible = true
		wrong1c.visible = true
