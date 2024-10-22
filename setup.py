from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy as np
from exodide import build

# omit

ext_modules = [Extension("image_processing", ["image_processing/image_processing.pyx"],extra_compile_args=["-Wno-implicit-function-declaration","-Wno-int-conversion"])]

setup(
    name="image_processing",
    # omit
    cmdclass=build.cmdclass(), # {'build': build.build, 'build_ext': build.build_ext}
    ext_modules=cythonize(ext_modules)
)
