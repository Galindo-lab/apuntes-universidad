# Sustituye el valor de 'x', 'y' y 'z'.

x = 1
y = 0
z = 0


# Añadir 1*10^-100 para evitar la divicion entre 0
# 'and' regresa 1 = True y 0 = False
x = x + and(x=0)*float(10^(-100))

r = sqrt(x^2+y^2)
theta = arctan(y/x)

# determinar la cantidad de ángulo faltante
# 'and' regresa 1 = True y 0 = False
ajuste(x,y) = (
   and(x>0 ,y>0)  * 0    + # I
   and(x<=0,y>0)  * pi   + # II
   and(x<0 ,y<=0) * pi   + # III
   and(x>0 ,y<0)  * 2*pi   # IV
)

# sumamos los grados faltantes
theta = theta+ajuste(x,y)

"Rectangular (x,y,z):"
float((x,y,z))

"Cilindrica (r,theta,z):"
float((r,theta,z))
