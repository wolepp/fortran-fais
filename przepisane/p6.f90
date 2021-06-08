program p6
    implicit none
    character(10) :: date
    character(2) :: month

    write(unit=*, fmt=*) "napisz date w formacie yyyy-mm-dd"
    read(unit=*, fmt=*) date
    ! * to stdout przy write i stdin w read
    month=date(6:7)
    write(unit=*,fmt="(A10)") month

    select case(month)
    case("03":"05") ! month z wartosciami 3, 4 lub 5
        write(unit=*,fmt="(A12)") "to wiosna"
    case("06","07","08")
        write(unit=*,fmt="(A12)") "to lato"
    case default
        write(unit=*,fmt="(A25)") "to nie wiosna ani lato"
    end select

    stop
end program p6