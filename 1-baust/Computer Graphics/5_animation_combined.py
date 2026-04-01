from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import math

w, h = 500, 500
angle = 0

def draw_square():
    glColor3f(1, 1, 0)
    glBegin(GL_QUADS)
    glVertex2f(100, 100)
    glVertex2f(200, 100)
    glVertex2f(200, 200)
    glVertex2f(100, 200)
    glEnd()

def combined_animation():
    global angle
    cx, cy = 150, 150
    glPushMatrix()
    # Translation along a sine wave
    glTranslatef(math.sin(angle / 20) * 150, 0, 0)
    # Rotation around center
    glTranslatef(cx, cy, 0)
    glRotatef(angle, 0, 0, 1)
    glTranslatef(-cx, -cy, 0)
    # Scaling
    s = abs(math.sin(angle / 40)) + 0.5
    glTranslatef(cx, cy, 0)
    glScalef(s, s, 1)
    glTranslatef(-cx, -cy, 0)

    draw_square()
    glPopMatrix()

    angle += 2

def iterate():
    glViewport(0,0,w,h)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(0, w, 0, h, 0, 1)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()

def showScreen():
        # Background color
    glClearColor(1, 1, 1, 1)
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    iterate()
    combined_animation()
    glutSwapBuffers()
    glutTimerFunc(16, lambda x: glutPostRedisplay(), 0)

glutInit()
glutInitDisplayMode(GLUT_RGBA)
glutInitWindowSize(w, h)
glutCreateWindow("Combined Animation")
glutDisplayFunc(showScreen)
glutMainLoop()