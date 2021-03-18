program p13
    implicit none
    integer, parameter :: st=8
    integer :: r, s
    logical, dimension(10, 10) :: k1, k2 ! macierze z wartosciami logicznymi
    ! prawda -> .true.   falsz -> .false., na wydruku jako "T" lub "F"
    logical, dimension(11:20, 11:20) :: m ! taki sam rozmiar jak k1 i k2
    ! z elementami numerowanymi od 11 do 20, nie od 1 do 10
    complex, dimension(1:10, 2+st) :: z, c ! macierze zespolone
    character(len=10), dimension(1:3) :: napisy ! wektor 3 elemntow

    do r=1,10
        do s=1,10
            if (r==s) then
                k1(r,s) = .true.
            else
                k1(r,s) = .false.
            end if
        end do
    end do
    k2 = k1
    m = k2

    print *, m
    print *
    do s=11,20
        print *, (m(s,r),r=11,20,1)
    end do
    
    stop
end program p13