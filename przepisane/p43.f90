module zawiera_funkcje_search
    implicit none
    public :: search
    contains

    function search( list, key ) result( search_r )
        character (len = *), dimension(:), intent(in) :: list
        ! deklaracja zmiennej tekstowej o niezdefiniowanej dlugosci (len = *)
        character (len = *), intent(in) :: key
        integer, dimension(2) :: search_r
        integer :: middle, last
        ! start function search
        last = size( list ) ! zwraca rozmiar macierzy "list"
        search_r(1) =0
        search_r(2) = last + 1
        do  while (search_r(2) - search_r(1) > 1)
            middle = (search_r(1) + search_r(2)) / 2
            if (list(middle) == key) then
                search_r = middle ! assign scalar "middle" to both vector elements.
                exit
            else if (list(middle) > key) then
                search_r(2) = middle
            else
                search_r(1) = middle
            end if
        end do

        ! porownywanie tekstow
        ! znaki sa zakodowane w rozny sposob, ale mozna przyjac ze jest nastepujacy
        ! porzadek w znakach:
        ! a < b < c < .. < y < z
        ! A < B < C < .. < Y < Z
        ! 0 < 1 < 2 < .. < 8 < 9
        
        return
    end function search
end module zawiera_funkcje_search
    
program prog43
    ! poszukiwanie binarne w uporzadkowanym array
    use zawiera_funkcje_search
    implicit none
    integer, parameter :: array_size = 20, name_length = 20
    character (len = name_length), dimension(0: array_size + 1) :: data_array
    ! macierz 22-elementowa, kazdy element to tekst 20-znakowy
    
    character (len = name_length) :: x
    integer :: loop, eof ! eof = end of file
    integer, dimension(2) :: ans ! deklaracja macierzy skladajacej sie z 2 liczb calkowitych
    
    ! start program prog43
    open (unit = 1, file = "words.txt", status = "old", action = "read", position = "rewind")
    
    do loop = 1, array_size
        read (unit = 1, fmt = *, iostat = eof) data_array(loop)
        if (eof < 0) then ! wczytuje elementy macierzy dopoki nie napotka znaku eof
            exit
        end if
    end do

    data_array(0) =" " !inicjalizacja pierwszego elementu macierzy "data_array"
    data_array(loop) = "ZZZZZZZZZZZZZZZZZZZZ" ! inicjalizacja ostatniego elementu macierzy

    write(*,*) "wprowadz tekst do znalezienia"
    read (unit = *, fmt = *) x
    ans = search( data_array(: loop - 1), x)
    write (unit = *, fmt = *) "found after element = ", data_array(ans(1) - 1)
    write (unit = *, fmt = *) "found in element = ", data_array(ans(2) - 1)
    stop
    
end program prog43
