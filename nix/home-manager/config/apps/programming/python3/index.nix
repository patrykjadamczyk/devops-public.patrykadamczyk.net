{ config, pkgs, inputs, system, nurpkgs, pkgs_slow_ring, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # python3
    (pkgs_slow_ring.python3Full.withPackages (ps: with ps; [
      neovim
      pip
      pipx
      virtualenv
      argcomplete
      pygments
      pycparser
      certifi
      ipython
      charset-normalizer
      python-dateutil
      idna
      jinja2
      lxml
      markupsafe
      packaging
      pyparsing
      pytz
      pytzdata
      requests
      setuptools
      tabulate
      urllib3
      pprintpp
      yq
      icecream
      rich
      pyyaml
      pyyaml-include
      six
      pynvim
      numpy
      matplotlib
      # sphinx
    ]))
    # pipx
    # python311Packages.pip
    # python311Packages.argcomplete
    # python311Packages.pygments
    # python311Packages.pycparser
    # python311Packages.certifi
    # python311Packages.ipython
    # python311Packages.charset-normalizer
    # python311Packages.cryptography
    # python311Packages.python-dateutil
    # python311Packages.idna
    jinja2-cli
    # python311Packages.jinja2
    # python311Packages.lxml
    # python311Packages.markupsafe
    # python311Packages.packaging
    # python311Packages.pyparsing
    # python311Packages.pytz
    # python311Packages.pytzdata
    # python311Packages.requests
    # python311Packages.setuptools
    # python311Packages.tabulate
    # python311Packages.urllib3
    # python311Packages.pprintpp
    # python311Packages.yq
    # python311Packages.icecream
    # python311Packages.rich
    # python311Packages.pyyaml
    # python311Packages.pyyaml-include
    # python311Packages.six
    # python311Packages.pynvim
    # python311Packages.numpy
    # python311Packages.matplotlib
    sphinx
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs = {
  };

  nixpkgs = {
    config = {
    };
  };
}
