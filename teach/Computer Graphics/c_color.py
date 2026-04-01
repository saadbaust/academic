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

    glBegin(GL_TRIANGLES)
    
    # Set color for each vertex
    glColor3f(1.0, 0.0, 0.0)  # Red at the first vertex
    glVertex2f(100, 100)
    
    glColor3f(0.0, 1.0, 0.0)  # Green at the second vertex
    glVertex2f(300, 100)
    
    glColor3f(0.0, 0.0, 1.0)  # Blue at the third vertex
    glVertex2f(200, 400)

    glEnd()

    glFlush()                      # Render now

# Main program setup
glutInit()                         # Initialize GLUT
glutInitWindowSize(500, 500)      # Set window size
glutCreateWindow("Simple OpenGL Shapes")  # Window title
glutDisplayFunc(draw)             # Set draw function
glutMainLoop()                    # Start the main loop