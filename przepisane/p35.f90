program prog35
    implicit none
    real::a, b, c, d, e, f

    interface
        subroutine root(rank, x, y)
            implicit none
                real,intent(in) :: rank,x
                real,intent(out) :: y
        end subroutine root
    end interface

    a=27 ; call root(3., a, b) ; write(*, *) "cube root of ", a, " equal ", b
    c=16 ; call root(4., c, d) ; write(*, *) "4-th root of ", c, " equal ", d
    e=1024 ; call root(10., e, f) ; write(*, *) "10-th root of ", e, " equal ", f

    stop
end program prog35

! procedura zewnetrzna
subroutine root(rank, x, y) ! procedura z 2 parametrami wejsciowymi "rank" i "x"
! 'i jednym parametrem wyjsciowym "y"
    implicit none
        real,  intent(in) :: rank, x ! parametry formalne wejsciowe
        real,  intent(out) :: y ! parametr formalny wyjsciowy
        y = exp(log(x)/rank)
    return
end subroutine root
