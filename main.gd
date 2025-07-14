extends Node2D

var udp := PacketPeerUDP.new()

func _ready():
	udp.listen(4242)

func _process(_delta):
	if udp.get_available_packet_count() > 0:
		var packet = udp.get_packet().get_string_from_utf8()
		print("Recebido do Arduino: ", packet)
		if packet == "JUMP":
			print("JUMP")  # ou qualquer evento do seu jogo
