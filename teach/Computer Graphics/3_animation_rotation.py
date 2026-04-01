from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *

angle = 0

def display():
    global angle
    glClear(GL_COLOR_BUFFER_BIT)
    glLoadIdentity()
    glOrtho(0, 500, 0, 500, -1, 1)

    # Along own axis
    glTranslatef(250, 250, 0)
    glRotatef(angle, 0, 0, 1)
    glTranslatef(-250, -250, 0)

    # Along origin 
    # glRotatef(angle, 0, 0, 1)

    # Draw blue square
    glColor3f(1, 1, 0)
    glBegin(GL_QUADS)
    glVertex2f(200, 200)
    glVertex2f(300, 200)
    glVertex2f(300, 300)
    glVertex2f(200, 300)
    glEnd()

    # Update angle
    angle += 1
    if angle > 360:
        angle -= 360

    glutSwapBuffers()
    glutTimerFunc(16, lambda x: glutPostRedisplay(), 0)

# Setup window
glutInit()
glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB)
glutInitWindowSize(500, 500)
glutCreateWindow(b"Rotation Animation")
glClearColor(1, 1, 1, 1)
glutDisplayFunc(display)
glutMainLoop()
