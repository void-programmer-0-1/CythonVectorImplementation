from distutils import extension
from distutils.extension import Extension
from distutils.core import setup
from Cython.Build import cythonize

extension = [
    Extension("matrix",sources=["matrix.pyx"],language="c++")
]

setup(
    ext_modules=cythonize(extension,annotate=True)
)