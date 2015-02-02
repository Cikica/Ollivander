
function goto () {

	variable_directory=$SCRIPTDATA/go
	names_variable_path="$variable_directory/names.sh"
	paths_variable_path="$variable_directory/paths.sh"

	source $names_variable_path
	source $paths_variable_path 

	if [[ $1 == "-l" ]] || [[ $1 == "--list" ]]; then

		text_length=25
		name_color="\e[1;31m";
		path_color="\e[0;32m";
		no_color="\e[0m";
		count=-1

		for (( index = 0; index < ${#names[@]}; index++ )); do
			string="	$name_color${names[$index]}$no_color $path_color${paths[$index]}$no_color"
			echo -e $string
		done

		return
	fi

	if [[ $1 == "-r" ]] || [[ $1 == "--remove" ]]; then

		path_name_to_be_removed=$2
		names_string="names=("
		paths_string="paths=("

		for (( index = 0; index < ${#names[@]}; index++ )); do
			if [[ ${names[$index]} != $path_name_to_be_removed ]]; then
				names_string+="${names[$index]} "
				paths_string+="\"${paths[$index]}\" "
			fi
		done
		
		names_string+=")"
		paths_string+=")"

		rm $names_variable_path
		rm $paths_variable_path

		echo "$names_string" >> "$names_variable_path"
		echo "$paths_string" >> "$paths_variable_path"

		echo "$path_name_to_be_removed has been removed"

		return
	fi

	if [[ $1 == "-n" ]] || [[ $1 == "--new" ]] ; then

		path_name=$2
		path_value=$3
		names_string="names=("
		paths_string="paths=("

		for name in "${names[@]}"; do
			names_string+="$name "
		done

		for path in "${paths[@]}"; do
			paths_string+="\"$path\" "
		done

		names_string+="$path_name "
		paths_string+="\"$path_value\" "
		
		names_string+=")"
		paths_string+=")"

		rm $names_variable_path
		rm $paths_variable_path

		echo "$names_string" >> "$names_variable_path"
		echo "$paths_string" >> "$paths_variable_path"

		echo "$path_name has been added"

		return
	fi

	name_to_find=$(printf "_%s" "$@")
	name_to_find=${name_to_find:1}
	count=-1
	for name in "${names[@]}" ; do
		((count++))
		if [ $name == $name_to_find ]
			then
			printf "Going to %s \n" "$name"
			goto="${paths[$count]}"
		fi
	done
	cd "$goto"
}