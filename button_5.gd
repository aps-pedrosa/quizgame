extends Button
@onready var button_9: Button = $"../Button9"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var pontosA = 3.0
	print("Acertou!")
	print(pontosA)
