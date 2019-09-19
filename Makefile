FC=gfortran
FFLAGS= -O3 -Wall -Wextra -std=f2008 -fdefault-real-8 -fdefault-double-8

SRC=grid.f90 init.f90 step.f90 output.f90 T7.f90
OBJ=${SRC:.f90=.o}

%.o : %.f90
	$(FC) $(FFLAGS) -c $< -o $@

T7: ${OBJ}
	$(FC) $(FFLAGS) -o $@ $(OBJ)

clean:
	rm -f *.o *.mod *.dat #*.png
