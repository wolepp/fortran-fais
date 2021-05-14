program prog41
    use funkcja_korzysta_z_procedury
    implicit none

    integer, parameter :: value = 789 ! tej wartosci nie mozna juz zmieniac, jest ustalonym
                                      ! parametrem
    type(new) :: exter
    integer :: inter

    ! start program prog42

    exter=module_function()
    print *, "exter = ", exter
    inter=internal_function( )
    print *, "inter = ", inter

    contains
    function internal_function( ) result( internal_function_r )
        integer :: internal_function_r
        ! start function internal_function
        internal_function_r = value
        ! to jest funkcja wewnetrzna programu, zwraca wynik nie przez swoja nazwe "internal_function”
        ! ale przez zmienna "internal_function_r", ktora jest parametrem "result"
    end function internal_function
end program prog41
