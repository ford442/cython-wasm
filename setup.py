from setuptools import setup
from Cython.Build import cythonize

setup(
    name='image_processing',
    version='0.1.0',
    install_requires=[
        'scikit-image',
        'opencv-python'
    ],
    ext_modules = cythonize("image_processing/image_processing.pyx",compiler_directives={'language_level' : "3"}),
    zip_safe=False,
    options={
        "build_ext": {
        "extra_compile_args": ["-O3","-Wno-implicit-function-declaration","-Wno-int-conversion"]
        }
    },
    # Specify the Python version here
    python_requires='==3.12',
)
