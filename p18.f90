program p18
    implicit none
    integer :: a, b
    real :: c, d

    print *, 'TYPE 123456789'
    read 101, a, b, c, d ! zmienne zostana wczytane wg formatu 101
    print 200, a, b, a-b, c, d, c-d ! wydruk wg formatu 200
    101 format(t6, i4, tl6, i4, tl6, f4.1, tl6, f4.2)
    ! t6 - czytaj poczawszy od znaku na 6. pozycji wzgledem poczatku linii
    ! tl6 - czytaj na 6 znakow w lewo od aktualnej pozycji
    ! tr4 - wydrukuj kolejny element o 4 znaki w prawo od aktualnej pozycji
    200 format(5x, i4, " minus", i15, " is ", i5, tr4, f6.2, &  ! kontynuuj
        " minus", f6.2, " is ", f8.3)
    
end program p18