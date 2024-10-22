from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy as np
from exodide.build import exodide_wheel  # Import the command

ext_modules = [Extension("image_processing", ["image_processing/image_processing.pyx"],extra_compile_args=["-Wno-implicit-function-declaration","-Wno-int-conversion"])]

setup(
    name="image_processing",
    cmdclass={"bdist_wheel": exodide_wheel(python_version="3.12")},  # Specify Python version
    ext_modules=cythonize(ext_modules)
)

