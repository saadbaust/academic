# This is a OPENGL GLUT code in python:

# Importing libraries:
from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import math

# Defining windows size:
w, h = 500, 500

def bresenhamCircle(xo, yo, rad):
    angle = 0
    glBegin(GL_POLYGON)
    glColor3f(1, 0, 0)
    for i in range(500):
        angle = i * 2 * (math.pi / 100)

        glVertex2f(xo + (math.cos(angle) * rad), yo + (math.sin(angle) * rad))

    glEnd()

def main():
    # Triangle
    glBegin(GL_TRIANGLES)
    glColor(0, 0, 1)
    glVertex2f(5, 5)
    glVertex2f(25, 5)
    glVertex2f(15, 25)
    glEnd()
    bresenhamCircle(15, 11.2, 6.2)
# End of code


def iterate():
    glViewport(0, 0, 500, 500)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    # Graph paper measurement:
    glOrtho(0, 30, 0, 30, 0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()


def showScreen():
    # Clear screen:
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    iterate()
    # Color for grpah paper:
    glColor3f(1.0, 0.0, 3.0)
    main()
    glutSwapBuffers()


# Main Function:
glutInit()
glutInitDisplayMode(GLUT_RGBA)
glutInitWindowSize(500, 500)
glutInitWindowPosition(0, 0)
wind = glutCreateWindow("OpenGL Coding Practice")
glutDisplayFunc(showScreen)
glutIdleFunc(showScreen)
glutMainLoop()