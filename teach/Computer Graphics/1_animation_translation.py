from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *

t = 0 
direction = 1

def display():
    
    global t, direction
    glClear(GL_COLOR_BUFFER_BIT)
    glLoadIdentity()
    glOrtho(0, 500, 0, 500, -1, 1)

    glTranslatef(t, 0, 0)

    # glTranslatef(0, t, 0)

    glColor3f(0, 0, 0)
    glBegin(GL_QUADS)
    glVertex2f(200, 200)
    glVertex2f(300, 200)
    glVertex2f(300, 300)
    glVertex2f(200, 300)
    glEnd()

    t = t + 2 * direction
    if t > 150 or t < -50:
        direction *= -1

    glutSwapBuffers()
    glutTimerFunc(16, lambda x: glutPostRedisplay(), 0)

glutInit()
glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB)
glutInitWindowSize(500, 500)
glutCreateWindow(b"Translation Animation")
glClearColor(1, 1, 1, 1)
glutDisplayFunc(display)
glutMainLoop()