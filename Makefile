CC         = g++
SDLCFLAGS  := $(shell sdl2-config --cflags)
CFLAGS     = -c -Wall -O2 $(SDLCFLAGS)
SDLLDFLAGS := $(shell sdl2-config --libs)
LDFLAGS    = $(SDLLDFLAGS)

SRCDIR     = src/
OBJECTDIR  = obj/
OUTPUTDIR  = ./

SOURCES    = $(SRCDIR)hello.cpp
OBJECTS    = $(patsubst $(SRCDIR)%.cpp,$(OBJECTDIR)%.o,$(SOURCES))
EXECUTABLE = $(OUTPUTDIR)hello


all: $(SOURCES) $(EXECUTABLE)

run: $(EXECUTABLE)
	$(EXECUTABLE)

clean:
	rm -fv $(OBJECTDIR)*
	rm -fv $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

$(OBJECTS): | $(OBJECTDIR)

$(OBJECTDIR):
	@mkdir -p $@

$(OBJECTDIR)%.o : $(SRCDIR)%.cpp
	@echo $< 
	$(CC) $(CFLAGS) -c $< -o $@


