# NetSynth
This a abstration of what a termial is,\
a text visualizer whit a few quality life patches,\
minimal and noting else.

## Patches
- Xresources (Passed) *Tested*
- BoxDraw (Passed) *Tested*
- Glyph Wide (Passed) *Tested*
- Scroll back (Passed) *Tested*
- Vanish mouse (Passed) *Tested*
- Blinking Cursor (Passed) *Tested*
- Sync (Passed) *Tested*
- Undercurl (Passed) *Tested*
- Font2 (Passed) *Tested*

I know you might think this is to much for the minimal word,\
but i can garante that every patch have ther own function whitout\
one of then this terminal is no usable. 

yes undercurl is like asthetic but i really like underline cursor\
so that why add the patch see more clear the urls while work.

sync is mostly because i was having erros with the window resize\
so whit it now that do not happen.

The use of font2 even when i not use a lot of icons is just for some programs\
don not look broken so check and configure the second font always if you\
like icons.

## How This work

### Local install aka home dir
I make some edits to the Makefile so i can build local in user folder. \
'$ make clean locali' \
Before that you should edit the desktop file in the route ~/.local/share/applications \
and edit the exec and Try exec to the binary path ~/.local/bin/ns \
to remove run \
'$ make localu'

### Global install
- So you are the finish user this i pretty easy just run \
> make clean install
- to remove run
> make remove
- do not overthink it is easy no edit or anything \
### Package install
- Yup i decided to make a package of this beacuse i use two distros arch and void \
- so is better to just install and go \
' in development '

## TODO
- Check the icons for the desk file
- Terminal bad win id
- error whit the cursor do not change in the neovim window
- fix some keyboard bad reads
