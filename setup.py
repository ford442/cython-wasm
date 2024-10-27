from setuptools import setup
from setuptools.extension import Extension
from Cython.Build import cythonize
import numpy

extensions = [
    Extension(
        "audio_proc._processing",
        ["audio_proc/_processing.pyx"],
    ),
]

setup(
    name="audio_proc",
    version="0.1",
    description="A Pyodide-compatible package",
    author="1inkus",
    author_email="admin@1ink.us",
    url="https://github.com/ford442/cython-wasm",
    packages=["audio_proc"],
    ext_modules=cythonize(extensions),
    include_dirs=[numpy.get_include()]
)
