def f(x, a, b, c, d):
    return a * x**3 + b * x**2 + c * x + d

def false_position_formula2(p, q, e, a, b, c, d):
    condition = True
    iteration = 1
    while condition:
        fp = f(p, a, b, c, d)
        fq = f(q, a, b, c, d)
        
        root = (p * fq - q * fp) / (fq - fp)
        fr = f(root, a, b, c, d)

        print(f"Iteration {iteration}:     root = {root:.6f}     f(root) = {fr:.6f}")
        iteration += 1

        if fp * fr < 0:
            q = root
        else:
            p = root

        if abs(fr) < e:
            break
        
    print(f'\nApproximate root is: {root:.5f}')


a = float(input("Enter coefficient a (x^3): "))
b = float(input("Enter coefficient b (x^2): "))
c = float(input("Enter coefficient c (x): "))
d = float(input("Enter constant term d: "))
p = float(input("Enter first guess (p): "))
q = float(input("Enter second guess (q): "))
e = float(input("Enter tolerable error (e.g., 0.001): "))


if f(p, a, b, c, d) * f(q, a, b, c, d) > 0.0:
    print("Invalid initial guesses. They do not bracket the root.")
else:
    false_position_formula2(p, q, e, a, b, c, d)
