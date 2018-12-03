# Hex Strings

Implemented the function hex_str(x,s) in x86-64 assembly that converts a 32-bit unsigned integer(x) into its corresponding string of hex digits in ASCII(s).

- The register %edi contains the argument unsigned x, the integer to be converted
- The register %rsi contains the argument char *s, the address of the first byte of the ASCII character string to be generated
- Each string begins with “0x”, followed by producing a string of variable size, and terminated by a null character ‘\0’. For example, when x = 66, the string s = "0x42"
