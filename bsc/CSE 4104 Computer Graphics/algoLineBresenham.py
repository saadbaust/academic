# This program Bresenham Line Drawing Algorithm:

# Import libraries:
import matplotlib.pyplot as plt

# labeling:
plt.title("Bresenham Line Drawing Algorithm")
plt.xlabel("X-axis")
plt.ylabel("Y-axis")

# User input:
x0 = int(input("Enter x0:"))
y0 = int(input("Enter y0:"))
x1 = int(input("Enter x1:"))
y1 = int(input("Enter y1:"))

# Calculate del x del y:
dx = x1-x0
dy = y1-y0
# Calculate decision parameter:
p = 2*dy-dx
# Initialize coordinate list and temp values:
x = x0
y = y0
xcoordinate = []
ycoordinate = []
# Main calculation:
while x <= x1:
    if p >= 0:
        xcoordinate.append(x)
        ycoordinate.append(y)
        y = y+1
        p = p+2*dy-2*dx
    else:
        xcoordinate.append(x)
        ycoordinate.append(y)
        p = p+2*dy
    x = x+1
# Plotting the valuesto the graph:
plt.plot(xcoordinate, ycoordinate)
plt.show()
# This code is modified by Saad Ahmed
