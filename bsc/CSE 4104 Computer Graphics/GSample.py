# This is a OPENGL GLUT code in python:

# Importing libraries:
from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *


def main():
    # Code here

    # Square
    glBegin(GL_QUADS)
    glColor(1, 1, 0)
    glVertex2f(100, 100)
    glVertex2f(200, 100)
    glVertex2f(200, 200)
    glVertex2f(100, 200)
    glEnd()

    # Triangle
    glBegin(GL_TRIANGLES)
    glColor(0, 0, 1)
    glVertex2f(250, 100)
    glVertex2f(350, 100)
    glVertex2f(350, 200)
    glEnd()

    # Ploygon
    glBegin(GL_POLYGON)
    glColor(1, 0, 0)
    glVertex2f(100, 250)
    glVertex2f(200, 250)
    glVertex2f(200, 350)
    glVertex2f(150, 400)
    glVertex2f(100, 350)
    glEnd()
# End of code


def iterate():
    glViewport(0, 0, 500, 500)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    # Graph paper measurement:
    glOrtho(0.0, 500, 0.0, 500, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()


def showScreen():
    # Clear screen:
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    iterate()
    # Color for grpah paper:
    glColor3f(1.0, 1.0, 1.0)
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
