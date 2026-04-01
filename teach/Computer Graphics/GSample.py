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

    # Draw yellow square
    glColor3f(1, 1, 0)             # Yellow color
    glBegin(GL_QUADS)
    glVertex2f(100, 100)
    glVertex2f(200, 100)
    glVertex2f(200, 200)
    glVertex2f(100, 200)
    glEnd()

    # Draw blue triangle
    glColor3f(0, 0, 1)             # Blue color
    glBegin(GL_TRIANGLES)
    glVertex2f(250, 100)
    glVertex2f(350, 100)
    glVertex2f(350, 200)
    glEnd()

    # Draw red polygon (pentagon)
    glColor3f(1, 0, 0)             # Red color
    glBegin(GL_POLYGON)
    glVertex2f(100, 250)
    glVertex2f(200, 250)
    glVertex2f(200, 350)
    glVertex2f(150, 400)
    glVertex2f(100, 350)
    glEnd()

    glFlush()                      # Render now

# Main program setup
glutInit()                         # Initialize GLUT
glutInitWindowSize(500, 500)      # Set window size
glutCreateWindow("Simple OpenGL Shapes")  # Window title
glutDisplayFunc(draw)             # Set draw function
glutMainLoop()                    # Start the main loop