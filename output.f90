module output
	implicit none

contains
	subroutine outfile(nx, dx, u, istep, m)
		integer, intent(in) :: nx, m
		real, intent(in) :: dx, u(0:nx+1), istep
		integer :: i, iunit
		character(len=40) :: filename

		write(filename, "(a,i1.1,a,i5.5,a)") 'step',m,'_',int(istep),'.dat'

		print*,"Writing file", trim(filename)

		open(newunit=iunit, file=filename, status='replace')


		write(iunit,*) '#		x		u(x,t)'

		do i = 1,nx
			write(iunit,*) i*dx, u(i)
		enddo

		close(iunit)

	end subroutine outfile

end module output
