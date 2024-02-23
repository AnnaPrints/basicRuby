# Ensure breakpoints are hit, variables are visible in Tool Window
x, y = 100, 200
h = {x:, y:}

p(x:, y:) #bp here

C = 'constant'

def m()='method'

a = {C:, m:}

a #bp here
