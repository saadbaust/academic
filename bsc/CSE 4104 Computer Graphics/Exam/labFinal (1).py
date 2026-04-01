from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import math

def bresenhamLine(x0, y0, x1, y1):
    dx = x1 - x0
    dy = y1 - y0
    p = 2 * dx - dy
    x = x0
    y = y0
    glVertex2f(x, y)
    while y < y1:
        if p >= 0:
            x = x + 1
            p = p + 2 * dx - 2 * dy
        else:
            p = p + 2 * dx
        y = y + 1
        glVertex2f(x, y)


def ddaline(x1, y1, x2, y2):
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
    glBegin(GL_POLYGON)
    glColor3f(1, 0, 0)
    for i in range(500):
        angle = i * 2 * (math.pi / 100)

        glVertex2f(xo + (math.cos(angle) * rad), yo + (math.sin(angle) * rad))

    glEnd()


def main():
    # 1st Question:
    # Flag:
    glBegin(GL_POLYGON)
    glColor(0.0, 1.0, 0.0)
    glVertex2i(20, 55)
    glVertex2i(60, 55)
    glVertex2i(60, 75)
    glVertex2i(20, 75)
    glEnd()
    # Normal Line:
    glBegin(GL_LINES)
    glColor(1.0, 1.0, 0.5)
    glVertex2i(15, 80)
    glVertex2i(20, 80)
    glEnd()
    # Bresenham Line:
    glBegin(GL_POINTS)
    glColor(1.0, 1.0, 1.0)
    bresenhamLine(20, 10, 20, 80)
    glEnd()
    # DDA Line:
    glBegin(GL_POINTS)
    glColor(1.0, 0.0, 1.0)
    ddaline(15, 10, 15, 80)
    glEnd()
    # Polygon:
    glBegin(GL_POLYGON)
    glColor(0.0, 0.0, 1.0)
    glVertex2i(10, 5)
    glVertex2i(25, 5)
    glVertex2i(25, 10)
    glVertex2i(10, 10)
    glEnd()


def showScreen():
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    glViewport(0, 0, 500, 500)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(0, 90, 0, 90, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    glColor3f(1.0, 1.0, 1.0)
    main()
    bresenhamCircle(40, 65, 5)
    glFlush()
    glutSwapBuffers()


glutInit()
glutInitDisplayMode(GLUT_RGBA)
glutInitWindowSize(500, 500)
glutInitWindowPosition(0, 0)
wind = glutCreateWindow("Demo")
glutDisplayFunc(showScreen)
glutIdleFunc(showScreen)
glutMainLoop()
