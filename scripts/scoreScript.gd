extends Node2D
@onready var label = $Label
var points = 0


func add_point():
	points += 3
	print(points) #debugging
	update_label()
	
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func update_label():
	label.text = str(points)
