#!/bin/bash

rsync -aAXHv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/var/run/*","/var/lock/*","/mnt/*","/mntHDD/*","/mntWIN/*","/media/*","/lost+found","/home/*/.cache/chromium/*","coredump/"} / /media/Backups --delete && \
	tar -cvpzf /mntHDD/archsystembackup.tar.gz /media/Backups 
