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

    for i in range(matrix.row):
        matrix.var[i] = <int *>malloc(sizeof(int) * matrix.col)
        for j in range(matrix.col):
            matrix.var[i][j] = 0
    
    return matrix


def Pymatrix_init(r,c):
    cdef Matrix matrix =  matrix_init(r,c)
    return matrix





