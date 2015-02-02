Ollivander
====

Ahoy there, a collection of bash functions to help you along your way.
This was created by me to be used in windows with Cygwin, since there are very few ways known 
to me to make life easier in windows if you plan to only use the terminal.
It should work on Linux aswell, if you want to use it.

## Setup

 - Clone the repo where ever you want.

 - Open your .bashrc file and export **SCRIPTDATA** and **SCRIPTPATH** global variables.

 - Include the **functions.sh** file from the repo in there.

 - The **SCRIPTDATA** variable should lead to the _data_ folder in the repo, or any other folder on your 
pc that has the same files and layout of the default _data_ folder.

 - The **SCRIPTPATH** variable should lead to the repo itself.

Put together it should look something like this.

```bash
export SCRIPTDATA="some/path/somewhere/Ollivander/data"
export SCRIPTPATH="some/path/somewhere/Ollivander"
source "$SCRIPTPATH/functions.sh"
```

Thats it now youre good to go.

Onto the functions.

## Functions

### goto

The purpose of __goto__ is to register paths with short aliases which allow you to jump between
key directories quickly.

**Examples**
```
$ ollie@WAND-SHOP ~/code
goto --new style "dir/to/my/code/style"

$ ollie@WAND-SHOP ~/code
style has been added

$ ollie@WAND-SHOP ~/code
goto --new js "dir/to/my/code/somewhere/js"

$ ollie@WAND-SHOP ~/code
js has been added

$ ollie@WAND-SHOP ~/code
goto style

$ ollie@WAND-SHOP ~/style
goto js

$ ollie@WAND-SHOP ~/js

**Syntax**
```
goto [OPTION | ALIAS]

OPTION : 
  -n, --new <alias> <path>   add new alias for a file path
  -w, --where                display all the aliases registered and paths to which they lead
  -r, --remove <alias>       de register alias
ALIAS :
	Name of the alias to go to.
```

### project
### ll
### cc