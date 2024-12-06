{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    php
    php83Packages.composer
    # php83Packages.psysh
    php83Packages.psalm
    php83Packages.phpmd
    # php83Packages.phpcs
    php83Packages.php-codesniffer
    php83Packages.phpstan
    php83Packages.php-cs-fixer
    php83Packages.phing
    php83Extensions.ast
    php83Extensions.curl
    php83Extensions.dom
    php83Extensions.event
    php83Extensions.ds
    php83Extensions.exif
    php83Extensions.ffi
    php83Extensions.enchant
    php83Extensions.fileinfo
    php83Extensions.filter
    php83Extensions.ftp
    php83Extensions.gd
    php83Extensions.gettext
    php83Extensions.gnupg
    php83Extensions.grpc
    php83Extensions.iconv
    php83Extensions.imagick
    php83Extensions.igbinary
    php83Extensions.imap
    php83Extensions.inotify
    php83Extensions.intl
    php83Extensions.mailparse
    php83Extensions.mbstring
    php83Extensions.memcache
    php83Extensions.memcached
    php83Extensions.memprof
    php83Extensions.mongodb
    php83Extensions.msgpack
    php83Extensions.mysqli
    php83Extensions.opcache
    php83Extensions.openssl
    php83Extensions.openswoole
    php83Extensions.pcov
    php83Extensions.pdo
    php83Extensions.pdo_mysql
    php83Extensions.pdo_pgsql
    php83Extensions.pdo_sqlite
    php83Extensions.pdo_sqlsrv
    php83Extensions.pgsql
    php83Extensions.phalcon
    php83Extensions.spx
    php83Extensions.protobuf
    php83Extensions.pspell
    php83Extensions.readline
    php83Extensions.redis
    php83Extensions.session
    php83Extensions.simplexml
    php83Extensions.smbclient
    php83Extensions.soap
    php83Extensions.sockets
    php83Extensions.sodium
    php83Extensions.sqlite3
    php83Extensions.sqlsrv
    php83Extensions.ssh2
    php83Extensions.tidy
    php83Extensions.tokenizer
    php83Extensions.uv
    php83Extensions.xml
    php83Extensions.xmlreader
    php83Extensions.xmlwriter
    php83Extensions.xsl
    php83Extensions.yaml
    php83Extensions.zip
    php83Extensions.zlib
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
