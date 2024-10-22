from setuptools import setup
from exodide import build
from Cython.Build import cythonize

setup(
    name='image_processing',
    version='0.1.0',
    install_requires=[
        'scikit-image',
        'opencv-python'
    ],
    ext_modules = cythonize("image_processing/image_processing.pyx",compiler_directives={'language_level' : "3"}),
    cmdclass=build.cmdclass(),

)
