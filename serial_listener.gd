extends Node

var serial := SerialPort.new()

func _ready():
	if serial.open("COM3", 9600):  # Troque "COM3" pela porta correta
		print("Conectado ao Arduino")
	else:
		print("Falha ao conectar ao Arduino")

func _process(_delta):
	if serial.get_available_bytes() > 0:
		var message = serial.get_line().strip_edges()
		if message == "BUTTON_PRESSED":
			print("Hello, World!")
