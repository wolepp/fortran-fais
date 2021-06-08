program z1
   implicit none
   integer, dimension(15) :: liczby
   integer :: i, k, suma_parzyste, suma_nieparzyste

   open (11, file="liczby-naturalne.txt", status="old", action="read", position="rewind")
   do i = 1, 15
      read (11, *) k
      liczby(i) = k
   end do

   suma_parzyste = sum(liczby, mask=mod(liczby, 2) == 0)
   suma_nieparzyste = sum(liczby, mask=mod(liczby, 2) == 1)

   write (unit=*, fmt="(A,I8)") "suma parzystych    = ", suma_parzyste
   write (unit=*, fmt="(A,I8)") "suma nieparzystych = ", suma_nieparzyste

   stop
end program z1
