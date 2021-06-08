program prog32
    real :: r(5,5)
    call init_random_seed()
    call random_number(r) ! generacja 25 liczb pseudolosowych
    print *, r
contains
    subroutine init_random_seed()
        integer :: i, n, clock
        integer, dimension(:), allocatable :: seed

        call random_seed(size = n)
        print *, "size = ", n ! rozmiar wektora liczb poczatkowych moze byc
        ! mniejszy niz liczba generowanych liczb pseudolosowych w jednym wywolaniu
        allocate(seed(n))

        call system_clock(count=clock)
        print *, "clock = ", clock

        seed = clock + 37 * (/(i-1,i=1,n)/)
        call random_seed(put = seed)
        print *, "seed = ", seed
        deallocate(seed)
    end subroutine
end program ! nazwa programu moze byc pominieta