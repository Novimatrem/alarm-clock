# alarm-clock
Novimatrem's alarm clock script, for the waking up. (epilepsy warning) - Licensed under the GNU GPL v3.0.

[![Platform: GNU/Linux](https://img.shields.io/badge/platform-GNU/Linux-blue.svg)](www.kernel.org/linux.html) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

REQUIRES and DEPENDS UPON ``kdialog``, ``espeak``, ``paplay``, ``bash``, and a working ``fortune`` command.

Note: script functionality requires system to remain unmuted and unlocked

# The alarm currently triggers at a set time by default and there is no simple way to adjust this outside of editing the bash scripts manually in multiple places, at the moment.

# Installation
This script relies on pulseaudio's ability to respawn itself upon death to be functional. First enter the following command into your Terminal, to enable that functionality.
```sudo sed -i 's/^; autospawn = yes/autospawn = yes/' /etc/pulse/client.conf```

Clone the contents of this repo into a folder where it will be safely accessible in the future; ``git clone https://gitlab.com/Novimatrem/alarm-clock``

I usually place it in; ``/opt/`` making the final path ``/opt/alarm-clock/``. 

**(If you've not already, you will need to take ownership of the ``/opt/`` folder before you can make edits there. To do so, use ``sudo chown $USER /opt/``, and ``sudo chown $USER /opt/*`` commands.)** 

Make a startup program using the "Startup Applications" GUI in which the command is ``bash /path/to/alarm-clock.sh`` (that command usually being ``bash /opt/alarm-clock/alarm-clock.sh``, then restart your computer.

# elementary OS workaround
For sound to play while the system is locked, in elementary OS, you need to run the following command and then reboot the system.

``sudo adduser $(whoami) audio``

# Help! My distro is weird with autostart
Hi, so if you're on a distro where autostarting things isn't as straight forward, this might work for you.

This solution hinges on two components: installing a GUI to actually set the autostart program, and a .desktop file that you install to select inside of that GUI.

You will need to take ``launch-ac.desktop`` from this repo's main directory, and copy it into your ``$HOME/.local/share/applications/`` folder.

Then you need to install ``gnome-tweaks`` and/or ``gnome-tweaks-tool`` onto your system, ideally the native normal version using the regular default first package manager, nothing fancy or sanboxed like flatpak/snap/etc.

On Debian, for me, this takes the form of the following command: ``sudo apt install -y gnome-tweaks gnome-tweak-tool``

Once you have that .desktop file in that folder, and installed GNOME Tweaks, simply run GNOME Tweaks, to go the Startup Applications page inside of it, and add launch-ac as a startup application.

Congratulations. The alarm clock should now boot on startup of your device.

# License (code)
[![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl-3.0.en.html)  

**alarm-clock** is Free Software: You can use, study share and improve it at your
will. Specifically you can redistribute and/or modify it under the terms of the
[GNU General Public License](https://www.gnu.org/licenses/gpl.html) as
published by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This product is licensed under the GNU GPL v3.0.
This program is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 

See the GNU General Public License (v3.0) for more details. 
You should have received a copy of the GNU General Public License along with
this program.  If not, see [https://www.gnu.org/licenses/gpl-3.0.en.html](https://www.gnu.org/licenses/gpl-3.0.en.html). 

THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS
AND/OR OTHER PARTIES PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE 
RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE
PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
REPAIR OR CORRECTION. 


# License (music)

Music is;

fly - Lofi Hip Hop Beat

Link to music: [https://www.youtube.com/watch?v=vE-BRqY14Ew&disable_polymer=true](https://www.youtube.com/watch?v=vE-BRqY14Ew&disable_polymer=true)

Song is free for profit use (though I am not monetizing anything), by Prod. Riddiman, 2020.

No changes were made to the music by me OTHER THAN making it louder.
