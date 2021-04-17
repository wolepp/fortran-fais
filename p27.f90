program p27
    implicit none
    real, dimension(10, 10, 21, 21) :: x ! 44100 elementów
    real, dimension(0:9, 0:9, -10:10, -10:10) :: y
    real, dimension(11:20, -9:0, 0:20, -20:0) :: z, v, diff
    integer :: i, j, k, l

    y = 1.0 ; z=2.0
    do i=1, size(x, 1)
        do j=1, size(x, 2)
            do k=1, size(x, 3)
                do l=1, size(x, 4)
                    x(i, j, k, l) = y(i-1, j-1, k-11, l-11) + z(i+10, j-10, k-1, l-21)
                end do
            end do
        end do
    end do

    print *, x
    ! v=y + z ! ten sam efekt
    ! diff= x-v ! roznica powinna byc zerowa
    ! print *, diff 

end program p27