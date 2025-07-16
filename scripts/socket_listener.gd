extends Node

var server := TCPServer.new()
var client : StreamPeerTCP
var data

func _ready():
	var err = server.listen(65432)
	if err == OK:
		print("Servidor socket ouvindo na porta 65432")
	else:
		print("Erro ao iniciar servidor:", err)

func _process(_delta):
	if server.is_connection_available():
		client = server.take_connection()
		print("Cliente conectado!")

	if client and client.get_available_bytes() > 0:
		data = client.get_utf8_string(client.get_available_bytes())
		if data == "player1":
			GameManager.player = "player1"
		if data == "player2":
			GameManager.player = "player2"
		if data == "optionA":
			GameManager.option = "optionA"
		if data == "optionB":
			GameManager.option = "optionB"
		if data == "optionC":
			GameManager.option = "optionC"
		if data == "optionD":
			GameManager.option = "optionD"
