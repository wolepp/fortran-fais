program p24
    implicit none
    integer :: i, j
    real :: mala, duza, cala, mnoze1, mnoze2
    integer, parameter :: miesiac = 12, rok = 5
    integer, dimension(miesiac, rok) :: forsa

    do i=1, miesiac ! macierz "forsa" typu integer otrzymuje wartosci
        do j=1, rok
            forsa(i, j) = int( abs (sin (real(i) )) * j) *(-1)**i
        end do
    end do
    
    print *, forsa
    where (forsa.le.0) forsa =- forsa ! selektywna zmiana znaku
    where (forsa.eq.0) forsa = 1 ! likwidacja zer w macierzy
    mala = sum(forsa, forsa < 3)
    duza = sum(forsa, forsa >= 3)
    cala = sum(forsa)
    print *, "mala = ", mala, " duza = ", duza, " cala = ", cala
    print *, forsa

    mnoze1 = product(forsa) ! iloczyn wszystkich el macierzy
    mnoze2 = product(forsa, mask=forsa >= 3) ! iloczyn z maska logiczna

    print *, ' mnoze1 = ', mnoze1, ' mnoze2 = ', mnoze2
    stop
end program p24