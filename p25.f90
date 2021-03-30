program p25
    implicit none
    integer :: i, j
    integer, dimension(2, 3) :: matrix_A
    integer, dimension(3, 2) :: matrix_B
    integer, dimension(2, 2) :: matrix_AB
    integer, dimension(2) :: vector_C=(/1,2/) !inicjalizacja macierzy
    integer, dimension(3) :: vector_BC
    
    matrix_A(1, 1) = 1
    matrix_A(1, 2) = 2 ! matrixA : [1 2 3]
    matrix_A(1, 3) = 3 ! matrixA : [4 5 6]
    matrix_A(2, 1) = 4
    matrix_A(2, 2) = 5
    matrix_A(2, 3) = 6
    
    matrix_B = transpose(matrix_A) ! transpozycja macierzy
    ! [1 4]
    ! [2 5]
    ! [3 6]
    do i=1,3
        print *, (matrix_B(i, j), j=1,2)
    end do

    matrix_AB = matmul(matrix_A, matrix_B) ! mnozenie macierzy
    print *
    do i=1,2
        print *, (matrix_AB(i, j), j=1,2)
    end do

    vector_BC = matmul(matrix_B, vector_C) ! mnozenie macierzy przez wektor
    print *
    print *, vector_BC

    stop
end program p25