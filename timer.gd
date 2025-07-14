extends Node2D

@onready var timer: Timer = $Timer
@onready var control: Control = $".."
@onready var label: Label = $Label
@onready var game_manager: Node = %GameManager

var total_time_seconds: int = 25
var timer_active: bool = false

func _ready() -> void:
	update_label()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("start_timer"):
		if timer_active:
			timer.stop()
			timer_active = false
			print("Paused")
		else:
			timer.start()
			timer_active = true
			print("Started or Resumed")

func _on_timer_timeout() -> void:
	total_time_seconds -= 1
	update_label()

	if total_time_seconds <= 0:
		timer.stop()
		timer_active = false
		label.text = "Tempo Acabou!"
		control.times_up = true
	
	if control.times_up:
		control.correct1.visible = true
		control.wrong1a.visible = true
		control.wrong1d.visible = true
		control.wrong1c.visible = true
		if control.turn == 1:
			game_manager.points[control.team1] -= 3
		elif control.turn == 2:
			game_manager.points[control.team2] -= 3

func update_label():
	print("Update Label")
	label.text = str(total_time_seconds)

	if total_time_seconds <= 5:
		label.add_theme_color_override("font_color", '#823a48')
	else:
		label.add_theme_color_override("font_color", '#645552')
