#!/usr/bin/env pwsh

#### Pip
python3 -m pip install --upgrade pynvim
python3 -m pip install --upgrade neovim
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pipx
python3 -m pip install --upgrade virtualenv
python3 -m pip install --upgrade ipython
python3 -m pip install --upgrade icescream
python3 -m pip install --upgrade requests
python3 -m pip install --upgrade setuptools
python3 -m pip install --upgrade packaging
python3 -m pip install --upgrade rich
python3 -m pip install --upgrade pygments
python3 -m pip install --upgrade argcomplete
python3 -m pip install --upgrade pytz
python3 -m pip install --upgrade pytzdata
python3 -m pip install --upgrade requests

python3 -m pip install --upgrade pycparser
python3 -m pip install --upgrade certifi
python3 -m pip install --upgrade charset-normalizer
python3 -m pip install --upgrade python-dateutil
python3 -m pip install --upgrade idna
python3 -m pip install --upgrade lxml
python3 -m pip install --upgrade markupsafe
python3 -m pip install --upgrade pyparsing
python3 -m pip install --upgrade tabulate
python3 -m pip install --upgrade urllib3
python3 -m pip install --upgrade pprintpp
python3 -m pip install --upgrade pyyaml
python3 -m pip install --upgrade pyyaml-include
python3 -m pip install --upgrade numpy
python3 -m pip install --upgrade matplotlib

python3 -m pip install --upgrade tree-sitter
python3 -m pip install --upgrade tree-sitter-languages
python3 -m pip install --upgrade wheel

#### Pipx
pipx install jinja2
pipx install sphinx
pipx install yq
pipx install twine
pipx install harlequin
pipx install tiptop
pipx install ilua
pipx install jupyterlab
pipx inject jupyterlab ilua
