from distutils.core import setup
from Cython.Build import cythonize
from distutils.extension import Extension


extensions = [
    Extension("Matrix",sources=["Matrix.pyx"],language="c++")
]


setup(
    ext_modules = cythonize(extensions)
)