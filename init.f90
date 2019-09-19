module init
	implicit none

	contains
	subroutine set_initial(x,u)
	real, intent(inout), dimension(:) :: x, u
	    integer :: nx
	integer :: i, option
	real, parameter :: pi = 4.*atan(1.0)

	nx = size(x)

	do   !Choosing which plot
		print*, "Please choose initial condition:"
		print*, "1: Step, 2: Sine"
		read(*,*) option
		if (option == 1 .or. option == 2) then
		exit
		end if

		print*, "Please try again, this time with an actual value you can use."
	end do

	if (option == 1) then
		!Creating the initial u array
		do i = 1,nx
			if (x(i) < 0.25) then
				u(i) = 0
			else if (x(i)<= 0.75) then
				u(i) = 1
			else
				u(i) = 0
			end if
		end do
	end if

	if (option == 2) then
		do i = 1,nx
			u(i) = sin(2*pi*x(i))
		end do
	end if

	end subroutine set_initial

end module init
