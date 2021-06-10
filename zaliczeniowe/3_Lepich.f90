program z3
   implicit none
   integer, parameter :: n_width = 14
   integer, parameter :: n_kind = selected_int_kind(n_width)
   ! potrzebna liczba bitow do zsumowania wszystkich liczb naturalnych
   ! mozliwych do przedstawienia w n_width bitach
   integer, parameter :: sum_kind = selected_int_kind(FLOOR(LOG( &
      & (2.**(n_width - 1))*(2**n_width - 1)), 2) + 1)

   integer(kind=n_kind) :: N1, N2
   integer(kind=sum_kind) :: suma

   N1 = 1
   N2 = 16312
   suma = rec_sum(N1, N2)

   write (unit=*, fmt="(A,I5,A,I5,A,I10)") "Suma liczb od ", N1, " do ", N2, " = ", suma

contains
   recursive function rec_sum(n1, n2) result(the_sum)
      integer(kind=n_kind), intent(in) :: n1, n2
      integer(kind=sum_kind) :: the_sum

      the_sum = n1
      if (n1 == n2) then
         return
      else
         the_sum = the_sum + rec_sum(n1 + 1, n2)
      end if
   end function

end program z3
