# This is a OPENGL GLUT code in python:
# Importing libraries:
from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *


def bresAlgo(x0, y0, x1, y1):  # Breseham Algorithm for line drawing:
    dx = x1-x0
    dy = y1-y0
    # Calculate decision parameter:
    p = 2*dy-dx 
    x = x0
    y = y0
    glVertex2f(x, y)
    # Main calculation:
    while x <= x1:
        if p >= 0:
            y = y+1
            p = p+2*dy-2*dx
        else:
            p = p+2*dy
        x = x+1
        glVertex2f(x, y)


def dda(x1, y1, x2, y2):  # DDA Algorithm for line drawing:
    dx = abs(x2 - x1)
    dy = abs(y2 - y1)
    step = max(dx, dy)
    x, y = x1, y1
    xinc = dx/step
    yinc = dy/step
    glVertex2f(x, y)
    for i in range(step):
        x = x+xinc
        y = y+yinc
        glVertex2f(x, y)


def main():
    # Drawing S
    glBegin(GL_LINES)
    glColor(1.0, 0.0, 0.0)
    bresAlgo(50, 100, 100, 100)
    glEnd()
    glBegin(GL_LINES)
    glColor(0.0, 1.0, 0.0)
    glVertex2f(100, 100)
    glVertex2f(100, 50)
    glEnd()
    glBegin(GL_LINES)
    glColor(0.0, 1.0, 0.0)
    glVertex2f(100, 50)
    glVertex2f(50, 50)
    glEnd()
    glBegin(GL_LINES)
    glColor(0.0, 1.0, 0.0)
    glVertex2f(50, 100)
    glVertex2f(50, 150)
    glEnd()
    glBegin(GL_LINES)
    glColor(0.0, 1.0, 0.0)
    glVertex2f(50, 150)
    glVertex2f(100, 150)
    glEnd()
    # Drawing A
    glBegin(GL_LINES)
    glColor(1.0, 0.0, 0.0)
    dda(175, 100, 225, 100)
    glEnd()
    glBegin(GL_LINES)
    glColor(1.0, 1.0, 0.0)
    glVertex2f(150, 50)
    glVertex2f(200, 150)
    glEnd()
    glBegin(GL_LINES)
    glColor(1.0, 1.0, 0.0)
    glVertex2f(250, 50)
    glVertex2f(200, 150)
    glEnd()
# End of code


def showScreen():
    # Clear screen:
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    glViewport(0, 0, 500, 500)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    # Graph paper measurement:
    glOrtho(0.0, 300, 0.0, 300, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    # Color for grpah paper:
    glColor3f(1.0, 1.0, 1.0)
    main()
    glutSwapBuffers()


# Main Function:
glutInit()
glutInitDisplayMode(GLUT_RGBA)
glutInitWindowSize(500, 500)
glutInitWindowPosition(0, 0)
wind = glutCreateWindow("Lab Mid Term")
glutDisplayFunc(showScreen)
glutIdleFunc(showScreen)
glutMainLoop()
