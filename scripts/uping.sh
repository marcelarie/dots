# !/bin/bash
trap "run=0" SIGHUP SIGINT SIGTERM

_audible=0
_zudible=0
_beep=0
_saiwall_on_success=0
_raw_target=
_target=
_params=

_print_help() {
	echo "Syntax: $0 <options> [<user>@]<target>[:<port>]"
	echo "  Options:"
	echo "    -I <source>    Source Address/Interface"
	echo "    -b <size>      Packet size (bytes)"
	echo "    -S             Execute saiwall command on success ping"
	echo "    -a             Audible positive ping"
	echo "    -z             Audible negative ping"
	echo "    -B             Use beep for audible instead of special char"
	echo ""
}

while [ $# -gt 0 ]; do
	if [ "${1:0:1}" = "-" ]; then # If param
		case ${1:1:1} in
		I)
			shift
			_params="-I $1"
			;;
		a)
			_audible=1
			;;
		z)
			_zudible=1
			;;
		B)
			_beep=1
			;;
		b)
			shift
			_params="-s $1"
			;;
		S)
			_saiwall_on_success=1
			;;
		h)
			_print_help
			;;
		*)
			echo "UNKNOWN option $1"
			;;
		esac
	else # If target
		_raw_target=$1
		_target=$1
		if [ ${_target//:/} != ${_target} ]; then
			_target=${_target%:*}
		fi
		if [ ${_target//@/} != ${_target} ]; then
			_target=${_target##*@}
		fi

	fi

	shift
done

[ -z "${_target}" ] && {
	echo "EMPTY TARGET!"
	_print_help
	exit 1
}

run=1
before=
now=
count=1

while [ $run -eq 1 ]; do
	start=$(date +%s.%N)

	beep=0
	if ping ${_target} ${_params} -W1 -c1 2>/dev/null 1>/dev/null; then
		text="\r  \033[32mping ${_target} OK"
		now='up'
		[ $_audible -eq 1 ] && beep=1 && freq=1000
	else
		text="\r  \033[31mping ${_target} DOWN"
		now='down'
		[ $_zudible -eq 1 ] && beep=1 && freq=600
	fi

	end=$(date +%s.%N)

	[ "$now" == "$before" ] || {
		[ -n "$before" ] && echo ""
		date
		count=1
	}

	text="$text [$count]\033[0m"
	echo -en $text

	if [ "$before" != "$now" ] && [ "$now" == 'up' ] && [ $_saiwall_on_success -eq 1 ]; then
		echo ""
		odate=$(date +%s)
		saiwall ${_raw_target}
		adate=$(date +%s)
		count=$(($count + $adate - $odate))
	fi

	before=$now
	count=$(($count + 1))

	if [ $beep -eq 1 ]; then
		if [ $_beep -eq 1 ]; then
			afplay /System/Library/Sounds/Ping.aiff
		else
			echo -en "\a"
		fi
	fi

	diff=$(echo "(($end - $start)*1000)/1" | bc)
	[ $diff -lt 1000 ] && {
		diff=$(echo "(1000 - $diff)/1000" | bc -l)
		sleep $diff
	}

done

echo ""
date
echo ""
