program prog42
    ! sortowanie ze swapem
    implicit none
    real :: a, b, c

    write (unit = *, fmt = *) " please enter three numbers to be sorted."
    read (unit = *, fmt = *) a, b, c
    write (unit = *, fmt = *) " thank you. you have entered: ", a, b, c
    if (a > b) call swap(a, b)
    if (a > c) call swap(a, c)
    if (b > c) call swap(b, c)
    write (unit = *, fmt = *) " the numbers in increasing order are: ", a, b, c
    stop
    
    contains
        subroutine swap( x, y )
            real, intent(in out) :: x, y
            real :: aux

            aux = x ! zmienna "aux" przechowuje wartosc zmiennej "x"
            x = y ! zmienna "x" przyjmuje wartosc zmiennej "y"
            
            y = aux ! zmienna "y" przyjmuje wartosc zmiennej "x" 
            return
        end subroutine swap
    
end program prog42
    