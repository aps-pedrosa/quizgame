extends Node2D
var points = 0
@onready var labelHellow: Label = $onScreenScore/Label


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
	labelHellow.text = str(points)
