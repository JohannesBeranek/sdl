CC         = g++
CFLAGS     = -c -Wall -O2
LDFLAGS    =

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
	@$(CC) $(CFLAGS) -c $< -o $@


