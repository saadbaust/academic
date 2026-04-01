# Caser Cipher Code
# User input
plaintext = input("Enter plaintext:")
key = input("Enter shift amount:")

# Variable declarations
ans = ""

# iterate over the given text
for i in range(len(plaintext)):
    ch = plaintext[i]
    # check if space is there then simply add space
    if ch == " ":
        ans = ans + " "
    # check if a character is uppercase then encrypt it accordingly
    elif (ch.isupper()):
        temp = ord(ch) + int(key)
        if temp > 90:
            ans = ans + chr(temp - 26)
        else:
            ans = ans + chr(temp)
    # check if a character is lowercase then encrypt it accordingly
    else:
        temp = ord(ch) + int(key)
        if temp > 122:
            ans = ans + chr(temp - 26)
        else:
            ans = ans + chr(temp)

# Output printouts
print("The Plain Text is : " + plaintext)
print("Shift pattern is : " + str(key))
print("Cipher Text is : " + ans)
