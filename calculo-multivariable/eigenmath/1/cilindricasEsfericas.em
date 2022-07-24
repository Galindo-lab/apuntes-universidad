# Sustituye el valor de 'r', 'theta' y 'z'
# theta es el angulo de los ejes 'x' y 'y'

r = 1
theta = 1
z = 1

rho = sqrt(r^2+z^2)
theta = theta
phi = arccos(z/rho)

"Cilindrica (r,theta,z):"
float((r,theta,z))

"Esferica (rho,theta,phi):"
float((rho,theta,phi))

