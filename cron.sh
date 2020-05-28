#!/bin/bash
cronjob="0 3 * * * /opt/setup.sh"
(crontab -u userhere -l; echo "$cronjob" ) | crontab -u userhere -
