module zawiera_funkcje_Large
    implicit none
    public :: Large

    contains
    function Large(list, k) result(large_r)
    ! funkcja zwraca wynik przez parametr formalny "Large_r"
        integer, intent(in), dimension(:) :: list ! macierz wejsciowa, rozmiar jeszcze nieznany
        integer,intent(in) :: k ! parametr formalny wejsciowy
        integer:: large_r ! parametr formalny zwracajacy wynik dzialania procedury

        ! start function large
        if(any (list<=k)) then
            large_r = maxval(list, mask=(list<=k))
            ! wartosc najwieksza sposrod tych elementow macierzy "list", ktore sa mniejsze/rowne "k"
        else ! jesli zaden z elementow macierzy "list" nie jest mniejszy/rowny "k" to:
            large_r = k
        end if
    return
    end function large

end module zawiera_funkcje_large

program prog37
    use zawiera_funkcje_large
    implicit none
    integer :: n, k
    integer, allocatable, dimension(:) :: list

    do ! petla nieskonczona
        print *, 'podaj rozmiar macierzy "list" '
        read(unit=*, fmt=*) n

        if(n<=0) then
            exit
        end if

        allocate(list(n)) ! alokacja pamieci dla macierzy "list"
        print *, "podaj wartosci n-elementowej macierzy oddzielajac &
            & spacjami lub w nowej linii"

        read(unit=*,fmt=*) list

        print *, "podaj liczbe 'k' "
        read(unit=*,fmt=*) k

        print *, "najwiekszy element macierzy ""list"" sposrod mniejszych lub rownych liczbie ""k"" "
        ! podwoijny cudzyslow w tekscie ograniczonym podwojnym cudzuslowem drukujemy powtarzajac go 2x
        write(unit=*,fmt=*) large (list,k)
        deallocate(list)
    end do

    stop
end program prog37