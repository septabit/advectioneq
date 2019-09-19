module grid
	implicit none

	contains
	subroutine set_grid(x,xmin,xmax)
		real, intent(inout), dimension(:) :: x
		real, intent(in) :: xmin, xmax
		real :: dx
		integer :: i

		dx = (xmax - xmin)/size(x)
		x(1) = xmin
		do i = 2,size(x)
			x(i) = x(i-1) + dx
		end do

	end subroutine set_grid

end module grid
