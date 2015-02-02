function ll () {
	
	text_length=25
	directory_color="\e[1;31m";
	file_color="\e[0;32m";
	no_color="\e[0m";
	directory=()
	file=()
	OLDIFS=$IFS
	IFS=$(echo -en "\n\b")

	for iterated  in $( ls -A ); do
		if [[ -d $iterated ]]; then
			directory+=($iterated)
		fi

		if [[ -f $iterated ]]; then
			file+=($iterated)
		fi
	done

	if [[ ${#directory[@]} -ge ${#file[@]} ]]; then
		for (( index = 0; index < ${#directory[@]}; index++ )); do
			missing_spaces=$(( $text_length - `expr length ${directory[$index]}` ))
			string="	$directory_color${directory[$index]}$no_color"
			for (( i = 0; i < $missing_spaces; i++ )); do
				string+=" "
			done
			string+="$file_color${file[$index]}$no_color"
			echo -e $string
		done
	fi

	if [[ ${#file[@]} -gt ${#directory[@]} ]]; then
		for (( index = 0; index < ${#file[@]}; index++ )); do
			if [[ $index -ge ${#directory[@]} ]]; then
				missing_spaces=$text_length
			else
				missing_spaces=$(( $text_length - `expr length ${directory[$index]}` ))	
			fi
			
			string="	$directory_color${directory[$index]}$no_color"
			for (( i = 0; i < $missing_spaces; i++ )); do
				string+=" "
			done
			string+="$file_color${file[$index]}$no_color"
			echo -e $string
		done
	fi

	IFS=$OLDIFS
}