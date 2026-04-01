# This program is DDA Line Drawing Algorithm:

# Import Library:
import matplotlib.pyplot as plt

# Labeling for graph paper:
plt.title("DDA Line Drawing Aalgorithm")
plt.xlabel("X-axis")
plt.ylabel("Y-axis")

# User input starting and ending point:
x0 = int(input("Enter x0:"))
y0 = int(input("Enter y0:"))
x1 = int(input("Enter x1:"))
y1 = int(input("Enter y1:"))

# Finding del x and del y:
dx = abs(x1-x0)
dy = abs(y1-y0)

# Finding number of steps:
step = max(dx, dy)

# Finding increament value:
xinc = dx/step
yinc = dy/step

# For ploting and temp data:
x = float(x0)
y = float(y0)
xcoordinate = []
ycoordinate = []

# Main calculation:
for i in range(step):
    # Appending coordinates to list:
    xcoordinate.append(x)
    ycoordinate.append(y)
    x = x+xinc
    y = y+yinc
# Plotting coordinates to graph paper:
plt.plot(xcoordinate, ycoordinate)
plt.show()
# This code is modified by Saad Ahmed