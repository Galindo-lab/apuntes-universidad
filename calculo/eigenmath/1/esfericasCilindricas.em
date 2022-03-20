# Sustituye el valor de 'rho', 'theta' y 'phi'
# theta es el angulo de los ejes 'x' y 'y'
# phi es el angulo del eje 'z'

rho = 1
theta = 1
phi = 1


r = rho * sin(phi)
theta = theta
z = rho * cos(phi)

"Esferica (rho,theta,phi):"
float((rho,theta,phi))

"Cilindrica (r,theta,z):"
float((r,theta,z))
