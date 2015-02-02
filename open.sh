source $SCRIPTDATA/open.sh
count=-1
for path in "${names[@]}" ; do
	((count++))
	if [ "$path" == $1 ]
		then 
		printf "Opening %s \n" "$path"
		if [[ -z "$2" ]] 
			then
			cd "${paths[$count]}"
			start "${exes[$count]}.exe"
		else
			start "${paths[$count]}/${exes[$count]}.exe" "$2" "$3"
		fi
	fi
done