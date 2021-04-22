program prog34
    implicit none
    real:: a, b, c

    interface ! deklaracja funkcji zewnetrznej poprzez interfejs
    ! interfejs zawiera informacje o typie funkcji i jej argumentow 
    function mean(x,y)
        implicit none
        real, intent(in):: x,y
        real:: mean
        ! mean=(x+y)/2 w interfejsie nie ma instrukcji wykonywalnych
        ! return
    end function mean
    end interface

    a=30 ; b=60 ; c=mean(a,b)
    write (*,*) "mean=", c
stop
end program prog34

! funkcja zewnetrzna, program wolajacy te funkcje musi zawierac interfejs
function mean(x,y)
    implicit none
    real, intent(in):: x,y
    real:: mean

    mean = (x + y) / 2 ! instrukcja wykonywalna
    return ! instrukcja wykonywalna
end function mean
