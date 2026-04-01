from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *

scale = 1
direction = 1

def display():
    global scale, direction
    glClear(GL_COLOR_BUFFER_BIT)
    glLoadIdentity()
    glOrtho(0, 500, 0, 500, -1, 1)

    glTranslatef(250, 250, 0)
    glScalef(scale, 1.5, 1)
    glTranslatef(-250, -250, 0)

    glColor3f(1, 0, 0)
    glBegin(GL_QUADS)
    glVertex2f(200, 200)
    glVertex2f(300, 200)
    glVertex2f(300, 300)
    glVertex2f(200, 300)
    glEnd()

    scale += 0.01 * direction
    if scale > 1.5 or scale < 0.5:
        direction *= -1

    glutSwapBuffers()
    glutTimerFunc(16, lambda x: glutPostRedisplay(), 0)

glutInit()
glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB)
glutInitWindowSize(500, 500)
glutCreateWindow(b"Scaling Animation")
glClearColor(1, 1, 1, 1)
glutDisplayFunc(display)
glutMainLoop()