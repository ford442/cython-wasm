from setuptools import setup
from Cython.Build import cythonize

# Define your custom compile arguments
extra_compile_args = ["-O3","-Wno-implicit-function-declaration","-Wno-int-conversion"]

setup(
    name="image_processing",
    version="0.1",
    description="A Pyodide-compatible package",
    author="1inkus",
    author_email="admin@1ink.us",
    url="https://github.com/ford442/cython-wasm",
    packages=["image_processing"],
    ext_modules=cythonize(
        "image_processing/image_processing.pyx",
        compiler_directives={"language_level": "3"},
        build_dir="build",
        annotate=True,
        extra_compile_args=extra_compile_args  # Use extra_compile_args instead of compile_args
    ),
)
