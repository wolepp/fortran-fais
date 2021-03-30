program p23
    implicit none
    integer, dimension(2:5, 7:12, -5:4, 7, 2) :: macierz
    integer :: rozmiar, rozmiar1, rozmiar3, dolna_g, gorna_g
    macierz = 7

    rozmiar = size(macierz) ! calkowita liczba el. macierzy
    rozmiar1 = size(macierz, 1) ! liczba el. w 1 wymiarze
    rozmiar3 = size(macierz, 3) ! j.w.
    dolna_g = lbound(macierz, 2) ! dolna granica wskaznika w 2 wymiarze
    gorna_g = ubound(macierz, 2) ! gorna granica wsk w 2 wymiarze

    print *, "rozmiar = ", rozmiar, " rozmiar1 = ", rozmiar1, &
    " rozmiar3 = ", rozmiar3, " dolna_g = ", dolna_g, " gorna_g = ", gorna_g
    
    stop
end program p23