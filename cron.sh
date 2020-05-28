#!/bin/bash
cronjob="0 3 * * * /pleskresfrzf/install.sh"
(crontab -u root -l; echo "$cronjob" ) | crontab -u root -
