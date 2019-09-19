module step
	implicit none

	contains
	subroutine u_advance(x,u,v,dt,dx,method)
		real, intent(inout), dimension(:) :: x, u
		real :: dt, dx, v
		real :: u_old(size(u))
		    integer :: nx, method
		integer :: i


		nx = size(x)
		u_old = u
		if (method == 1) then
			do i = 2,nx
				u(i) = u_old(i) - (v*dt/dx)*(u_old(i)-u_old(i-1))
			end do
			u(1) = u_old(1) - (v*dt/dx)*(u_old(1)-u_old(nx))
		end if
		if (method == 2) then
			do i = 2,nx
				u(i) = u_old(i) - (v*dt/dx)*(0.5*(u_old(i+1)-u_old(i-1))-(v*0.5*dt/dx)*(u_old(i+1) - 2*u(i) + u(i-1)))
			end do
		end if


	end subroutine u_advance

end module step
