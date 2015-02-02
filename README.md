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

 - [goto](#goto)
 - [project](#project)
 - [ll](#ll)
 - [cc](#cc)

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
```

**Syntax**
```
goto [OPTION | ALIAS]

OPTION : 
  -n, --new <alias> <path>   add new alias for a file path
  -l, --list                 display all the aliases registered and paths to which they lead
  -r, --remove <alias>       de register alias
ALIAS :
	Name of the alias to go to.
```

### project

Open sublime text projects. When giving a name of a project spaces are interpreted as underlines, so
if you write *base style* the project should be called *base_style*

This command requires some setup before it can be used. To set it up you just set the **project_path** and the **sublime_path**

**Examples**
```
$ ollie@WAND-SHOP ~/tripalley
project --project_path "$HOME/tripalley/projects"

$ ollie@WAND-SHOP ~/tripalley
Project path set to : /c/usr/ollie//tripalley/projects

$ ollie@WAND-SHOP ~/tripalley
project --sublime_path "/c/some/dir/to/Sublime Text 2/sublime_text.exe"

$ ollie@WAND-SHOP ~/tripalley
Sublime path set to : /c/some/dir/to/Sublime Text 2/sublime_text.exe

$ ollie@WAND-SHOP ~/tripalley
project your a god damn wizard harry

$ ollie@WAND-SHOP ~/tripalley
Opening project your_a_god_damn_wizard_harry
```

**Syntax**
```
project [OPTION | NAME]

OPTION :
	-p, --project_path <path>   Path to the directory where you store your 
                                .sublime-project files
	-s, --sublime_path <path>   Path to the sublime executable. Maku sure you have 
                                the sublime_text.exe in  it
	-w, --where                 list the project path and sublime path
	-l, --list                  list project names
```

### ll
### cc