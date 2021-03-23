program p15
    implicit none
    real, dimension(2:10, -30:30, 0:10) :: t, y, tplusy
    t = 2.0 ! podstawienie do wszystkich elementow macierzy
    y = 3.0 ! j.w.
    tplusy = t + y ! operacja dodawania wartosci odpowiednich elementow
    ! macierze musza miec te same rozmiary
    print *, tplusy
    
    stop
end program p15