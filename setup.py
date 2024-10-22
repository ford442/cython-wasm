from setuptools import setup, Extension
from Cython.Build import cythonize
from exodide.build import exodide_wheel

ext_modules = [
    Extension("image_processing", ["image_processing.pyx"], include_dirs=[np.get_include()])
]

setup(
    name="image_processing",
    ext_modules=cythonize(ext_modules),
    cmdclass={"bdist_wheel": exodide_wheel},
)
