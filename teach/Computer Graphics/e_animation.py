# Import required OpenGL modules
from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *

x = 0
def update(value):
    global x
    x += 2
    if x > 300:
        x = 0
    glutPostRedisplay()
    glutTimerFunc(16, update, 0)

# Function to draw shapes
def draw():
    global x
    glClear(GL_COLOR_BUFFER_BIT)   # Clear the screen
    glLoadIdentity()               # Reset transformations

    # Set coordinate system (0,0) to (500,500)
    glOrtho(0, 500, 0, 500, -1, 1)

    glColor3f(0, 1, 0)
    glBegin(GL_QUADS)
    glVertex2f(100 + x, 100)
    glVertex2f(200 + x, 100)
    glVertex2f(200 + x, 200)
    glVertex2f(100 + x, 200)
    glEnd()

    glFlush()                      # Render now

# Main program setup
glutInit()                         # Initialize GLUT
glutInitWindowSize(500, 500)      # Set window size
glutCreateWindow("Simple OpenGL Shapes")  # Window title
glutDisplayFunc(draw)             # Set draw function
glutTimerFunc(0, update, 0)
glutMainLoop()                    # Start the main loop