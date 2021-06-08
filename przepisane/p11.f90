program p11
    implicit none
    real :: suma, a_j
    real, parameter :: epsilon=10E-40 ! epsilon=1.0*10**(-40)

    ! epsilon = 1.0E-25 - error jesli zmieniamy parameter
    a_j = .99999
    suma = 0.0

    do ! petla nieskonczona z wyjsciem
        a_j = a_j * a_j
        suma = suma + a_j
        print *, a_j
        if (a_j < epsilon) exit ! warunek wyjscia
    end do

    print *, "suma = ", suma
    
    stop
end program p11