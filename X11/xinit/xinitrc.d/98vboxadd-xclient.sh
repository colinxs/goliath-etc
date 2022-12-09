#!/usr/bin/sh
## @file
# Start the Guest Additions X11 Client
#

#
# Copyright (C) 2007-2020 Oracle Corporation
#
# This file is part of VirtualBox Open Source Edition (OSE), as
# available from http://www.virtualbox.org. This file is free software;
# you can redistribute it and/or modify it under the terms of the GNU
# General Public License (GPL) as published by the Free Software
# Foundation, in version 2 as it comes in the "COPYING" file of the
# VirtualBox OSE distribution. VirtualBox OSE is distributed in the
# hope that it will be useful, but WITHOUT ANY WARRANTY of any kind.
#

# Sanity check: if non-writeable PID-files are present in the user home
# directory VBoxClient will fail to start.
for i in $HOME/.vboxclient-*.pid; do
    test -w $i || rm -f $i
done

# Do not start if the kernel module is not present; or if this script is
# triggered by a connection over SSH.
if [ -c /dev/vboxguest -a -z "${SSH_CONNECTION}" ]; then
  /usr/bin/VBoxClient --clipboard
  /usr/bin/VBoxClient --checkhostversion
  /usr/bin/VBoxClient --seamless
  /usr/bin/VBoxClient --draganddrop
fi