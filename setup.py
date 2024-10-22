from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy as np

ext_modules = [Extension("image_processing", ["image_processing/image_processing.pyx"],extra_compile_args=["-Wno-implicit-function-declaration","-Wno-int-conversion"])]

setup(
    name="image_processing",
    ext_modules=cythonize(ext_modules)
)
