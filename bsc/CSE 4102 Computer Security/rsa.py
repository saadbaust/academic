# This program represent RSA algorithm:
import math


def isprime(num):
    if num > 1:
        for i in range(2, int(num/2)+1):
            if (num % i) == 0:
                return False
                break
        else:
            return True
    else:
        return False


while 1:
    p = int(input("Enter prime number P:"))
    q = int(input("Enter prime number Q:"))
    if isprime(p) is True and isprime(q) is True:
        break
    else:
        print("One of them is not prime number please enter again:")

n = p*q
phin = (p-1)*(q-1)

while 1:
    e = int(input("Enter value of e:"))
    if e > 1 and e < phin and math.gcd(e, phin) == 1:
        break
    else:
        print("GCD not 1 please try again:")

# Find D:
k = 0
d = (1+(k*phin))/e
while not (d).is_integer() is True:
    k = k+1
    d = (1+(k*phin))/e

p = int(input("Enter message:"))

# Encryption:
c = pow(p, e, phin)
print("CipherText:", c)

# Decryption:
p = pow(c, int(d), phin)
print("Message after decryption:", p)

# This code is written by Saad Ahmed