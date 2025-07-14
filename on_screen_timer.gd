extends Node2D

@onready var label = $Label
@onready var timer = $Timer
var total_time_seconds: int = 25

func _ready() -> void:
	timer.wait_time = 1.0  # fire every second
	timer.start()
	update_label()

func _on_timer_timeout() -> void:
	total_time_seconds -= 1
	update_label()

	if total_time_seconds <= 0:
		timer.stop()
		print("Time's up!")

func update_label():
	label.text = str(total_time_seconds)
