function run () { 
	current_working_directory=$PWD
	names_variable_path="$SCRIPTDATA/run/names.sh"
	paths_variable_path="$SCRIPTDATA/run/paths.sh"
	executables_variable_path="$SCRIPTDATA/run/executables.sh"
	red_color="\e[1;31m";
	green_color="\e[0;32m";
	no_color="\e[0m";

	source $names_variable_path
	source $paths_variable_path
	source $executables_variable_path

	if [[ $1 == "-l" ]] || [[ $1 == "--list" ]]; then

		for (( index = 0; index < ${#names[@]}; index++ )); do
			string="$red_color${names[$index]}$no_color $green_color${paths[$index]}$no_color ${executables[$index]}"
			echo -e $string
		done
		return
	fi

	if [[ $1 == "-r" ]] || [[ $1 == "--remove" ]]; then

		path_name_to_be_removed=$2
		names_string="names=("
		paths_string="paths=("
		executables_string="executables=("

		for (( index = 0; index < ${#names[@]}; index++ )); do
			if [[ ${names[$index]} != $path_name_to_be_removed ]]; then
				names_string+="\"${names[$index]}\" "
				paths_string+="\"${paths[$index]}\" "
				executables_string+="\"${executables[$index]}\" "
			fi
		done
		
		names_string+=")"
		paths_string+=")"
		executables_string+=")"

		rm $names_variable_path
		rm $paths_variable_path
		rm $executables_variable_path

		echo "$names_string" >> "$names_variable_path"
		echo "$paths_string" >> "$paths_variable_path"
		echo "$executables_string" >> "$executables_variable_path"

		echo "$path_name_to_be_removed has been removed"
		
		return
	fi

	if [[ $1 == "-n" ]] || [[ $1 == "--new" ]]; then

		path_name=$2
		path_value=$3
		path_executable=$4
		names_string="names=("
		paths_string="paths=("
		executables_string="executables=("

		for (( index = 0; index < ${#names[@]}; index++ )); do
			names_string+="\"${names[$index]}\" "
			paths_string+="\"${paths[$index]}\" "
			paths_string+="\"${executables[$index]}\" "
		done
		
		names_string+="\"$path_name\""
		paths_string+="\"$path_value\""
		executables_string+="\"$path_executable\""
		names_string+=")"
		paths_string+=")"
		executables_string+=")"

		rm $names_variable_path
		rm $paths_variable_path
		rm $executables_variable_path

		echo "$names_string" >> "$names_variable_path"
		echo "$paths_string" >> "$paths_variable_path"
		echo "$executables_string" >> "$executables_variable_path"

		echo "$path_name has been added"

		return
	fi

	for (( index = 0; index < ${#names[@]}; index++ )); do
		
		path=${names[$index]}

		if [[ "$path" == $1 ]]; then 
			cd "${paths[$index]}"
			echo "Runing $1"
			start "${executables[$index]}"
			cd $current_working_directory
			return
		fi
	done

	echo -e "$green_color$1$no_color does not exist"
}