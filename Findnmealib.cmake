# - Try to find NMEA library
# Once done this will define
#
#  NMEALIB_FOUND - system has NMEA library
#  NMEALIB_INCLUDE_DIR - the NMEA include directory
#  NMEALIB_LIBRARIES - Libraries needed to use NMEA
#  NMEALIB_DEFINITIONS - Compiler switches required for using NMEA

# Copyright (c) 2012 Ralf Habacker <ralf.habacker@freenet.de>
# See Copyright.txt or http://www.cmake.org/HTML/Copyright.html for details.

IF (NMEALIB_INCLUDE_DIR AND NMEALIB_LIBRARIES)
  # Already in cache, be silent
  SET(NMEALIB_FIND_QUIETLY TRUE)
ENDIF (NMEALIB_INCLUDE_DIR AND NMEALIB_LIBRARIES)

FIND_PATH(NMEALIB_INCLUDE_DIR nmea/nmea.h)

SET(POTENTIAL_NMEALIB_LIBS libnmea nmealib nmea)
FIND_LIBRARY(NMEALIB_LIBRARIES NAMES ${POTENTIAL_NMEALIB_LIBS})

IF (NMEALIB_INCLUDE_DIR AND NMEALIB_LIBRARIES)
   SET(CMAKE_REQUIRED_INCLUDES "${NMEALIB_INCLUDE_DIR}" "${CMAKE_REQUIRED_INCLUDES}")
   set (NMEALIB_FOUND true)
ENDIF (NMEALIB_INCLUDE_DIR AND NMEALIB_LIBRARIES)

IF (NMEALIB_FOUND)
  IF (NOT NMEALIB_FIND_QUIETLY)
    MESSAGE(STATUS "Found NMEA: ${NMEALIB_LIBRARIES}")
  ENDIF (NOT NMEALIB_FIND_QUIETLY)
ELSE (NMEALIB_FOUND)
  IF (NMEALIB_FIND_REQUIRED)
    MESSAGE(STATUS "Looked for NMEA libraries named ${POTENTIAL_NMEALIB_LIBS}.")
    MESSAGE(STATUS "Found no acceptable NMEA library. This is fatal.")
    MESSAGE(FATAL_ERROR "Could NOT find NMEA")
  ENDIF (NMEALIB_FIND_REQUIRED)
ENDIF (NMEALIB_FOUND)

MARK_AS_ADVANCED(NMEALIB_INCLUDE_DIR NMEALIB_LIBRARIES)