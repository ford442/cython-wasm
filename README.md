# cython-wasm
Adding cythonized module to pyodide:

git clone https://github.com/ford442/cython-wasm.git

cd cython-wasm

cython cytho_pyo.pyx

source /content/RAMDRIVE2/emsdk/emsdk_env.sh




2. Cythonization

3. Compilation with Emscripten

Compile to WebAssembly: Use Emscripten to compile the generated C code into WebAssembly. This involves using Emscripten's compiler (emcc) and linker. You'll need to link against the Pyodide runtime and any other necessary libraries.
This step often involves complex compiler flags and linker settings specific to Emscripten and Pyodide.
4. Packaging

Create a Pyodide package: Package your compiled WebAssembly module and any associated Python files into a format that Pyodide can understand. This typically involves creating a directory structure with specific files like meta.yaml and package.json that describe your package.
5. Integration with Pyodide

Load the package in Pyodide: Use Pyodide's loadPackage function to load your custom package in the Pyodide environment.
