#!/bin/bash

cut -d: -f1,7 /etc/passwd > names.txt
lastlog > ~/devops-notes/linux/laslog.txt
echo | paste -d' ' names.txt laslog.txt
