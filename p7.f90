program p7
    implicit none
    character(16) :: a,b,c,d
    
    a = "a kindly gigant"
    b = "a small man"
    c = b(:8)//"step" ! konkatenacja
    d = "for a"//b(8:)
    b = " "//d(:3)//b(9:11)//a(3:6)
    a=a(:2)//a(10:15)//"leap"
    print *, "your first name"
    read *,a
    print *, "your second name"
    read *,b
    print *, a, b, "student"
    print *, trim(a), " ", trim(b), " student"
    ! trim przycina spacje z konca tekstu
    
    stop
end program p7