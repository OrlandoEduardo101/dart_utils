# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library

# Include any dependencies generated for this target.
include CMakeFiles/primitives_library.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/primitives_library.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/primitives_library.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/primitives_library.dir/flags.make

CMakeFiles/primitives_library.dir/primitives.c.o: CMakeFiles/primitives_library.dir/flags.make
CMakeFiles/primitives_library.dir/primitives.c.o: primitives.c
CMakeFiles/primitives_library.dir/primitives.c.o: CMakeFiles/primitives_library.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/primitives_library.dir/primitives.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/primitives_library.dir/primitives.c.o -MF CMakeFiles/primitives_library.dir/primitives.c.o.d -o CMakeFiles/primitives_library.dir/primitives.c.o -c /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library/primitives.c

CMakeFiles/primitives_library.dir/primitives.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/primitives_library.dir/primitives.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library/primitives.c > CMakeFiles/primitives_library.dir/primitives.c.i

CMakeFiles/primitives_library.dir/primitives.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/primitives_library.dir/primitives.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library/primitives.c -o CMakeFiles/primitives_library.dir/primitives.c.s

# Object files for target primitives_library
primitives_library_OBJECTS = \
"CMakeFiles/primitives_library.dir/primitives.c.o"

# External object files for target primitives_library
primitives_library_EXTERNAL_OBJECTS =

libprimitives.so.1.0.0: CMakeFiles/primitives_library.dir/primitives.c.o
libprimitives.so.1.0.0: CMakeFiles/primitives_library.dir/build.make
libprimitives.so.1.0.0: primitives.def
libprimitives.so.1.0.0: CMakeFiles/primitives_library.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library libprimitives.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/primitives_library.dir/link.txt --verbose=$(VERBOSE)
	$(CMAKE_COMMAND) -E cmake_symlink_library libprimitives.so.1.0.0 libprimitives.so.1 libprimitives.so

libprimitives.so.1: libprimitives.so.1.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate libprimitives.so.1

libprimitives.so: libprimitives.so.1.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate libprimitives.so

# Rule to build all files generated by this target.
CMakeFiles/primitives_library.dir/build: libprimitives.so
.PHONY : CMakeFiles/primitives_library.dir/build

CMakeFiles/primitives_library.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/primitives_library.dir/cmake_clean.cmake
.PHONY : CMakeFiles/primitives_library.dir/clean

CMakeFiles/primitives_library.dir/depend:
	cd /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library /home/orlando-eduardo101/IdeaProjects/dart_utils/primitives_library_ffi/primitives_library/CMakeFiles/primitives_library.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/primitives_library.dir/depend

