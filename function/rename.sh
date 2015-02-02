function rename () { 
	if [[ -f $1 ]]; then
		cp $1 $2;
		rm $1;
	fi

	if [[ -d $1 ]]; then
		cp -R $1 $2
		rm -rf $1
	fi
}