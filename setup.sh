#!/bin/bash
if [ "$EUID" -ne 0 ]; then 
	echo "Run me as root .."
	exit
fi

KEY="/opt/key.xml"


PLESK_HOME="/opt/psa/"
if [ ! -d $PLESK_HOME ]; then
	$PLESK_HOME = "/usr/local/psa/"
fi

if [ ! -d $PLESK_HOME ]; then
	read -p "[-] Plesk root not found enter root (exp. /opt/psa): " PLESK_HOME
	if [ ! -d $PLESK_HOME ]; then
		exit
	fi
fi

echo "[+] Copying stuff to /opt/ .."
cp -r . "/opt/"

SW_ENGINE_COMMAND="sw-engine"

if [ ! hash SW_ENGINE_COMMAND 2> /dev/null ]; then
	read -p "[-] sw-engine executable not find, enter absolute path: " SW_ENGINE_COMMAND
fi

echo "[+] Registering your license and server IP to Plesk"
systemctl kill sw-cp-server.service
systemctl kill sw-engine.service

if pgrep -x "sw-engine" > /dev/null; then
	echo "[-] Step 1..."
fi

if pgrep -x "sw-cp-server" > /dev/null; then
	echo "[-] Step 2..."
fi

if pgrep -x "sw-engine-fpm" > /dev/null; then
	echo "Step Final..."
fi

echo "[+] Saving IP of Plesk Server"
echo "127.0.0.1 leika.plesk.com" >> /etc/hosts
echo "[+] Activating.."
/opt/psa/admin/plib/api-cli/license.php -i $KEY



systemctl daemon-reload

echo "[+] Starting sw-engine and sw-cp-server.service"
systemctl start sw-engine.service
systemctl start sw-cp-server.service

echo "[+] Plesk Activated! Contact PrivateALPS Support for Any Help !"
