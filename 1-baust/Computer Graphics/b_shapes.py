# Import required OpenGL modules
from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *

# Function to draw shapes
def draw():
    glClear(GL_COLOR_BUFFER_BIT)   # Clear the screen
    glLoadIdentity()               # Reset transformations

    # Set coordinate system (0,0) to (500,500)
    glOrtho(0, 500, 0, 500, -1, 1)


    glBegin(GL_LINES)
    glColor3f(1, 0, 1)                 # Magenta color (R=1, G=0, B=1)
    glVertex2f(250, 250)               # Start point of line
    glVertex2f(450, 450)               # End point of line
    glEnd()

    glBegin(GL_QUADS)
    glColor3f(1, 1, 0)  # Yellow
    glVertex2f(100, 100)
    glVertex2f(200, 100)
    glVertex2f(200, 200)
    glVertex2f(100, 200)
    glEnd()

    glBegin(GL_TRIANGLES)
    glColor3f(0, 0, 1)  # Blue
    glVertex2f(250, 100)
    glVertex2f(350, 100)
    glVertex2f(300, 200)
    glEnd()

    glBegin(GL_POLYGON)
    glColor3f(1, 0, 0)  # Red
    glVertex2f(100, 300)
    glVertex2f(200, 300)
    glVertex2f(225, 375)
    glVertex2f(150, 450)
    glVertex2f(75, 375)
    glEnd()

    glFlush()                      # Render now

# Main program setup
glutInit()                         # Initialize GLUT
glutInitWindowSize(500, 500)      # Set window size
glutCreateWindow("Simple OpenGL Shapes")  # Window title
glutDisplayFunc(draw)             # Set draw function
glutMainLoop()                    # Start the main loop