[Mesh]
  type = GeneratedMesh
  dim = 1
[]

[Problem]
  solve = false
[]

[Variables]
  [u]
  []
[]

[Kernels]
  [zero_viscosity]
    type = DarcyPressure
    variable = u
    viscosity = 0 # The viscosity must be a non-zero number, so this input should invoke an error
  []
[]

[Materials]
  [filter]
    type = PackedColumn
  []
[]

[Executioner]
  type = Steady
[]
