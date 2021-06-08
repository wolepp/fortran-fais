program p3
    open(unit=66, file="data_1", status="old", action="write", position="append")
    ! status="old" zakłada że plik istnieje
    ! position="append" - dopisuje na końcu pliku - nie kasuje zawartości
    write(unit=66, fmt=*) "witaj"
    stop
end program p3