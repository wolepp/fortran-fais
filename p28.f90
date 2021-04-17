program p28
    implicit none
    character(len=6) :: a, b, c, d
    print *, 'Type string: 123456789 and press enter'! 
    read '(a8, t1, a4, t7, a6, t4, a)', a, b, c, d
    ! a8 - wczytaj do zmiennej 'a' 8 znakow, ale zmienna 'a' ma dlugosc 6
    ! t1 - nastepnie czytaj od 1 znaku
    ! a4 - wczytaj do zmiennej 'b' 4 znaki, ale zmienna 'b" ma dlugosc 6
    ! t7 - nastepnie czytaj od 7 znaku
    print '(5x, a8, 5x, a4, 5x, a, 5x, a6)', a, b, c, d
    print '(5x, a, 5x, a, 5x, a, 5x, a1)', a, b, c, d
end program p28