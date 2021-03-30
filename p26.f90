program p26
    implicit none
    real :: maximal, minimal, il_skal
    integer, dimension(2, 3) :: matrix_A
    logical, dimension(2, 3) :: mask ! bedzie niejawnie uzywana
    ! w funkcjach operujacych na macierzy matrix_A
    !integer, dimension(3, 2) :: matrix_B
    !integer, dimension(2, 2) :: matrix_AB

    integer, dimension(3) :: vector_C
    integer, dimension(3) :: vector_D
    integer, dimension(6) :: vector_E

    integer, dimension(1:2) ::indeksy

    matrix_A(1, 1) = 1; matrix_A(1, 2) = 2; matrix_A(1, 3) = 3
    ! mozna po sredniku w jednej linii, ale kompilator przy bledzie
    ! pokaze tylko numer linii
    matrix_A(2, 1) = 4
    matrix_A(2, 2) = 5
    matrix_A(2, 3) = 6

    maximal = maxval(matrix_A)
    indeksy = maxloc(matrix_A)
    print *, "max matrix_A(", indeksy(1),",", indeksy(2),") ", maximal

    minimal = minval(matrix_A)
    indeksy = minloc(matrix_A)
    print *, "min matrix_A(", indeksy(1),",", indeksy(2),") ", minimal

    ! vector_e = pack(matrix_A, mask) drugim arg funkcji pack jest macierz mask
    vector_e = pack(matrix_A, .true.) ! wypakuj do wektora vector_E te elementy
    ! macierzy matrix_a, dla ktorych odpowiedni element macierzy logicznej mask
    ! ma wartosc .true.
    ! wszystkie elementy macierzy mask maja jawnie przypisana wartosc .true.
    print *
    print *, "vector_e = ", vector_E

    vector_C = pack(matrix_A, matrix_A <= 3) ! niejawnie tworzona z warunkiem
    vector_D = pack(matrix_A, matrix_A > 3) ! niejawnie tworzona z warunkiem
    il_skal = dot_product(vector_C, vector_D)
    print *
    print *, "vector_C = ", vector_C
    print *, "vector_D = ", vector_D
    print *, "iloczyn skalarny vector_c razy vector_D = ", il_skal

    stop
end program p26