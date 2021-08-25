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
        for j in range(matrix.col):
            print(matrix.var[i][j])


def Pymatrix_init(r,c):
    cdef Matrix matrix =  matrix_init(r,c)
    matrix_print(matrix)





