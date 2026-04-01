from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *

tx, ty = 200, 200      
direction = "right"     

def display():
    global tx, ty, direction
    glClear(GL_COLOR_BUFFER_BIT)
    glLoadIdentity()
    glOrtho(0, 500, 0, 500, -1, 1)

    glTranslatef(tx, ty, 0)

    glColor3f(1, 1, 0)
    glBegin(GL_QUADS)
    glVertex2f(0, 0)
    glVertex2f(100, 0)
    glVertex2f(100, 100)
    glVertex2f(0, 100)
    glEnd()

    if direction == "right":
        tx += 2
        if tx >= 300:
            direction = "up"
    elif direction == "up":
        ty += 2
        if ty >= 300:
            direction = "left"
    elif direction == "left":
        tx -= 2
        if tx <= 200:
            direction = "down"
    elif direction == "down":
        ty -= 2
        if ty <= 200:
            direction = "right"

    glutSwapBuffers()
    glutTimerFunc(16, lambda x: glutPostRedisplay(), 0)

glutInit()
glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB)
glutInitWindowSize(500, 500)
glutCreateWindow(b"Square Path Animation (with glTranslatef)")
glClearColor(1, 1, 1, 1)
glutDisplayFunc(display)
glutMainLoop()