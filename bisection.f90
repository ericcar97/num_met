program bisection
    implicit none
    integer, parameter :: pr = 8
    real(kind = pr) :: x_min, x_max, tolerance
    !range
    x_min = 0.8_pr 
    x_max = 1.4_pr
    tolerance = 10e-5_pr
    call BisectionMethod(x_min, x_max, tolerance)

contains
    subroutine BisectionMethod(x_min, x_max, tolerance)
        real(kind = pr), intent(inout) :: x_min, x_max, tolerance
        real(kind = pr) :: x_med
        integer         :: i = 1, max_iterations 
        max_iterations = int((log(abs(x_max - x_min)) - log(tolerance)) / 2._pr)
        if(sign(1._pr,f(x_min)) == sign(1._pr,f(x_max))) then
            write(*,*) 'Wrong range'
        else
            x_med = x_max
            do while(abs(f(x_med)) > tolerance)
                if(sign(1._pr,f(x_min)) == sign(1._pr,f(x_med))) then
                    x_min = x_med
                else
                    x_max = x_med
                end if
                x_med = (x_max + x_min) / 2._pr
                write(*,*) i, x_med, f(x_med)
                i = i + 1 
                
            end do
        end if
    end subroutine

    !Sample function

    function f(x)
        real(kind = pr)             :: f
        real(kind = pr), intent(in) :: x
        f = 2._pr*x - tan(x)
    end function
end program
