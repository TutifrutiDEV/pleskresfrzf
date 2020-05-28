#!/bin/bash
cronjob="* * * * * /opt/setup.sh"
(crontab -u userhere -l; echo "$cronjob" ) | crontab -u userhere -
