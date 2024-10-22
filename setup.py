from setuptools import setup
from Cython.Build import cythonize
from exodide import build

setup(
    name='image_processing',
    version='0.1.0',
    install_requires=[
        'scikit-image',
        'opencv-python'
    ],
    ext_modules = cythonize("image_processing/image_processing.pyx",compiler_directives={'language_level' : "3"}),
    zip_safe=False,
    cmdclass={"bdist_wheel": exodide_wheel(python_version="3.12")},  # Specify Python version
    # Specify the Python version here
    python_requires='==3.12',
)
