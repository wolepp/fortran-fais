module nasze_zmienne ! definicja modulu uzywanego przez rozne bloki
    implicit none
    real :: rank, x, y
end module nasze_zmienne

program prog36 ! program korzysta z zewnetrznych blokow modul i procedura
    use nasze_zmienne ! uzywaj modulu "nasze_zmienne"

    interface ! interfejs do procedury zewnetrznej, zdefiniowanej za end program
    subroutine root()
    use nasze_zmienne
    end subroutine root
    end interface ! interfejs nie zawieral instrukcji wykonywalnych

    x = 1048576 ; rank = 20
    call root()
    write(*,*) "20-th root of ", x, " equal ", y
    stop
end program prog36

subroutine root() ! procedura bez parametrow formalnych
    use nasze_zmienne
    ! parametr wejsciowe "x" i "rank" oraz wynik "y" sa przekazywane przez modul
    y=exp(log(x)/rank) ! liczymy perwiastek stopnia "rank" z liczby "x"
    ! exp i log - funkcje wbudowane
    return
end subroutine root