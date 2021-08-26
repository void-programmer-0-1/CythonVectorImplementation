from matrix import Pymatrix_init
import time 

r = 3
c = 3

start = time.time()

Pymatrix_init(r,c)

end = time.time()

print("C++ TOOK :: {} seconds".format(end - start))