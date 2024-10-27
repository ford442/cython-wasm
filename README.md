# cython-wasm
Adding cythonized module to pyodide:

sudo apt install python3.12 python3.12-venv libpython3.12-dev -y

sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1

sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 2

sudo update-alternatives --set python3 /usr/bin/python3.12

wget https://bootstrap.pypa.io/get-pip.py

python3.12 -m venv .venv

source .venv/bin/activate

python3 ./get-pip.py

/content/RAMDRIVE2/emsdk/emsdk install 3.1.58

/content/RAMDRIVE2/emsdk/emsdk activate 3.1.58

pip3 install --upgrade setuptools

pip3 install setuptools-cython

pip3 install numpy essentia

pip3 install cython

pip3 install exodide[all]

pip3 install pyodide

pip3 install pyodide-build

pip3 install --upgrade wheel

git clone https://github.com/ford442/cython-wasm.git

cd cython-wasm

source /content/RAMDRIVE2/emsdk/emsdk_env.sh

python setup.py bdist_wheel


pyodide build --extension image_processing


5. Integration with Pyodide

await micropip.install('https://1ink.us/files/image_processing-0.1.0-cp312-cp312-emscripten_3_1_58_wasm32.whl')


import image_processing
