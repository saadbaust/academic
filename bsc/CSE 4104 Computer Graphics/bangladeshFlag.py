# This is a OPENGL GLUT code in python:
# Importing libraries:
from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *


def bresenhamCircle(x0, y0, radius):
    x = radius
    y = 0
    err = 0

    while x >= y:
        # Prottek quad er ekta kore point:
        glBegin(GL_POLYGON)  # gl polygons use korle fill hoie jabe:
        glColor(1.0, 0.0, 0.0)
        glVertex2f((x0 + x), (y0 + y))
        glVertex2f((x0 + y), (y0 + x))
        glVertex2f((x0 - y), (y0 + x))
        glVertex2f((x0 - x), (y0 + y))
        glVertex2f((x0 - x), (y0 - y))
        glVertex2f((x0 - y), (y0 - x))
        glVertex2f((x0 + y), (y0 - x))
        glVertex2f((x0 + x), (y0 - y))
        glEnd()
        y = y + 1
        err = err + 1 + 2*y
        if 2*(err-x) + 1 > 0:
            x = x - 1
            err = err + 1 - 2*x


def main():
    # Normal Line:
    glBegin(GL_POLYGON)
    glColor(0.0, 1.0, 0.0)
    glVertex2i(50, 50)
    glVertex2i(450, 50)
    glVertex2i(450, 250)
    glVertex2i(50, 250)
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
    # glOrtho(0, 350, 0, 350, 0.0, 1.0)
    glOrtho(0, 500, 0, 500, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    # Color for grpah paper:
    glColor3f(1.0, 1.0, 1.0)
    main()
    bresenhamCircle(250, 150, 60)
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
