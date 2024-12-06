You can run bottom with:

btm
For help regarding the command-line options, use:

# For a simple overview of flags
btm -h

# For more details
btm --help
You can also see keybinds and basic usage details in bottom by pressing ?, which will open a help menu.

Features
Expansion
By default, bottom is somewhat like a dashboard - a bunch of different widgets, all showing different things, and they all cram together to fit into one terminal.

If you instead just want to see one widget - maybe you want to look at a graph in more detail, for example - you can "expand" the currently selected widget using the e key, which will hide all other widgets and make that widget take up all available terminal space.

You can leave this state by either pressing e again or pressing Esc.

Widget selection
To allow for widget-specific keybindings and expansion, there is the idea of widget selection in bottom, where you can focus on a specific widget to work with it. This can be done with the mouse (just click on the widget of interest) or keyboard (ex: Ctrl+Direction, see Key bindings for alternatives).

Key bindings
These are global or common keyboard shortcuts for the application, which you can see in-app through the ? shortcut. Note that key bindings are generally case-sensitive.

Binding	Action
q , Ctrl+c	Quit
Esc	Close dialog windows, search, widgets, or exit expanded mode
Ctrl+r	Reset display and any collected data
f	Freeze/unfreeze updating with new data
?	Open help menu
e	Toggle expanding the currently selected widget
Ctrl+Up
Shift+Up
K
W	Select the widget above
Ctrl+Down
Shift+Down
J
S	Select the widget below
Ctrl+Left
Shift+Left
H
A	Select the widget on the left
Ctrl+Right
Shift+Right
L
D	Select the widget on the right
Up , k	Move up within a widget
Down , j	Move down within a widget
Left
h
Alt+h	Move left within a widget
Right
l
Alt+l	Move right within a widget
g+g , Home	Jump to the first entry
G , End	Jump to the last entry
Page Up , Page Down	Scroll up/down a table by a page
Ctrl+u	Scroll up a table by half a page
Ctrl+d	Scroll down a table by half a page
Mouse bindings
Binding	Action
Left Button	Selects the widget