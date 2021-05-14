program prog40
    use moje_procedury_i_funkcje; implicit none
    real :: fahr
    call Input(fahr) ! wywolanie procedury "input", jej definicja jest udostepniona przez "use nazwaa modulu"

    call Output(fahr, temp_c(fahr)) ! wywolanie procedury "output”, drugim argumentem
    ! aktualnym jest wartosc zwracana przez funkcje "temp_c" - parametrami procedur moga byc funkcje!
stop ; end program prog40

module funkcja_korzysta_z_procedury
    implicit none
    public :: module_function, module_subroutine
    type, public :: new
        integer :: j, k ! typ wlasny "new" sklada sie z dwoch liczb calkowitych
    end type new
    ! inicjalizacja x konstruktorem
    type (new), public :: x = new( 1234, 5678 )
    ! przypisanie wartosci zmiennej "x" typu wlasnego "new"
    ! public - zmienne z tym atrybutem sa dostepne w zakresie bloku przywolujacego modul
    ! private -zmienne z tym atrybutem sa dostepne tylko wewnatrz modulu, ktory je definiuje
    ! subprogram part

    contains 
    function module_function( ) result( module_function_r )
        type (new) :: module_function_r ! wartosc zwracana przez funkcje to 2 liczby integer
        call internal_subroutine( module_function_r )
        return

        contains
        subroutine internal_subroutine( u ) ! internal subprogram
            type (new), intent(out) :: u
            u = new( 22, 11 )
            call module_subroutine( u % j, u % k)
            return
        end subroutine internal_subroutine
    end function module_function

    subroutine module_subroutine( i1, i2 ) ! module subprogram
        integer, intent (in out) :: i1, i2
        integer :: x
        x = i1
        i1 = i2
        i2 = x ! swap - zamiana pierwszego elementu z drugim w zmiennej typu wlasnego "new"
        return
    end subroutine module_subroutine
end module funkcja_korzysta_z_procedury
