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
- Font2 (Passed) *Tested*

## How This work
DO NOT CLONE THE REPO USE THE RELEASE THE REPO IN UNSTABLE
DOWNLOAD THE RELEASE AND COMPILE IT

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
