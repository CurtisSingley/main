rsync -tuv -e 'ssh -p 6888' zynx@192.168.1.xxx:/home/zynx/KeepassDB/Database.kdbx /storage/emulated/0/KeepassDB/Database.kdbx
rsync -tuv -e 'ssh -p 6888' /storage/emulated/0/KeepassDB/Database.kdbx zynx@192.168.1.xxx:/home/zynx/KeepassDB/Database.kdbx
