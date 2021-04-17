program p31
    implicit none
    integer, parameter :: rdp = selected_real_kind(15) ! brak p i r oznacza domyslnie p
    real(kind=rdp) :: x, xx
    integer :: i

    do i=1,5
        call random_number(x) ! pseudolosowa liczba z zakresu 0 < x < 1
        call random_number(xx)
        print *, x, xx
    end do

    call init_random_seed() 
    print *
    do i=1,5
        call random_number(x) ! pseudolosowa liczba z zakresu 0 < x < 1
        call random_number(xx)
        print *, x, xx
    end do
    stop

    contains ! otwarcie bloku z funkcjami i procedurami wewnetrznymi
    subroutine init_random_seed()
        integer :: i, n, clock
        integer, dimension(:), allocatable :: seed

        call random_seed(size = n)
        print *, "size = ", n
        allocate(seed(n))
        call random_seed(get = seed)
        print *, "seed = ", seed
        call system_clock(count=clock)
        print *, "clock = ", clock
        seed = clock + 37 * (/ (i - 1, i = 1, n) /) !inicjalizacja wartosci
        ! poczatkowych generatora
        ! seed(1) = clock + 37 * 0, seed(2) = clock + 37 * 1, itd.
        call random_seed(put = seed)
        print *, "seed =", seed

        deallocate(seed)
    end subroutine
end program p31