program p9
    implicit none

    ! interfejs do funkcji zdefiniowanej na zewnatrz pgoramu
    interface 
        real function cube_root(x)
        end function cube_root
    end interface

    real :: a,b
    print *, "type a number: "
    read *, a
    b = cube_root(a)
    print *, "cube root of ", a, "is ", b
    stop
end program p9

real function cube_root(x)
! funkcja liczaca pierwiastek 3 stopnia zmiennej x
    implicit none
    real :: x,log_x
    log_x = log(x)
    cube_root = exp(log_x/3.0);
end function cube_root