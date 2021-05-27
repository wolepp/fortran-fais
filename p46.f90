module zawiera_funkcje_rekursywna
    implicit none
    public :: euclid

contains
    recursive function euclid(i1, i2) result(gcd)
        integer, intent(in) :: i1, i2
        integer :: gcd
        integer :: remainder
        remainder = mod(i1, i2)

        if (remainder == 0) then
            gcd = i2 ! gcd - najwiekszy wspolny dzielnik
            return
        else
            ! tu nastepuje wywolanie rekurencyjne - funkcja wola sama siebie
            ! liczymy reszte z dzielenia aktualnego dzielnika przez reszte z poprzedniego
            gcd = euclid(i2, remainder)
        end if

        ! odwrotna kolejnosc wydruku z funkcji rekurencyjnej: najpierw wydruk ostatnich dzialan,
        ! na koncu wydruk pierwszej iteracji
        write (*, fmt=897) i1, i2, remainder, gcd
897     format('reszta z dzielenia liczby =', I6, 2x, 'przez liczbe =', I4, 2x, 'daje reszte =', &
               I4, 2x, 'result =', I4)

        return
    end function euclid

end module zawiera_funkcje_rekursywna

program prog_46
    use zawiera_funkcje_rekursywna
    implicit none
    integer :: p, q
    print *, 'wprowadz liczbe naturalna do dzielenia "p"'
    read (unit=*, fmt=*) p
    print *, 'wprowadz dzielnik "q"'
    read (unit=*, fmt=*) q
    print *, euclid(p, q), ' to najwiekszy wspolny podzielnik zwracany przez euclid( p, q)'
    stop
end program prog_46
