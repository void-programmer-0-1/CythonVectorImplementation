from libcpp.vector cimport vector


cdef vector[float] dot(vector[float] a,vector[float] b):

    cdef vector[float] var
    cdef float size_a = a.size()
    cdef float size_b = b.size()

    if(size_a != size_b):
        return var
    
    else:
        for i in range(size_a):
            var.push_back(a[i] * b[i])

        return var


def Pymatrix(a,b):
    return dot(a,b)
    
    




