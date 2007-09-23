#!/bin/sh

# chroot.sh - /usr/sbin/chroot wrapper script
# Copyright (C) 2006-2007 Daniel Baumann <daniel@debian.org>
#
# live-helper comes with ABSOLUTELY NO WARRANTY; for details see COPYING.
# This is free software, and you are welcome to redistribute it
# under certain conditions; see COPYING for details.

set -e

Chroot ()
{
	COMMANDS="${1}"

	# Executing commands in chroot
	Echo_debug "Executing: ${COMMANDS}"
	${LH_ROOT_COMMAND} chroot chroot /usr/bin/env -i HOME="/root" PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" TERM="${TERM}" ftp_proxy="${LH_APT_FTPPROXY}" http_proxy="${LH_APT_HTTPPROXY}" DEBIAN_FRONTEND="${LH_DEBCONF_FRONTEND}" DEBIAN_PRIORITY="${LH_DEBCONF_PRIORITY}" DEBCONF_NOWARNINGS="${LH_DEBCONF_NOWARNINGS}" ${COMMANDS}
}