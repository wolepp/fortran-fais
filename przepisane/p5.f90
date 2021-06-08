program p5
    implicit none
    integer :: i,k
    do i = 1,10
        do k = 1,12,5 ! krok=5, tzn k=1,6,11
            write(unit=*, fmt=*) i,k
        end do
    end do
    stop 
end program p5
