# Squre Root

Implemented a subroutine sqrt(), that computes the integer square root of a number written within the file sqrt.s

- The register %edi contains the argument x (unsigned 32-bit quantity)
- The register %eax carries the return value (unsigned 32-bit quantity)
- The subroutine sqrt compute sthe integer square root of the parameter x. Mathematically, sqrt(x) = ⌊√x⌋, where the floor function ⌊y⌋ computes the largest integer that is less than or equal to y. For example, sqrt(5)= 2, sqrt(16)= 4 and sqrt(24)= 4.
- Does not use any of the x86-64 division or square root instructions, or any of the other floating point arithmetic.
- Only using scratch registers, without any external memory
