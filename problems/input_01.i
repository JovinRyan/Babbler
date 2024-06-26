[Mesh]
  [gmg]
    type = GeneratedMeshGenerator
    dim = 2
    nx = 100
    ny = 10
    xmax = 0.304
    ymax = 0.0257
  []
  coord_type = RZ
  rz_coord_axis = X
[]

[Problem]
  type = FEProblem
[]

[Variables]
  [pressure]
    family = LAGRANGE
  []
[]

[Kernels]
  [Diffusion]
    type = DarcyPressure
    variable = pressure
  []
[]

[Materials]
  [filter]
    type = PackedColumn
  []
[]

[BCs]
  [inlet]
    type = DirichletBC
    variable = pressure
    value = 4000 #Pa
    boundary = 'left'
  []

  [outlet]
    type = DirichletBC
    variable = pressure
    value = 0 #Pa
    boundary = 'right'
  []
[]

[Executioner]
  type = Steady
  solve_type = NEWTON

  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
[]

[Outputs]
  exodus = true
[]
