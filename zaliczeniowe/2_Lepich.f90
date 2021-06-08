program z2
    implicit none
    integer :: lata, i
    real :: kwota_start, kwota, oprocentowanie

    kwota_start = 1000.
    kwota = kwota_start
    lata = 30
    oprocentowanie = 0.02

    do i = 1, lata
        kwota = kwota + kwota * oprocentowanie
    end do

    write(unit=*, fmt="(F7.2, A, I2, A, F4.2, A, F7.2)") & 
    & kwota_start, " po ", lata, " latach z oprocentowaniem ", oprocentowanie, " wynosi ", kwota

end program z2