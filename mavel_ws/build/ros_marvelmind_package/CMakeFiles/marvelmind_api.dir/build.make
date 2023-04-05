# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kimjaen/mavel_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kimjaen/mavel_ws/build

# Include any dependencies generated for this target.
include ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/depend.make

# Include the progress variables for this target.
include ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/progress.make

# Include the compile flags for this target's objects.
include ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/flags.make

ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.o: ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/flags.make
ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.o: /home/kimjaen/mavel_ws/src/ros_marvelmind_package/src/marvelmind_api.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kimjaen/mavel_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.o"
	cd /home/kimjaen/mavel_ws/build/ros_marvelmind_package && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.o   -c /home/kimjaen/mavel_ws/src/ros_marvelmind_package/src/marvelmind_api.c

ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.i"
	cd /home/kimjaen/mavel_ws/build/ros_marvelmind_package && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kimjaen/mavel_ws/src/ros_marvelmind_package/src/marvelmind_api.c > CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.i

ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.s"
	cd /home/kimjaen/mavel_ws/build/ros_marvelmind_package && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kimjaen/mavel_ws/src/ros_marvelmind_package/src/marvelmind_api.c -o CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.s

# Object files for target marvelmind_api
marvelmind_api_OBJECTS = \
"CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.o"

# External object files for target marvelmind_api
marvelmind_api_EXTERNAL_OBJECTS =

/home/kimjaen/mavel_ws/devel/lib/libmarvelmind_api.so: ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/src/marvelmind_api.c.o
/home/kimjaen/mavel_ws/devel/lib/libmarvelmind_api.so: ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/build.make
/home/kimjaen/mavel_ws/devel/lib/libmarvelmind_api.so: ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kimjaen/mavel_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library /home/kimjaen/mavel_ws/devel/lib/libmarvelmind_api.so"
	cd /home/kimjaen/mavel_ws/build/ros_marvelmind_package && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/marvelmind_api.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/build: /home/kimjaen/mavel_ws/devel/lib/libmarvelmind_api.so

.PHONY : ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/build

ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/clean:
	cd /home/kimjaen/mavel_ws/build/ros_marvelmind_package && $(CMAKE_COMMAND) -P CMakeFiles/marvelmind_api.dir/cmake_clean.cmake
.PHONY : ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/clean

ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/depend:
	cd /home/kimjaen/mavel_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kimjaen/mavel_ws/src /home/kimjaen/mavel_ws/src/ros_marvelmind_package /home/kimjaen/mavel_ws/build /home/kimjaen/mavel_ws/build/ros_marvelmind_package /home/kimjaen/mavel_ws/build/ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ros_marvelmind_package/CMakeFiles/marvelmind_api.dir/depend
