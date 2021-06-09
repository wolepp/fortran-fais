program z5
   implicit none
   integer, parameter :: word_length = 40
   character(len = word_length) :: slowo! = 'vzxcaeioxTWvuywAEIqwOUTWY' ! 12 samoglosek
   integer :: liczba_samoglosek

   open (11, file="dwanascie-samoglosek.txt", status="old", action="read", position="rewind")
   read(11, *) slowo

   call count_vowels(slowo, liczba_samoglosek)
   write (unit=*, fmt="(A,I3)") "liczba samoglosek = ", liczba_samoglosek

   stop
   contains
   subroutine count_vowels(word, vowels_count)
      implicit none
      character(len=word_length), intent(in) :: word
      integer, intent(out) :: vowels_count
      integer :: i
      character, dimension(12) :: vowels = & 
         &(/"a","e","i","o","u","y","A","E","I","O","U","Y"/)

      vowels_count = 0
      do i=1,40
         if (any(vowels==word(i:i))) vowels_count = vowels_count + 1
      end do

   end subroutine count_vowels
end program z5
