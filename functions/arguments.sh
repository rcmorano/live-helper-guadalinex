#!/bin/sh

# arguments.sh - handle common arguments
# Copyright (C) 2006-2007 Daniel Baumann <daniel@debian.org>
#
# live-helper comes with ABSOLUTELY NO WARRANTY; for details see COPYING.
# This is free software, and you are welcome to redistribute it
# under certain conditions; see COPYING for details.

set -e

Arguments ()
{
	ARGUMENTS="`getopt --longoptions breakpoints,conffile:,debug,force,help,logfile:,trace,root-command:,quiet,usage,verbose,version --name=${PROGRAM} --options huv --shell sh -- "${@}"`"

	if [ "${?}" != "0" ]
	then
		Echo_error "terminating" >&2
		exit 1
	fi

	eval set -- "${ARGUMENTS}"

	while true
	do
		case "${1}" in
			--breakpoints)
				LH_BREAKPOINTS="enabled"; shift
				;;

			--conffile)
				LH_CONFFILE="${2}"; shift 2
				;;

			--debug)
				LH_DEBUG="enabled"; shift
				;;

			--force)
				LH_FORCE="enabled"; shift
				;;

			-h|--help)
				Help; shift
				;;

			--logfile)
				LH_LOGFILE="${2}"; shift 2
				;;

			--trace)
				LH_TRACE="enabled"; shift
				;;

			--root-command)
				LH_ROOT_COMMAND="${2}"; shift
				;;

			--quiet)
				LH_QUIET="enabled"; shift
				;;

			-u|--usage)
				Usage; shift
				;;

			--verbose)
				LH_VERBOSE="enabled"; shift
				;;

			-v|--version)
				Version; shift
				;;

			--)
				shift; break
				;;

			*)
				Echo_error "internal error"
				exit 1
				;;
		esac
	done
}