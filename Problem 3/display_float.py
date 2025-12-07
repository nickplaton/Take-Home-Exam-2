import argparse
import struct

def convert_float(bits, binary):
    """
    Displays binary32 or binary64 float input in decimal and hex.

    Args:
        bits (int): Number of bits (32 or 64)
        binary (str): The input in binary32 or binary64 float
    """

    if not (bits in {32, 64}):
        print("Input parameters:")
        print("    -n <bits> the number of bits (32 or 64)")
        print("    -b <binary> the binary input")
        print("Input -n must be either 32 or 64.")
        exit(1)
    if binary is None or len(binary) != bits or not (set(binary) <= {"0", "1"}):
        print("Input parameters:")
        print("    -n <bits> the number of bits (32 or 64)")
        print("    -b <binary> the binary input")
        print("Input -b must be the same size as -n.")
        exit(1)
    
    decimal = int(binary, 2)
    print("Decimal: ", struct.unpack('!f' if bits==32 else '!d', decimal.to_bytes(int(bits/8), 'big'))[0])
    print("Hex:     ", hex(decimal))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert 32/64-bit float to decimal and hex.")
    parser.add_argument('-n', type=int, required=True, help='The number of bits')
    parser.add_argument('-b', type=str, help='Input in binary')

    args = parser.parse_args()

    convert_float(args.n, args.b)
