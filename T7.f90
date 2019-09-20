program T7
	use output
	use grid
	use init
	use step
	implicit none
	real :: v,dt,dx,tmax, istep,t
	integer, parameter :: nx = 100
	real :: x(nx),xmin,xmax,u(nx)
	integer :: method 

!	setting variables
	v = 1.
	tmax = 1
	dx = 1./nx  
	dt = (dx*0.5)/v 
	x(nx) = 0 
	xmin = 0
	xmax = 1

!	Choose your method!
	do   
		print*, "Enter which method you'd like to use:"
		print*, "1: Upwind,2: Lax"
		read(*,*) method
		if (method == 1 .or. method == 2) then
			exit
		end if
		print*, "Please try again, this time with an actual value you can use."
	end do

!	Call functions to set grid and initial values!
	call set_grid(x,xmin,xmax) !creating x array
	call set_initial(x,u)

!	Step in whichever method you want to use!
	t = 0
	tmax = 1
	istep = 0
	call outfile(nx, dx, u, istep,1) 
	do while (t<tmax)
		t = t + dt
		call u_advance(x,u,v,dt,dx,method)
		istep = istep +1
		call outfile(nx, dx, u, istep,1)
	end do

end program
