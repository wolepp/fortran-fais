module zawiera_liczenie_samoglosek
   implicit none
   public :: Count_vowels

contains
   subroutine Count_vowels(word, vowels_count)
      implicit none
      character(len=*), intent(in) :: word
      integer, intent(out) :: vowels_count
      integer :: i

      vowels_count = 0
      do i = 1, len(word)
         select case (word(i:i))
         case ("a", "e", "i", "o", "u", "y", "A", "E", "I", "O", "U", "Y")
            vowels_count = vowels_count + 1
         case default
            vowels_count = vowels_count
         end select
      end do
   end subroutine
end module zawiera_liczenie_samoglosek

program z5
   use zawiera_liczenie_samoglosek
   implicit none
   integer, parameter :: word_length = 40
   character(len=word_length) :: slowo
   integer :: liczba_samoglosek

   open (11, file="dwanascie-samoglosek.txt", status="old", action="read", position="rewind")
   read (11, *) slowo

   call count_vowels(slowo, liczba_samoglosek)
   write (unit=*, fmt="(A,I3)") "liczba samoglosek = ", liczba_samoglosek
   write (unit=*, fmt="(A,I3)") "dlugosc slowa = ", len(trim(slowo))

   stop
end program z5
