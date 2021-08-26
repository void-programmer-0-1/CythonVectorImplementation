cimport cython
from libc.stdlib cimport malloc, free

cdef struct Matrix:
    int row
    int col
    int** var


cdef Matrix matrix_init(int r,int c):

    cdef Matrix matrix
    matrix.row = r
    matrix.col = c
    matrix.var = <int **>malloc(sizeof(int *) * matrix.row)

    cdef int i = 0
    cdef int j = 0
    cdef int value = 0

    for i in range(matrix.row):
        matrix.var[i] = <int *>malloc(sizeof(int) * matrix.col)
        for j in range(matrix.col):
            value += 1
            matrix.var[i][j] = value
    
    return matrix


cdef void matrix_print(Matrix& matrix):
    cdef int i = 0
    cdef int j = 0

    for i in range(matrix.row):
        print_list = []
        for j in range(matrix.col):
            print_list.append(matrix.var[i][j])
        print(print_list)
    print("\n")
    del print_list

cdef Matrix dot(Matrix& a,Matrix& b):
    cdef int i = 0
    cdef int j = 0 
    cdef int k = 0

    cdef Matrix dot_product = matrix_init(a.row,b.col)

    for i in range(a.row):
        for j in range(b.col):
            dot_product.var[i][j] = 0
            for k in range(a.col):
                dot_product.var[i][j] += a.var[i][k] * b.var[k][j]

    return dot_product

cdef void __delete__(Matrix& a):
    
    cdef int i = 0
    for i in range(a.row):
        free(a.var[i])
    free(a.var)

def Pymatrix_init(r,c):
    cdef Matrix matrix1 = matrix_init(r,c)
    cdef Matrix matrix2 = matrix_init(r,c)
    cdef Matrix matrix3 = dot(matrix1,matrix2)
    matrix_print(matrix1)
    matrix_print(matrix2)
    matrix_print(matrix3)
    __delete__(matrix1)
    __delete__(matrix2)
    __delete__(matrix3)





