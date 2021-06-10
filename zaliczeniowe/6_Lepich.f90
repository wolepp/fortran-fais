program z6
   implicit none
   integer, parameter :: start = -3, end = 4
   real, parameter :: step = 0.001
   real :: x, y1, y2

   print *, "Miejsca zerowe: "
   x = -3
   y1 = f(x)
   do while (x < end)
      y2 = f(x)
      x = x + step
      if (y1*y2 < 0) then
         print *, x - step
      end if
      y1 = y2
   end do

contains
   function f(x) result(y)
      real, intent(in) :: x
      real :: y

      y = x**3 - 3*x**2 - 4*x + 12
   end function

end program z6
