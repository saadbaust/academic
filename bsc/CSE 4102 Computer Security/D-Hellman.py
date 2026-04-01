while 1:
    # Both persons agrees on public keys Gs and Ps
    # Prime number P
    Ps = int(input("Enter prime number:")) #13

    # Checks If the number entered is a Prime Number or not
    if Ps < 1:
        print("Not Public Prime number")
    elif Ps > 1:
        if Ps == 2:
            print("Prime number")
            break
        else:
            for i in range(2, Ps): #2----9
                flag = 0
                if Ps % i == 0:
                    flag = 1
                    break
            if flag == 1:
                print("Not prime Number")
                continue
            else:
                break
L = []
while 1:
    # Gs is primitive root for Ps
    Gs = int(input("Enter Public primitive root:"))

    # Checks If The Entered Number Is A Primitive Root Or Not
    for i in range(1, Ps): # 1---12
        L.append(pow(Gs, i) % Ps)
    # print(L)
    for i in range(1, Ps):
        if L.count(i) > 1:
            flag = 0
            break
        else:
            flag = 1
    if flag == 1:
        break
    else:
        print("Not primitive root of %d" % (Ps))
        continue

print('Value of Ps is : %d' % (Ps))
print('Value of Gs is : %d' % (Gs))

# g is the private key chosen by Joy
g = 5
print('Private Key g is: %d' % (g))

# fetches the generated key
p = int(pow(Gs, g, Ps))

# h will be the chosen private key by Happy
h = 7
print('Private Key h is : %d' % (h))

# fetches the generated key
q = int(pow(Gs, h, Ps))


# Joy's Secret key
KA = int(pow(q, g, Ps))

#  Happy's Secret key
KB = int(pow(p, h, Ps))

print('Saad Secret key is : %d' % (KA))
print('Ahmed Secret key is : %d' % (KB))
