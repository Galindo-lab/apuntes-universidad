
F = (
  x^2*z^2,
  -2*y^2*z^2,
  x*y^2*z
)

b = d(F,(x,y,z))
c = b * unit(3)
contract(c)
