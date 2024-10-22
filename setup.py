from setuptools import setup
from exodide import build
from Cython.Build import cythonize

ext_modules = [Extension("image_processing", ["image_processing/image_processing.pyx"],extra_compile_args=["-Wno-implicit-function-declaration","-Wno-int-conversion"])]

setup(
    name='image_processing',
    version='0.1.0',
    install_requires=[
        'scikit-image',
        'opencv-python',
        'numpy'
    ],
    cmdclass=build.cmdclass(), # {'build': build.build, 'build_ext': build.build_ext}
    ext_modules = cythonize(ext_modules),
)
