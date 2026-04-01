from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import math

t = 0

def display():
    global t
    glClear(GL_COLOR_BUFFER_BIT)
    glLoadIdentity()
    glOrtho(0, 500, 0, 500, -1, 1)

    # Color changes smoothly with time
    r = abs(math.sin(t))
    g = abs(math.sin(t + 2))
    b = abs(math.sin(t + 4))
    glColor3f(r, g, b)

    # Draw square
    glBegin(GL_QUADS)
    glVertex2f(200, 200)
    glVertex2f(300, 200)
    glVertex2f(300, 300)
    glVertex2f(200, 300)
    glEnd()

    # Update t for color cycle
    t += 0.05

    glutSwapBuffers()
    glutTimerFunc(16, lambda x: glutPostRedisplay(), 0)

# Setup window
glutInit()
glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB)
glutInitWindowSize(500, 500)
glutCreateWindow(b"Color Animation")
glClearColor(1, 1, 1, 1)
glutDisplayFunc(display)
glutMainLoop()