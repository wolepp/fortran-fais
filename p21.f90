program p21
    implicit none
    integer, dimension(5,3) :: macierz
    integer, dimension(15) :: wektor
    wektor = (/0,1,2,3,4,5,6,7,8,9,10,11,12,13,14/)
    macierz = RESHAPE(wektor, (/5,3/)) ! zmiana wektora na macierz 2-wymiarowa
    print *, macierz
    
    stop
end program p21