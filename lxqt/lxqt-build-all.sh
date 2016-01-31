#!/bin/sh

# Copyright 2012  Patrick J. Volkerding, Sebeka, Minnesota, USA
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#  I took this from the xfce-build-all.sh and just modified it for lxqt.
#
#  2015-02-22 KaMii

# Set to 1 if you'd like to install/upgrade package as they are built.
# This is recommended.
INST=1

TMP=${TMP:-/tmp}
OUTPUT=${OUTPUT:-/tmp}

BASELIBS="\
  extra-cmake-modules \
  kwindowsystem \
  kguiaddons \
  polkit-qt5-1 \
  libqtxdg \
  liblxqt \
  solid \
  lxqt-globalkeys \
  lxqt-notificationd \
  libsysstat \
  libfm-extra \
  menu-cache \
  libfm \
"

COMPONENTS="\
  libxkbcommon \
  libdbusmenu-qt \
  lxqt-panel \
  pcmanfm-qt \
  lxqt-session \
  lxqt-runner \
  lxqt-qtplugin \
  lxqt-policykit \
  lxqt-powermanagement \
  lximage-qt \
  libkscreen \
  lxqt-config \
  obconf-qt \
  compton-conf \
  lxqt-about \
"

DATA="\
  lxqt-common \
  lxmenu-data \
"

EXTRAS="\
  lxqt-openssh-askpass \
  qtermwidget \
  qterminal \
"

for package in $BASELIBS $COMPONENTS $DATA $EXTRAS; do
  cd $package || exit 1
  ./${package}.SlackBuild || ( touch /tmp/${package}.failed ; exit 1 ) || exit 1
  if [ "$INST" = "1" ]; then
    PACKAGE="$(ls -t $OUTPUT/$(ls ${package}*.?z | rev | cut -f2- -d - | rev)-*t?z | head -n 1)"
    if [ -f $PACKAGE ]; then
      upgradepkg --install-new --reinstall $PACKAGE
    else
      echo "Error:  package to upgrade "$PACKAGE" not found in $OUTPUT"
      exit 1
    fi
  fi
  cd ..
done
