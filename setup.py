from setuptools import setup, Extension
from Cython.Build import cythonize

ext_modules = [Extension("image_processing", ["image_processing/image_processing.pyx"],include_dirs=[np.get_include()],extra_compile_args=["-Wno-implicit-function-declaration"])]

setup(
    name="image_processing",
    ext_modules=cythonize(ext_modules)
)

# In your Python code
from image_processing import process_tile
