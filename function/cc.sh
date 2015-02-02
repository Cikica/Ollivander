function cc () {

	directory=()
	OLDIFS=$IFS
	IFS=$(echo -en "\n\b")
	go_to=""
	for iterated  in $( ls -A ); do
		if [[ -d $iterated ]]; then
			directory+=($iterated)
			is_found=$( echo $iterated | grep "$1" )
			if [[ -n $is_found ]]; then
				go_to=$iterated
				break;
			fi
		fi
	done
	IFS=$OLDIFS

	if [[ -d $go_to ]]; then
		cd $go_to
	else
		echo "directory doth not existeth"
	fi
}