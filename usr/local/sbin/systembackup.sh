#!/bin/bash

rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/mntHDD/*","/mntWIN/*","/media/*","/lost+found","/home/*/.cache/chromium/*"} / /media/Backups && \
	tar -cvpzf /mntHDD/archsystembackup.tar.gz /media/Backups
