def count_vowels(s):
    vowels = "аеёиоуыэюяaeiou"
    count = 0

    for char in s.lower():
        if char in vowels:
            count += 1

    return count

def reverse_string(s):
    return s[::-1]

def is_palindrome(s):
    s = s.lower()
    return s == s[::-1]

def capitalize_string(s):
    return s.title()