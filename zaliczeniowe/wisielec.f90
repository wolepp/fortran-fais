program wisielec
   implicit none
   integer, parameter :: liczba_slow=2139, najdluzsze_slowo=30, max_zle_litery=10, &
   & prog_ostrzegania = 3
   integer :: i, j, dlugosc, wpisanych_liter, zle_litery
   real :: u
   character(len=najdluzsze_slowo), dimension(liczba_slow) :: wszystkie_slowa
   character(len=najdluzsze_slowo) :: slowo, buffer
   character, dimension(26) :: wpisane_litery
   character :: litera, nieznormalizowana_litera
   logical :: powtorzona_litera, celny_strzal
   logical, allocatable :: ktore_odgadniete(:)

   call init_random_seed()
   wpisanych_liter = 0
   zle_litery = 0

   ! czytanie wszystkich slow z pliku
   open (unit=16, file='slowa.txt', status='old')
   do i=1,liczba_slow
      read(16,*) wszystkie_slowa(i)
   end do
   close(16)

   ! losowanie slowa do wisielca
   do i=1,30
      call random_number(u)
   end do
   j = 1 + floor(liczba_slow * u)
   slowo = wszystkie_slowa(j)
   dlugosc = len_trim(slowo)

   allocate(ktore_odgadniete(dlugosc))
   ktore_odgadniete = .false.

   ! glowna petla gry
   call print_help()
   do while (any(ktore_odgadniete .eqv. .false.))
      ! wypisanie planszy
      call print_masked_word(slowo(:), ktore_odgadniete)

      ! obsluga inputu
      read(*, fmt="(A)") buffer
      if (trim(buffer) == ":quit") then
         print *, "Wyjscie z gry"
         exit
      else if (trim(buffer) == ":help") then
         call print_help()
      end if

      ! obsluga logiki gry
      nieznormalizowana_litera = buffer(1:1)
      if (is_letter(nieznormalizowana_litera) .eqv. .false.) then
         print *, nieznormalizowana_litera, " nie jest litera!"
         cycle
      end if
      litera = normalize_letter(nieznormalizowana_litera)
      call find_char_and_update_mask(slowo(:), litera, ktore_odgadniete, celny_strzal)
      call update_letters(wpisane_litery, litera, powtorzona_litera)

      if (powtorzona_litera) then
         cycle
      end if

      if (celny_strzal) then
         celny_strzal = .false.
         cycle
      end if

      zle_litery = zle_litery + 1
      if (zle_litery >= max_zle_litery) then
         print *, "Limit zlych liter zostal wyczerpany, koniec gry :-("
         exit
      else if (zle_litery + prog_ostrzegania > max_zle_litery) then
         write(*, fmt="(A,I3,A)") "Pozostalo: ", max_zle_litery - zle_litery, " prob!"
      end if
   end do

   write(*, fmt="(A, A)") "Slowo to ", slowo

   deallocate(ktore_odgadniete)
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

   subroutine print_masked_word(word, mask)
      implicit none
      character (len=*) :: word
      logical, dimension(:) :: mask
      integer :: i, dlugosc

      dlugosc = len_trim(word)
      do i=1,dlugosc
         if (mask(i) .eqv. .true.) then
            write(*, fmt="(A)", advance='no') word(i:i) // ' '
         else
            write(*, fmt="(A)", advance='no') '_ '
         end if
      end do
      write(*, *) ! znak nowej linii
   end subroutine


   subroutine find_char_and_update_mask(word, char, mask, found)
      implicit none
      character (len=*) :: word
      character :: char
      integer :: i, dlugosc
      logical, dimension(:) :: mask
      logical :: found

      dlugosc = len_trim(word)
      do i=1,dlugosc
         if (word(i:i) == char) then
            if (mask(i) .eqv. .false.) then
               found = .true.
               mask(i) = .true.
            else
               found = .false.
            end if
         end if
      end do
   end subroutine find_char_and_update_mask

   subroutine print_help()
      print *, 'Gra w wisielca. Losowo wybrane slowo z pliku slowa.txt'
      print *, 'Slowa ze slownika sjp.pl. Tylko rzeczowniki'
      print *, 'Slowa nie maja znakow diaktrycznych'
      print *, 'Nalezy wpisac litere i zatwierdzic enterem'
      print *, 'Mozliwe komendy:'
      print *, '    :quit - wychodzi z gry'
      print *, '    :help - wypisuje te pomoc'
   end subroutine

   subroutine update_letters(letters, letter, is_repeated)
   implicit none
   character, dimension(26) :: letters
   character :: letter
   logical, intent(out) :: is_repeated

   if (any(letters == letter)) then
      print *, letter, " bylo juz wpisane"
      is_repeated = .true.
   else
      wpisanych_liter = wpisanych_liter + 1
      letters(wpisanych_liter) = letter
      is_repeated = .false.
   end if
   end subroutine update_letters

   function is_letter(char) result(res)
      implicit none
      character :: char
      integer :: int_char
      logical :: res

      int_char = iachar(char)
      res = ((int_char >= 97 .and. int_char <= 122) &
      & .or. (int_char >= 65 .and. int_char <= 90))
   end function

   function normalize_letter(letter) result(normalized)
      implicit none
      character :: letter, normalized
      integer :: int_char

      int_char = iachar(letter)
      ! jezeli jest duza litera to zamien na mala
      if (int_char >= 65 .and. int_char <= 90) then
         int_char = int_char + 32
      end if
      normalized = achar(int_char)

   end function

end program wisielec
