import serial
import socket

SERIAL_PORT = 'COM5'  # ⚠️ Troque pela porta do seu Arduino
BAUD_RATE = 9600

HOST = 'localhost'
PORT = 65432

def main():
    ser = serial.Serial(SERIAL_PORT, BAUD_RATE)
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect((HOST, PORT))

    print("Esperando dados do Arduino...")

    while True:
        if ser.in_waiting:
            line = ser.readline().decode().strip()
            print("Recebido do Arduino:", line)
            if line == "BUTTON_PRESSED":
                sock.sendall(b'HELLO_COMMAND')

if __name__ == "__main__":
    main()
