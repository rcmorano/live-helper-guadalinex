#!/bin/sh

# aliases.sh - internal shell aliases
# Copyright (C) 2006-2009 Daniel Baumann <daniel@debian.org>
#
# live-helper comes with ABSOLUTELY NO WARRANTY; for details see COPYING.
# This is free software, and you are welcome to redistribute it
# under certain conditions; see COPYING for details.

Find_files ()
{
	(ls "${@}" | grep -qs .) > /dev/null 2>&1
}

In_list ()
{
	NEEDLES="${1}"
	shift

	for ITEM in ${@}
	do
		for NEEDLE in ${NEEDLES}
		do
			if [ "${NEEDLE}" = "${ITEM}" ]
			then
				return 0
			fi
		done
	done

	return 1
}

Truncate ()
{
	for FILE in ${@}
	do
		: > ${FILE}
	done
}
