program tsunami
  ! Solves 1-d non-linear shallow water equations:
  ! 
  !   Velocity: 
  !       du/dt + u * du/dx + g * dh/dx = 0
  ! 
  !   Elevation:
  !       dh/dt + d((H + h) * u) / dx = 0
  !
  use mod_diff, only: diff => diff_centered
  use datetime_module, only: datetime
  
  implicit none

  integer, parameter :: grid_size = 100
  integer, parameter :: num_time_steps = 1000

  real, parameter :: dx = 1.0 ! grid spacing [m]
  real, parameter :: dt = 0.02 ! time steps [s]
  real, parameter :: g = 9.8 ! gravitational acceleration [m/s^2]
  real, parameter :: bottom_friction = 0.1
  real, parameter :: depth = 10 ! mean water depth [m]

  integer, parameter :: icenter = 50 ! center index of initial perturbation
  real, parameter :: decay = 0.02 ! lower value means slower decay

  real :: h(grid_size), u(grid_size) ! state arrays
  
  integer :: i, n ! spatial grid index and time step counter

  ! initialize velocity and water height arrays
  u = 0
  init: do i = 1, grid_size
    h(i) = exp(- decay * (i - icenter)**2)
  end do init
  
  n = 0

  print *, n, h ! print time step and water height array to standard output

  time_loop: do n = 1, num_time_steps

    ! compute velocity at the next time step
    u = u - (u * diff(u) + g * diff(h)) / dx * dt &
          - bottom_friction / (depth + h) * u**2 * dt

    ! compute water height at the next time step
    h = h - diff((depth + h) * u) / dx * dt

    print *, n, h ! print time step and water height array to standard output

  end do time_loop

end program tsunami