#define GLEW_STATIC
#include <GL/glew.h>
#ifdef __APPLE__
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>
#else
#include <GL/glu.h>
#include <GL/gl.h>
#endif

// SDL headers
#include <SDL_main.h>
#include <SDL.h>
#include <SDL_opengl.h>

int main() {
	return 0;
}
