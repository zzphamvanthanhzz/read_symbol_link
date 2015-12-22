#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/inc/readlink.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=../xallocatorlib/lib/libxallocator.a ../zcommonlib/lib/libzcommon.a

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ../bin/readlink

../bin/readlink: ../xallocatorlib/lib/libxallocator.a

../bin/readlink: ../zcommonlib/lib/libzcommon.a

../bin/readlink: ${OBJECTFILES}
	${MKDIR} -p ../bin
	${LINK.cc} -o ../bin/readlink ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/inc/readlink.o: inc/readlink.cpp 
	${MKDIR} -p ${OBJECTDIR}/inc
	${RM} "$@.d"
	$(COMPILE.cc) -g -I../xallocatorlib/inc -I../zcommonlib/inc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/inc/readlink.o inc/readlink.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ../bin/readlink

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
