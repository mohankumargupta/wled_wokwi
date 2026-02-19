import socket

def send_ddp_red(ip_address, pixel_count=1):
    # DDP Header (10 bytes)
    # Byte 0: Flags (0x40 = Ver 1, 0x01 = Push flag to display immediately)
    # Byte 1: Stats/Sequence (0x00)
    # Byte 2: Data Type (0x01 = RGB)
    # Byte 3: ID (0x01)
    # Bytes 4-7: Offset (0x00000000)
    # Bytes 8-9: Data Length in bytes (pixel_count * 3)
    
    header = bytearray([0x41, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00])
    data_len = pixel_count * 3
    header.append((data_len >> 8) & 0xFF) # Length High Byte
    header.append(data_len & 0xFF)        # Length Low Byte

    # RGB Data: Red = 255, Green = 0, Blue = 0
    pixel_data = bytearray([0, 255, 0] * pixel_count)
    
    packet = header + pixel_data
    
    # Send via UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.sendto(packet, (ip_address, 4048))
    sock.close()

# Usage: Replace with your LED controller's IP
send_ddp_red("127.0.0.1")