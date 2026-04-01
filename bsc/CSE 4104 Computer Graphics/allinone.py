# This is a OPENGL GLUT code in python:
# Importing libraries:
from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import math


def bresenhamLine(x0, y0, x1, y1):  # Breseham Algorithm for line drawing:
    dx = x1 - x0
    dy = y1 - y0
    # Calculate decision parameter:
    p = 2 * dy - dx
    x = x0
    y = y0
    glVertex2f(x, y)
    # Main calculation:
    while x <= x1:
        if p >= 0:
            y = y + 1
            p = p + 2 * dy - 2 * dx
        else:
            p = p + 2 * dy
        x = x + 1
        glVertex2f(x, y)


def ddaline(x1, y1, x2, y2):  # ddaline Algorithm for line drawing:
    dx = abs(x2 - x1)
    dy = abs(y2 - y1)
    step = max(dx, dy)
    x, y = x1, y1
    xinc = dx / step
    yinc = dy / step
    glVertex2f(x, y)
    for i in range(step):
        x = x + xinc
        y = y + yinc
        glVertex2f(x, y)


def bresenhamCircle(xo, yo, rad):
    angle = 0

    # Begin drawing a polygon
    glBegin(GL_POLYGON)
    glColor3f(1, 0, 0)

    # Loop through 100 points to form the circle
    for i in range(500):
        angle = i * 2 * (math.pi / 100)

        # Calculate x and y coordinates based on the angle and radius
        glVertex2f(xo + (math.cos(angle) * rad), yo + (math.sin(angle) * rad))

    glEnd()


def main():
    # Normal Line:
    glBegin(GL_LINES)
    glColor(1.0, 0.0, 0.0)
    glVertex2i(50, 50)
    glVertex2i(100, 50)
    glEnd()
    # Bresenham Line:
    glBegin(GL_POINTS)
    glColor(1.0, 1.0, 0.0)
    bresenhamLine(50, 100, 150, 100)
    glEnd()
    # DDA Line:
    glBegin(GL_POINTS)
    glColor(1.0, 0.0, 1.0)
    ddaline(200, 100, 300, 100)
    glEnd()
    # Bresenham Circle:
    # glBegin(GL_POINTS)
    # glColor(0.5, 1.0, 1.0)
    # bresenhamCircle(100, 200, 30)
    # glEnd()


# End of code


def showScreen():
    # Clear screen:
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    glViewport(0, 0, 500, 500)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    # Graph paper measurement:
    # glOrtho(0, 350, 0, 350, 0.0, 1.0)
    glOrtho(0, 500, 0, 500, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    # Color for grpah paper:
    glColor3f(1.0, 1.0, 1.0)
    main()
    bresenhamCircle(100, 200, 30)
    glFlush()
    glutSwapBuffers()


# Main Function:
glutInit()
glutInitDisplayMode(GLUT_RGBA)
glutInitWindowSize(500, 500)
glutInitWindowPosition(0, 0)
wind = glutCreateWindow("Demo")
glutDisplayFunc(showScreen)
glutIdleFunc(showScreen)
glutMainLoop()
# End of code
