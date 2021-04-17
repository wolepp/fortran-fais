program p30
    implicit none
    real :: a
    double precision :: b
    integer :: c
    logical :: d
    character :: e

    ! zmienne rzeczywiste sparametryzowane
    ! p = precission number of meaning digits
    ! r = range minimum range of values: -10**30 < f << 10**30
    real(kind=selected_real_kind(p=6, r=30)) :: f
    real(kind=selected_real_kind(p=15, r=30)) :: g
    real(kind=selected_real_kind(p=15, r=1000)) :: h
    real(kind=selected_real_kind(p=18, r=1000)) :: i
    real(kind=selected_real_kind(p=18, r=2000)) :: j
    real(kind=selected_real_kind(p=18, r=4000)) :: k

    !! k=.012345678901234567 -10**4000 < k < 10**4000

    ! parametry kind moga byc rozne na roznych komputerach, ale gwarantuja
    ! wymagana precyzje i zakres wartosci zmiennych
    print *, 'type real kind=', kind(a)
    print *, 'type double precision kind=', kind(b)
    print *, 'type integer kind=', kind(c)
    print *, 'type logical kind=', kind(d)
    print *, 'type character kind=', kind(e)
    print *, 'p=6, r=30 kind=', kind(f)
    print *, 'p=15, r=30 kind=', kind(g)
    print *, 'p=15, r=1000 kind=', kind(h)
    print *, 'p=18, r=1000 kind=', kind(i)
    print *, 'p=18, r=2000 kind=', kind(j)
    print *, 'p=18, r=4000 kind=', kind(k)
    
end program p30