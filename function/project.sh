function project () {

	current_working_directory=$PWD
	project_directory_variable_path="$SCRIPTDATA/project/project_directory.sh"
	sublime_directory_variable_path="$SCRIPTDATA/project/sublime_directory.sh"
	green_color="\e[0;32m"
	red_color="\e[1;31m"
	no_color="\e[0m"

	source $project_directory_variable_path
	source $sublime_directory_variable_path
	
	if [[ $1 == "-p" ]] || [[ $1 == "--project_path" ]]; then
		rm $project_directory_variable_path
		echo "project_directory=\"$2\"" >> "$project_directory_variable_path"
		echo "Project path set to : $2"
		return
	fi

	if [[ $1 == "-s" ]] || [[ $1 == "--sublime_path" ]]; then
		rm $sublime_directory_variable_path
		echo "sublime_directory=\"$2\"" >> "$sublime_directory_variable_path"
		echo "Sublime path set to : $2"
		return
	fi

	if [[ $1 == "-w" ]] || [[ $1 == "--where" ]]; then
		echo -e "$red_color project $no_color : $green_color $project_directory $no_color"
		echo -e "$red_color sublime $no_color : $green_color $sublime_directory $no_color"
		return
	fi

	if [[ $1 == "-l" ]] || [[ $1 == "--list" ]]; then
		cd $project_directory
		for iterated  in $( ls ); do

			if [[ $iterated == *"sublime-project"* ]]; then
				project_name="${iterated%.*}"
				echo -e "$green_color$project_name$no_color"
			fi
		done
		cd $current_working_directory
		return
	fi

	name=$(printf "_%s" "$@")
	name=${name:1}

	cd $project_directory
	for iterated  in $( ls ); do
		
		project_name="$name.sublime-project"
		if [[ $iterated == "$project_name" ]]; then

			echo -e "Opening project $green_color$name$no_color"
			"$sublime_directory" "$project_name"
			cd $current_working_directory
			return
		fi
	done

	echo -e "Project $green_color$name$no_color has not been found"
}