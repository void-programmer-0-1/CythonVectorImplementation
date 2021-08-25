from Matrix import Pymatrix
import numpy as np
import time

size_m = 10000000

a = np.random.uniform(low=0.5, high=13.3, size=(size_m,1))
b = np.random.uniform(low=0.5, high=13.3, size=(size_m,1))


def matrix(a,b):
    c = []
    if(len(a) != len(b)):
        return 
    else:
        for i in range(len(a)):
            c.append(a[i] * b[i])
        return c

startC = time.time()
ansC = Pymatrix(a,b)
endC = time.time()
print("C++ took :: ",(endC - startC))

startPy = time.time()
ansPy = matrix(a,b)
endPy = time.time()
print("Py took :: ",(endPy - startPy))
