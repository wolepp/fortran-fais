module moje_procedury_i_funkcje
    implicit none
    public:: Input, Temp_c, Output
    contains
        subroutine Input(f_temp)
        real, intent(out):: f_temp
        write(unit=*, fmt=*) "please enter the Fahrenheit temperature: "
        read (unit=*, fmt=*) f_temp
        return ; end subroutine input

    function temp_c(f_temp) result (temp_c_r)
    ! wynik dzialania funkcji nie jest zwracany przez jej nazwe "temp_c", ale przez parametr "temp_c_r"
        real, intent(in) :: f_temp ; real :: temp_c_r
        real, parameter :: t_scale = 1.8, offset = 32.0
        ! wartosci zadeklarowanych jako parameter nie mozna juz zmieniac, zmiana implikuje error
        temp_c_r = (f_temp - offset) / t_scale
        ! konwersja temperatury w stopniach fahrenheit'a na temperature w skali celsjusza
    return ; end function temp_c

    subroutine output (f_temp, temp_c_r)
        real, intent(in):: f_temp, temp_c_r
        write(unit=*,fmt=*) f_temp, "degrees Fahrenheit", temp_c_r, "degrees Celsius"
        write(unit=*,fmt=*) int(f_temp), "degrees Fahrenheit", int(temp_c_r), "degrees &
            & Celsius"

        ! funkcja wbudowana "int" konwertuje liczbe real na integer - obcina czesc ulamkowa
        write(unit=* ,fmt=*) nint(f_temp), "degrees Fahrenheit", nint(temp_c_r), "degrees &
            & Celsius"
        ! funkcja wbudowana "nint" (nearest integer) konwertuje liczbe real na integer przez zaokraglenie
        ! do najblizszej liczby integer
    return ; end subroutine output

end module moje_procedury_i_funkcje