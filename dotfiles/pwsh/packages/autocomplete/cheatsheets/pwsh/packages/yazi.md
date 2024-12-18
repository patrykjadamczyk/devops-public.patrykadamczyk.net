# Yazi

## Commands

### `yazifm` / `fm`

Opens yazi file manager

## Yazi keymaps

### Navigation

To navigate between files and directories you can use the arrow keys ←, ↑, ↓ and → or vi(m)-like commands such as h, j, k, l:

Key binding	Alternate key	Action
k	↑	Move the cursor up
j	↓	Move the cursor down
l	→	Enter highlighted directory
h	←	Leave the current directory and into its parent

Further navigation commands can be found in the table below.

Key binding	Action
K	Move the cursor up 5 lines
J	Move the cursor down 5 lines
g ⇒ g	Move cursor to the top
G	Move cursor to the bottom

### Selection

To select files and directories, the following commands are available.

Key binding	Action
<Space>	Toggle selection of highlighted file/directory
v	Enter visual mode (selection mode)
V	Enter visual mode (unset mode)
<Ctrl-a>	Select all files
<Ctrl-r>	Inverse selection of all files
<Esc>	Cancel selection

### File/directory operations

To interact with selected files/directories use any of the commands below.

Key binding	Action
o	Open the selected files
O	Open the selected files interactively
<Enter>	Open the selected files
<Ctrl-Enter>	Open the selected files interactively (some terminals don't support it yet)
y	Yank the selected files (copy)
x	Yank the selected files (cut)
p	Paste the yanked files
P	Paste the yanked files (overwrite if the destination exists)
-	Create a symbolic link to the yanked files (absolute path)
_	Create a symbolic link to the yanked files (relative path)
d	Move the files to the trash
D	Permanently delete the files
a	Create a file or directory (ends with "/" for directories)
r	Rename a file or directory
;	Run a shell command
:	Run a shell command (block the UI until the command finishes)
.	Toggle the visibility of hidden files
s	Search files by name using fd
S	Search files by content using ripgrep
<Ctrl-s>	Cancel the ongoing search
z	Jump to a directory using zoxide
Z	Jump to a directory, or reveal a file using fzf

### Copying paths

To copy paths, use any of the following commands below.

Observation: c ⇒ d indicates pressing the c key followed by pressing the d key.

Key binding	Action
c ⇒ c	Copy absolute path
c ⇒ d	Copy the path of the parent directory
c ⇒ f	Copy the name of the file
c ⇒ n	Copy the name of the file without the extension
Finding files/directories
Key binding	Action
/	Forward find file/directory in CWD
?	Backward find file/directory in CWD
n	Jump to next occurrence
N	Jump to previous occurrence

### Sorting

To sort files/directories use the following commands.

Observation: , ⇒ a indicates pressing the , key followed by pressing the a key.

Key binding	Action
, ⇒ a	Sort alphabetically
, ⇒ A	Sort alphabetically (reverse)
, ⇒ c	Sort by creation time
, ⇒ C	Sort by creation time (reverse)
, ⇒ m	Sort by modified time
, ⇒ M	Sort by modified time (reverse)
, ⇒ n	Sort naturally
, ⇒ N	Sort naturally (reverse)
, ⇒ s	Sort by size
, ⇒ S	Sort by size (reverse)
