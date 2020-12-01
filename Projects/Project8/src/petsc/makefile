-include ../petscdir.mk
CFLAGS           =
FFLAGS           =
CPPFLAGS         =
FPPFLAGS         =
LOCDIR           = src/ksp/ksp/tutorials/
DIRS             = network
EXAMPLESC        = petsc_ex.c
MANSEC           = KSP
CLEANFILES       = rhs.vtk solution.vtk
NP               = 1
DIRS             = amrex

include ${PETSC_DIR}/lib/petsc/conf/variables
include ${PETSC_DIR}/lib/petsc/conf/rules

include ${PETSC_DIR}/lib/petsc/conf/test
