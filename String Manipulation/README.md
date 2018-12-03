# Stack and String

Designed function get_age() that determines the minimum age, in years, given the year of birth entered by the user input.
- There are no parameters in get_age(). The return value is a 64-bit signed integer representing the minimum age, in years.
- The function prompts the user for their name, and then thank the user, by name.
- The function then prompt the user for their year of birth. Invalid input is met with an error message and another prompt for their year of birth. The input is considered invalid if it is not a valid decimal integer, or it falls out of the range 1900-2017 inclusive. 
- The function calls three other functions, printf(), gets() and strtol().
The function  store 3 local variables on the stack:
- endptr - for the call to strtol;
– name_str - to hold the user’s name on the first call to gets; and
- year_str - to hold the user’s year of birth on the second call to gets.
