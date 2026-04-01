from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import math

# Window size
w, h = 1200, 400

# ------------------- Scene 1: Walking Person -------------------
person_x = 100
person_speed = 2
moving_right = True
building1_x, building2_x = 50, 300
building_y = 50
building_width, building_height = 80, 150

def draw_building(x, y, width, height, lit=False):
    if lit:
        glColor3f(1.0, 1.0, 0.5)
    else:
        glColor3f(0.5, 0.5, 0.5)
    glBegin(GL_QUADS)
    glVertex2f(x, y)
    glVertex2f(x + width, y)
    glVertex2f(x + width, y + height)
    glVertex2f(x, y + height)
    glEnd()

    # Windows
    glColor3f(0.2, 0.2, 0.2)
    for i in range(3):
        for j in range(4):
            wx = x + 10 + j*15
            wy = y + 10 + i*30
            glBegin(GL_QUADS)
            glVertex2f(wx, wy)
            glVertex2f(wx+10, wy)
            glVertex2f(wx+10, wy+20)
            glVertex2f(wx, wy+20)
            glEnd()

def draw_person_scene1():
    glColor3f(0, 0, 1)
    glBegin(GL_QUADS)
    glVertex2f(person_x, building_y - 30)
    glVertex2f(person_x + 20, building_y - 30)
    glVertex2f(person_x + 20, building_y - 10)
    glVertex2f(person_x, building_y - 10)
    glEnd()

# ------------------- Scene 3: Ball Between Walls -------------------
ball_x3 = 800
ball_y3 = 100
ball_radius3 = 15
ball_speed_x3 = 4
ball_speed_y3 = 0
gravity3 = -0.5
jump_speed3 = 12
left_wall = 800
right_wall = 1100
ground_y3 = 50

def draw_ball(x, y, radius=15):
    glColor3f(1, 0, 0)
    glBegin(GL_TRIANGLE_FAN)
    glVertex2f(x, y)
    for angle in range(0, 361, 10):
        rad = math.radians(angle)
        glVertex2f(x + radius * math.cos(rad), y + radius * math.sin(rad))
    glEnd()

def draw_walls():
    glColor3f(0.3, 0.3, 0.3)
    # Left wall
    glBegin(GL_QUADS)
    glVertex2f(left_wall - 5, 0)
    glVertex2f(left_wall, 0)
    glVertex2f(left_wall, h)
    glVertex2f(left_wall - 5, h)
    glEnd()
    # Right wall
    glBegin(GL_QUADS)
    glVertex2f(right_wall, 0)
    glVertex2f(right_wall + 5, 0)
    glVertex2f(right_wall + 5, h)
    glVertex2f(right_wall, h)
    glEnd()

# ------------------- Display -------------------
def display():
    global person_x, moving_right
    global ball_x3, ball_y3, ball_speed_x3, ball_speed_y3

    glClear(GL_COLOR_BUFFER_BIT)
    glLoadIdentity()
    glOrtho(0, w, 0, h, -1, 1)

    # Background sky
    glColor3f(0.5, 0.8, 1.0)  # blue sky
    glBegin(GL_QUADS)
    glVertex2f(0, 0)
    glVertex2f(w, 0)
    glVertex2f(w, h)
    glVertex2f(0, h)
    glEnd()

    # Ground for scene 1
    glColor3f(0.3, 0.7, 0.2)  # green
    glBegin(GL_QUADS)
    glVertex2f(0, 0)
    glVertex2f(400, 0)
    glVertex2f(400, building_y)
    glVertex2f(0, building_y)
    glEnd()

    # Ground for scene 3
    glColor3f(0.3, 0.7, 0.2)
    glBegin(GL_QUADS)
    glVertex2f(700, 0)
    glVertex2f(w, 0)
    glVertex2f(w, ground_y3)
    glVertex2f(700, ground_y3)
    glEnd()

    # ===== Scene 1: Walking Person =====
    lit1 = abs(person_x - building1_x) < 30
    lit2 = abs(person_x - building2_x) < 30
    draw_building(building1_x, building_y, building_width, building_height, lit1)
    draw_building(building2_x, building_y, building_width, building_height, lit2)
    draw_person_scene1()
    if moving_right:
        person_x += person_speed
        if person_x + 20 >= building2_x:
            moving_right = False
    else:
        person_x -= person_speed
        if person_x <= building1_x:
            moving_right = True

    # ===== Scene 3: Ball Between Walls =====
    draw_ball(ball_x3, ball_y3, ball_radius3)
    draw_walls()
    ball_speed_y3 += gravity3
    ball_y3 += ball_speed_y3
    ball_x3 += ball_speed_x3
    if ball_y3 - ball_radius3 <= ground_y3:
        ball_y3 = ground_y3 + ball_radius3
        ball_speed_y3 = jump_speed3
    if ball_x3 + ball_radius3 >= right_wall:
        ball_x3 = right_wall - ball_radius3
        ball_speed_x3 *= -1
    if ball_x3 - ball_radius3 <= left_wall:
        ball_x3 = left_wall + ball_radius3
        ball_speed_x3 *= -1

    glutSwapBuffers()
    glutTimerFunc(16, lambda x: glutPostRedisplay(), 0)

# ------------------- Main -------------------
glutInit()
glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB)
glutInitWindowSize(w, h)
glutCreateWindow(b"Merged Scenes: Person & Ball Between Walls")
glutDisplayFunc(display)
glutMainLoop()
