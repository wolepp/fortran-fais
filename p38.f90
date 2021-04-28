module zawiera_procedure_norm
    implicit none
    public :: norm
contains
    subroutine norm(v, total, flag)
        real, dimension(:), intent(in) :: v ! macierz wejsciowa o niezdefiniowanym rozmiarze
        real, intent(out) :: total
        logical, intent(out) :: flag

        total = sqrt(sum(v*v))
        ! sqrt - funkcja wbudowana (intrinsic function) - liczyr pierwiastek
        ! sum - funkcja wbudowana, sumuje elementy macierzy, mozna wskazac ktore
        ! moze dotyczyc wszystkich elementow, kolumny, wiersza lub moze byc wyselekcjonowane przez
        ! macierz logiczna mask, w formie powyzszej sumuje wszystkie elemementy
        ! v*v to wymnozenie odpowiednich elementow macierzy -
        ! podniesienie do kwadratu kazdego elementu - iloczyn skalarny macierzy daje funkcja product
        flag = (total>=1.0e5)
        return
    end subroutine norm
end module zawiera_procedure_norm

program prog38
    use zawiera_procedure_norm
    implicit none
    real, dimension(6), parameter :: & ! kontynuacja instrukcji w nastepnej linii
        v = (/10.0, 200.0, 3000.0, 40000.0, 500000.0, 6000000.0 /)
    real:: total ; logical :: flag

    write (unit=*, fmt="( 'wartosci macierzy v '  , 6(E10.3, 5X) )"  ) v
    ! reprezentacja liczby real cecha=czesc calkowita dludosci 0, mantysa=czesc ulamkowa 3 cyfrowa
    write (unit=*, fmt="( 'wartosci macierzy v '  , 6(E10.1, 5X) )"  ) v
    ! reprezentacja liczby real cecha=czesc calkowita dludosci 0, mantysa=czesc ulamkowa 1 cyfrowa
    write (unit=*, fmt="( 'wartosci macierzy v '  , 6(ES10.2, 5X) )"  ) v
    ! reprezentacja liczby real cecha=czesc calkowita w zakresie od 0 do 10
    ! mantysa=czesc ulamkowa 2 cyfrowa
    write (unit=*, fmt="( 'wartosci macierzy v '  , 6(EN12.4, 5X) )"  ) v
    ! reprezentacja liczby real: mnoznik potegi liczby 10 w postaci: 10**0, 10**3, 10**6, 10**9,........
    ! mantysa=czesc ulamkowa 4 cyfrowa, cala liczba zajmuje 12 pol
    ! deskryptory formatowania wydruku, str. 512 - 517

    call norm(v, total, flag)
    write (unit = *, fmt=77) total, flag ! wydruk wedlug formatu etykitowanego liczba nat. 77
    77 format("total, flag =", EN10.3, 2X, L3 ) ! L3 - 3 pola na wydruk wartosci logicznej (t lub f)

    goto 99999 ! skok bezwarunkowy do linii z etykieta 99999 (najwieksza mozliwa etykieta)
    print *, "tego wydruku nie zobaczysz"
    99999 continue

    if(flag .eqv. .true.) goto 99998 ! skok warunkowy do linii z etykieta 99998
        print *, "tego wydruku tez nie zobaczysz"
    99998 continue

    stop
end program prog38