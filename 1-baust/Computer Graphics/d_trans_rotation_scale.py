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

    # Apply translation (move the square 100 units to the right and 50 units up)
    glTranslatef(300, 50, 0) # (Angle, X, Y, Z axis)

    # Apply rotation (rotate 45 degrees around the Z-axis)
    glRotatef(45, 0, 0, 1)  # (Angle, X, Y, Z axis)

    # Apply scaling (scale 2x along X and Y axes)
    glScalef(1.5, 1.5, 0)  # (X scale, Y scale, Z scale)

    glColor3f(1, 1, 0)  # Yellow color
    glBegin(GL_QUADS)
    glVertex2f(100, 100)
    glVertex2f(200, 100)
    glVertex2f(200, 200)
    glVertex2f(100, 200)
    glEnd()

    glFlush()                      # Render now

# Main program setup
glutInit()                         # Initialize GLUT
glutInitWindowSize(500, 500)      # Set window size
glutCreateWindow("Simple OpenGL Shapes")  # Window title
glutDisplayFunc(draw)             # Set draw function
glutMainLoop()                    # Start the main loop