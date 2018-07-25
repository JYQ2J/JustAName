#!/usr/bin/env bash
##
# file: yum-install.sh
# desc: yum intall dependence package
# path: /data/software
# author: lichunping@qiyi.com
# date : 2017-4-6
##
#安装系统依赖
# yum -y update
yum -y install gcc gcc-c++
yum -y install gcc gcc-c++ autoconf automake
yum -y install openssl openssl-devel
yum -y install zlib zlib-devel
yum -y install lrzsz
yum -y install libxml2 libxml2-dev
yum -y install python-docutils
yum -y install rst2man
yum -y install ncurses-devel
yum -y install pcre pcre-devel
yum -y install libedit-devel
yum -y install libtool
yum -y install python-sphinx
yum -y install python-dev
yum -y install libffi-dev
yum -y install libssl-dev
yum -y install libxslt-dev
yum -y install readline readline-devel
echo "依赖安装完成"
