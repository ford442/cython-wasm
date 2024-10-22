from setuptools import setup, Extension
from Cython.Build import cythonize
from exodide import build

# omit

ext_modules = [
    Extension("image_processing", ["image_processing.pyx"])
]

setup(
    name="image_processing",
    ext_modules=cythonize(ext_modules),
    cmdclass=build.cmdclass(), # {'build': build.build, 'build_ext': build.build_ext}
)
