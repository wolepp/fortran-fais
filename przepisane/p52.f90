module Universal_Constants
   implicit none
   real, parameter::pi = 3.1415926536
end module Universal_Constants

real function trig_fun_degrees(trig_fun, degrees, minutes, seconds)
   use Universal_Constants
   implicit none

   real, external::trig_fun
   integer, intent(in)::degrees, minutes, seconds
   real::angle

   angle = (degrees + minutes/60.0 + seconds/3600.0)*pi/180.0

   trig_fun_degrees = trig_fun(angle)
end function trig_fun_degrees

program test_for_trig_fun_degrees
   implicit none
   real, intrinsic::sin, cos, tan
   real, external::trig_fun_degrees
   integer::degs, mins, secs
   character::answer

   do
      print *, "please give an angle in degrees, minutes and seconds"
      print *, "without any fractional parts "
      print *, "degrees"
      read *, degs
      print *, "Minutes(0-59)"
      read *, mins
      print *, "Seconds(0-59)"
      read *, secs

      print *, "its sine is ", trig_fun_degrees(sin, degs, mins, secs)
      print *, "its cosine is ", trig_fun_degrees(cos, degs, mins, secs)
      print *, "its tangent is ", trig_fun_degrees(tan, degs, mins, secs)

      print *, "another one? (Y/N)"
      read *, answer

      if (answer /= "Y" .AND. answer /= "y") EXIT

   end do
end program test_for_trig_fun_degrees
