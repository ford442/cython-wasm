# cython-wasm
Adding cythonized module to pyodide:

sudo apt install python3.12 libpython3.12-dev -y

sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.12 1

sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 2

sudo update-alternatives --set python /usr/bin/python3.12

/content/RAMDRIVE2/emsdk/emsdk install 3.1.58

/content/RAMDRIVE2/emsdk/emsdk activate 3.1.58

pip3 install cython

pip3 install exodide[all]

git clone https://github.com/ford442/cython-wasm.git

cd cython-wasm

cython cytho_pyo.pyx

source /content/RAMDRIVE2/emsdk/emsdk_env.sh

CC=emcc CXX=em++ python setup.py bdist_wheel



2. Cythonization

3. Compilation with Emscripten

Compile to WebAssembly: Use Emscripten to compile the generated C code into WebAssembly. This involves using Emscripten's compiler (emcc) and linker. You'll need to link against the Pyodide runtime and any other necessary libraries.
This step often involves complex compiler flags and linker settings specific to Emscripten and Pyodide.
4. Packaging

Create a Pyodide package: Package your compiled WebAssembly module and any associated Python files into a format that Pyodide can understand. This typically involves creating a directory structure with specific files like meta.yaml and package.json that describe your package.
5. Integration with Pyodide

Load the package in Pyodide: Use Pyodide's loadPackage function to load your custom package in the Pyodide environment.
