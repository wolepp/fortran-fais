program p4
    implicit none
    real :: a,b
    integer :: c
    open(unit=66, file="data_in", status="old", action="read", position="rewind")
    read(unit=66, fmt=*) a,b,c
    write(unit=*, fmt="(A8, F6.3, T40, A5, ES12.4, A6, I8)") & 
    "a rowne", a, "b rowne", b, "c=", c

    ! formatowanie znakow przez fmt
    ! A8 - 8 znakow alfanum
    ! F6.3 - real 6 miejsc, 2 na ceche, 1 kropka, 3 mantysa
    ! T40 - tabulator o 40 znakow w prawo
    ! A5 to 5 znak na tekst
    ! ES12.4 - real z 12 znakami, np. -.12345E-154
    ! I8 - osiem cyfr integer
    stop
end program p4
