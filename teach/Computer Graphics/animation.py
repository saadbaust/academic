# -------------------------------
# OpenGL Animation Demonstration
# By: Saad Ahmed
# -------------------------------

from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import math

# Window size
w, h = 500, 500

# Animation variables
angle = 0          # for rotation
tx = 0             # for translation
scale = 1          # for scaling
color_step = 0     # for color animation
direction = 1      # for direction of motion


# -----------------------------------
# 1️⃣ Function: Draw basic shapes
# -----------------------------------
def draw_shapes():
    # Square
    glBegin(GL_QUADS)
    glColor3f(1, 1, 0)  # Yellow
    glVertex2f(100, 100)
    glVertex2f(200, 100)
    glVertex2f(200, 200)
    glVertex2f(100, 200)
    glEnd()

    # # Triangle
    # glBegin(GL_TRIANGLES)
    # glColor3f(0, 0, 1)  # Blue
    # glVertex2f(250, 100)
    # glVertex2f(350, 100)
    # glVertex2f(350, 200)
    # glEnd()

    # # Polygon
    # glBegin(GL_POLYGON)
    # glColor3f(1, 0, 0)  # Red
    # glVertex2f(100, 250)
    # glVertex2f(200, 250)
    # glVertex2f(200, 350)
    # glVertex2f(150, 400)
    # glVertex2f(100, 350)
    # glEnd()


# -----------------------------------
# 2️⃣ Function: Translation Animation
# -----------------------------------
def translation_animation():
    global tx, direction
    glPushMatrix()
    glTranslatef(tx, 0, 0)
    draw_shapes()
    glPopMatrix()

    # Move right and left
    tx += 1 * direction
    if tx > 150 or tx < -50:
        direction *= -1


# -----------------------------------
# 3️⃣ Function: Rotation Animation
# -----------------------------------
# def rotation_animation():
#     global angle
#     glPushMatrix()
#     glTranslatef(250, 250, 0)   # Rotate around center
#     glRotatef(angle, 0, 0, 1)
#     glTranslatef(-250, -250, 0)
#     draw_shapes()
#     glPopMatrix()

#     angle += 1
#     if angle > 360:
#         angle -= 360
def rotation_animation():
    global angle
    cx, cy = 150, 150  # center of the square
    glPushMatrix()
    glTranslatef(cx, cy, 0)   # move to center
    glRotatef(angle, 0, 0, 1) # rotate around center
    glTranslatef(-cx, -cy, 0) # move back
    draw_shapes()
    glPopMatrix()

    angle += 1
    if angle > 360:
        angle -= 360


# -----------------------------------
# 4️⃣ Function: Scaling Animation
# -----------------------------------
def scaling_animation():
    global scale, direction
    glPushMatrix()
    glTranslatef(250, 250, 0)
    glScalef(scale, scale, 1)
    glTranslatef(-250, -250, 0)
    draw_shapes()
    glPopMatrix()

    scale += 0.01 * direction
    if scale > 1.5 or scale < 0.5:
        direction *= -1


# -----------------------------------
# 5️⃣ Function: Color Animation
# -----------------------------------
def color_animation():
    global color_step
    glPushMatrix()
    r = abs(math.sin(color_step))
    g = abs(math.sin(color_step + 2))
    b = abs(math.sin(color_step + 4))
    glColor3f(r, g, b)

    glBegin(GL_QUADS)
    glVertex2f(150, 150)
    glVertex2f(350, 150)
    glVertex2f(350, 350)
    glVertex2f(150, 350)
    glEnd()
    glPopMatrix()

    color_step += 0.05


# -----------------------------------
# 6️⃣ Function: Combined Animation
# -----------------------------------
def combined_animation():
    global angle, tx
    glPushMatrix()
    glTranslatef(250 + math.sin(angle / 20) * 100, 250, 0)
    glRotatef(angle, 0, 0, 1)
    glScalef(abs(math.sin(angle / 40)) + 0.5, abs(math.sin(angle / 40)) + 0.5, 1)
    draw_shapes()
    glPopMatrix()
    angle += 2


# -----------------------------------
# 7️⃣ Screen Setup
# -----------------------------------
def iterate():
    glViewport(0, 0, w, h)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(0.0, w, 0.0, h, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()


# -----------------------------------
# 8️⃣ Display Function
# -----------------------------------
mode = 2  # change 1–5 to choose different animation
import time  # at the top
def showScreen():
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    iterate()

    # Background color
    glClearColor(1, 1, 1, 1)

    # Choose animation
    if mode == 1:
        translation_animation()
    elif mode == 2:
        rotation_animation()
    elif mode == 3:
        scaling_animation()
    elif mode == 4:
        color_animation()
    elif mode == 5:
        combined_animation()

    glutSwapBuffers()
    # Slow down animation to ~60 FPS
    time.sleep(0.016)  # 1/60th of a second


# -----------------------------------
# 9️⃣ Main Function
# -----------------------------------
glutInit()
glutInitDisplayMode(GLUT_RGBA)
glutInitWindowSize(w, h)
glutInitWindowPosition(100, 100)
wind = glutCreateWindow("OpenGL Animation Types - Python")
glutDisplayFunc(showScreen)
glutIdleFunc(showScreen)
glutMainLoop()
