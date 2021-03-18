program p12
    implicit none
    ! integer mogacy pomiescic liczby z zakresu
    ! -10**15 < n < 10**15
    integer, parameter :: range = SELECTED_INT_KIND(15)
    integer(kind = range) :: suma, n

    print *, "range = ", range
    suma = 0_range
    n = 0_range

    do
        n = n+1
        if (n>1234567890) exit
        if (n==55) cycle ! cos jak continue w C
        if (n.eq.122) cycle ! operator .eq. dziala jak ==
        if (n>=20 .and. n.le.30) cycle 
        if (n.ge.20 .and. n<=30) cycle
        suma = suma + n
    end do
    
    print *, "suma: ", suma
end program p12