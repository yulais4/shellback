#!/bin/sh

SOURCE_DIRECTORY="/boot /bin /etc /home /opt /root /usr /var"
TARGET_FILE="system_backup.$(date +F).tar"

checkRoot(){
	if [ "$EUID" -ne 0 ]; then
	echo "Needed root!"
		exit
	fi
}

checkTar(){
        if [ ! -f /bin/tar -a ! -f /usr/bin/tar ];
        then
                echo "Tar not installed. Pleace install."
                exit
        fi
}	

backup(){
    echo "Func backup()"
    tar --create --preserve-permissions --absolute-names --totals --file $TARGET_FILE $SOURCE_DIRECTORY
}

main(){
	checkRoot
	checkTar
        backup
}

main
