module zawiera_procedure_Summit
    implicit none
    contains
        subroutine Summit(array)
        real, intent (in), dimension (:,:) :: array
        write (unit=*,fmt=*) "row sums: ", sum(array,dim=2) ! wydruk sumy
        ! w wierszach macierzy
        write (unit=*,fmt=*) "column sums: ", sum(array,dim=1) ! wydruk sumy w kolumnach
        write (unit=*,fmt=*) "total: ", sum(array) ! suma wszystkich elementow macierzy
        return ; end subroutine Summit
end module zawiera_procedure_Summit

program prog39
    use zawiera_procedure_summit; implicit none
    real, allocatable, dimension(:,:) :: a
    ! deklaracja dwuwymiarowej macierzy "a" o niezdefiniowanym rozmiarze
    integer :: n
    open (unit=1, file="x.txt", status="old", action="read", position="rewind")
    ! wczytanie danych z pliku "x.txt"
    ! np:
    ! 2
    ! 1. 3. 5. 7.
    ! lub
    ! 2
    ! 1 3 5 7
    ! w tym wypadku liczby integer 1 3 5 7 zostana automatycznie przekonwertowane do typu real 1. 3. 5. 7.

    read (unit=1, fmt=*) n ! wczytujemy rozmiar macierzy, tutaj wspolny dla obu wymiarow
    allocate (a(n, n)) ! rezerwacja pamieci dla macierzy kwadratowej "a"
    read (unit=1, fmt=*) a ! wczytanie wartosci wszystkich elementow macierzy "a"
    call summit (a) ; stop
end program prog39
