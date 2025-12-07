# ChatGPT used for parts of script
import random

def to_bin_tc(value, width):
    """Return a two's complement binary string of given width."""
    # mask value into two's complement range
    return f"{value & ((1 << width) - 1):0{width}b}"

with open('testvectors.tv', 'w') as f:
    for _ in range(256):
        x = random.randint(-2**15, 2**15 - 1)   # 16-bit signed
        y = random.randint(-2**11, 2**11 - 1)   # 12-bit signed
        product_g = x * y

        line = (
            f"{to_bin_tc(x, 16)}_"
            f"{to_bin_tc(y, 12)}_"
            f"{to_bin_tc(product_g, 28)}\n"
        )
        f.write(line)
