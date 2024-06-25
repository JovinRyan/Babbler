[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 10
  ny = 10
[]

[Variables]
  [pressure]
  []
[]

[Kernels]
  [diffusion]
    type = DarcyPressure
    variable = pressure
    permeability = 0.8415e-09
  []
[]

[BCs]
  [left]
    type = DirichletBC
    variable = pressure
    value = 0
    boundary = 'left'
  []

  [right]
    type = DirichletBC
    variable = pressure
    value = 1
    boundary = 'right'
  []
[]

[Executioner]
  type = Steady
  solve_type = PJFNK

  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
[]

[Outputs]
  exodus = true
[]
