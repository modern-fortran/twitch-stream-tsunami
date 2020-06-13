module mod_diff
  ! Module for finite difference functions
  implicit none

  private
  public :: diff_upwind, diff_centered

contains

  function diff_upwind(x) result(diff)
    ! 1st order upwind finite difference of x
    ! with periodic boundary condition.
    real, intent(in) :: x(:)
    real :: diff(size(x))
    integer :: grid_size
    grid_size = size(x)
    diff(1) = (x(1) - x(grid_size)) ! boundary condition
    diff(2:grid_size) = (x(2:grid_size) - x(1:grid_size-1))
  end function diff_upwind

  function diff_centered(x) result(diff)
    ! 2nd order centered finite difference of x
    ! with periodic boundary condition.
    real, intent(in) :: x(:)
    real :: diff(size(x))
    integer :: grid_size
    grid_size = size(x)
    diff(1) = (x(2) - x(grid_size)) ! left boundary condition
    diff(grid_size) = (x(1) - x(grid_size-1)) ! right boundary condition
    diff(2:grid_size-1) = x(3:grid_size) - x(1:grid_size-2)
    diff = diff / 2
  end function diff_centered

end module mod_diff
