from setuptools import setup
from setuptools.extension import Extension
from Cython.Build import cythonize
import numpy

extensions = [
    Extension(
        "image_processing",
        ["image_processing/_image_processing.pyx"],
    ),
]

setup(
    name="image_processing",
    version="0.1",
    description="A Pyodide-compatible package",
    author="1inkus",
    author_email="admin@1ink.us",
    url="https://github.com/ford442/cython-wasm",
    packages=["image_processing"],
    ext_modules=cythonize(extensions),
    include_dirs=[numpy.get_include()]
)
