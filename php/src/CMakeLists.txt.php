
<?php
	/*
	*  @brief gnu make file
	*  @file CMakeLists.txt.php
	*  @date Sat, Sep 20, 2025  9:26:21 PM
	*  @version 0.0.1
	*/
    $APPNAME=$argv[1];
    $DATE=date(DATE_RFC2822);
	$VERSION="0.0.1";
	$INFO="auto generated with ccsk, create class skeleton";
    ?>
# @name     <?php echo "$APPNAME\n"; ?>
# @file:    CMakeLists.txt
# @date:    <?php echo "$DATE\n"; ?>
# @version: <?php echo "$VERSION\n"; ?>

cmake_minimum_required(VERSION 3.28.3)
project(scanner)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

#set(BUILD_SHARED_LIBS YES)

if(CMAKE_SYSTEM_NAME STREQUAL "CYGWIN")
    message(STATUS "Building under Cygwin, defining CYGWIN macro")
    add_definitions(-DCYGWIN)
endif()

add_executable(<?php echo "$APPNAME\n"; ?>
    src/<?php echo "$APPNAME"; ?>.cpp
    src/main.cpp
)


add_library(<?php echo "$APPNAME"; ?>_a STATIC
    src/<?php echo "$APPNAME"; ?>.cpp

)

#[=[
    # Add Library
    add_library(targetName [STATIC | SHARED | MODULE]
    [EXCLUDE_FROM_ALL]
    source1 [source2 ...]
)
]=]`

#[=[
install(TARGETS MyApp AlgoRuntime AlgoSDK
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)
]=]
