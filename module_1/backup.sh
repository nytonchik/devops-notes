f#!/bin/bash

if [ -d ~/projects ]; then
	if [ -d /backup ]; then
		tar -czf /backup/projects-$(date '+%Y-%m-%d').tgz ~/projects
		echo "$(date) OK" >> ~/backup.log
	else
		echo "no backup"
else
	echo "fail"
	echo "$(date) OK" >> ~/backup.log
fi

0 3 * * 0 /home/nyton/devops-notes/module_1/backup.sh



