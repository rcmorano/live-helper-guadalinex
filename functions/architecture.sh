#!/bin/sh

# architecture.sh - handle architecture specific support
# Copyright (C) 2006-2007 Daniel Baumann <daniel@debian.org>
#
# live-helper comes with ABSOLUTELY NO WARRANTY; for details see COPYING.
# This is free software, and you are welcome to redistribute it
# under certain conditions; see COPYING for details.

set -e

Check_architecture ()
{
	ARCHITECTURES="${@}"
	VALID="false"

	for ARCHITECTURE in ${ARCHITECTURES}
	do
		if [ "`echo ${LIVE_ARCHITECTURE} | grep ${ARCHITECTURE}`" ]
		then
			VALID="true"
			break
		fi
	done

	if [ "${VALID}" = "false" ]
	then
		Echo_warning "skipping ${0}, foreign architecture."
		exit 0
	fi
}

Check_multiarchitecture ()
{
	if [ "`echo ${LIVE_ARCHITECTURE} | wc -w`" -gt "1" ]
	then
		# First, only support multiarch on iso
		if [ "${LIVE_BINARY_IMAGES}" = "iso" ]
		then
			# Assemble multi-arch
			case "${LIVE_CURRENT_ARCHITECTURE}" in
				amd64)
					DESTDIR="${DESTDIR}.amd"
					DESTDIR_LIVE="${DESTDIR_LIVE}.amd"
					DESTDIR_INSTALL="${DESTDIR_INSTALL}.amd"
					;;

				i386)
					DESTDIR="${DESTDIR}.386"
					DESTDIR_LIVE="${DESTDIR_LIVE}.386"
					DESTDIR_INSTALL="${DESTDIR_INSTALL}.386"
					;;

				powerpc)
					DESTDIR="${DESTDIR}.ppc"
					DESTDIR_LIVE="${DESTDIR_LIVE}.ppc"
					DESTDIR_INSTALL="${DESTDIR_INSTALL}.ppc"
					;;
			esac
		fi
	fi
}