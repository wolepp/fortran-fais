program prog45

    ! metoda Newtona do znalezienia miejsca zerowego
    ! f(x) =exp(x)*ln(x)-x*x=0
    
    implicit none
    integer :: istep
    real :: a,b,dl,dx,x0,x1
    real :: fx,dfx ! funkcje zewnetrzne
    
    dl = 1.0e-06
    a = 1.0
    b = 2.0
    
    dx = b-a
    x0 = (a+b)/2.0
    istep = 0
    
    do while (abs(dx).gt.dl)
        x1 = x0-fx(x0)/dfx(x0)
        dx = x1-x0
        x0 = x1
        istep = istep+1
    end do
    
    write (6,"(I4,2F16.8)") istep,x0,dx
end program prog45
    
function fx(x) result (f)
    implicit none
    real :: f
    real, intent (in) :: x

    f = exp(x)*alog(x)-x*x
end function fx

function dfx (x) result (df)
    implicit none
    real :: df
    real, intent (in) :: x
    ! pierwsza pochodna
    df = exp(x)*(alog(x)+1.0/x)-2.0*x
end function dfx