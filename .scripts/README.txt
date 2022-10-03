This directory should be hidden inside my home directory.

This is meant to contain scripts I use and should be in the PATH, but I don't
want to put them inside /usr/local or something similar for one of the
following reasons:
-- they are an important part of my workflow but can't be found in homebrew
or similar
-- I want to be able to easily keep a backup
-- I wrote them and want to keep their source files close

Currently, only the .scripts/bin/ subdirectory is in the PATH.

The .scripts/src/ subdirectory is meant to contain any source files for
scripts I wrote. Scripts for which their executable also contains the actual
script code (e.g. python scripts using a shebang) need not be included here.
