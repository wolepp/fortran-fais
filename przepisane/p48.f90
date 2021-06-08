module parametry_opcjonalne
   implicit none
   public :: options
contains
   subroutine options(str1, str2)
      character(len=*), intent(in), optional :: str1, str2
! procedura ma opcjonalne parametry formalne - mozna ja wywolac z 0/1/2 parametrami aktualnymi
      integer :: l1, l2
      write (unit=*, fmt=*) " ======================================== "

      if (present(str1)) then
         l1 = len(str1) ! zwraca dlugosc zmiennej tekstowej liczona w znakach
         write (unit=*, fmt=*) " 1: ", str1
      else
         l1 = -1
      end if
      if (present(str2)) then
         l2 = len(str2) ! zwraca dlugosc stringu
         write (unit=*, fmt=*) " 2: ", str2
      else
         l2 = -1
      end if
      write (unit=*, fmt=*) " lengths: ", l1, l2
      return
   end subroutine options
end module parametry_opcjonalne

program prog_48
   use parametry_opcjonalne
   implicit none

   call options()

   call options("pierwszy_parametr", "drugi_parametr")

   call options("pierwszy_parametr") ! jesli jest jeden parametr, to w domysle jest to str1

   call options(str1="333") ! mozna wskazac, ze to jest str1

   call options(str2="4444") ! jesli to ma byc str2 to trzeba wskazac na niego

   call options(str1="55555", str2="666666")

   call options(str1="")

   call options(str2="")

   call options(str2="drugi", str1="pierwszy") ! konieczne wskazanie - inna kolejnosc

   stop
end program prog_48
