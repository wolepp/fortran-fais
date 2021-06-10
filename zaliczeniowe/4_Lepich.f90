program prog33
   implicit none
   integer, parameter :: rdp = selected_real_kind(15)
   integer, parameter :: idp = selected_int_kind(15)
   real(kind=rdp) :: xx, yy, calka_moja, delta
   real(kind=rdp) :: pi = 3.14159265358979323846264338327950288_rdp
   integer(kind=idp) :: i, wewnatrz
   integer, parameter :: max_do = 1000000_idp
   integer :: wartosc_calki = 2

   call init_random_seed()

   wewnatrz = 0
   do i = 1, max_do
      call random_number(xx)
      call random_number(yy)
      xx = xx*pi ! rozszerz zakres z [0, 1] do [0, pi]
      if (yy < sin(xx)) wewnatrz = wewnatrz + 1
   end do

   calka_moja = (real(wewnatrz)/real(max_do))*pi
   delta = abs((wartosc_calki - calka_moja)/wartosc_calki)
   print *
   print *, "calka_moja= ", calka_moja, "blad wzgledny = ", delta
   stop

contains
   subroutine init_random_seed()
      integer :: i, n, clock
      integer, dimension(:), allocatable :: seed

      call random_seed(size=n)
      allocate (seed(n))

      call system_clock(count=clock)

      seed = clock + 37*(/(i - 1, i=1, n)/)
      call random_seed(put=seed)

      deallocate (seed)
   end subroutine
end program prog33
