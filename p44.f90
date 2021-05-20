program prog44
    ! square root by newton's method.
    implicit none
    integer, parameter :: real12 = selected_real_kind( 12 )
    real(kind = real12) :: x
    real(kind = real12):: root = 1.0 ! 1.0 jako pierwsza przyblizona wartosc
    real(kind = real12), parameter :: tolerance = 1.0e-10_real12
    ! start program prog45
    write (*, *) " please enter the number whose square root is wanted. "
    read (*, *) x
    x = abs( x ) ! algorytm wymaga zeby x >= 0
    do while (abs( root ** 2 / x - 1.0) > tolerance )
        write (*, *) root
        root = 0.5 * (root + x / root)
    end do
    write (*, *) " square root of: ", x, " is: ", root
    stop
end program prog44