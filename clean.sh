#!/usr/bin/env bash

clear_files="`find *.csr *.crt *.key index.* serial* *.srl newcerts`"

echo "Эти файлы будут удалены:"
echo $clear_files
echo "Продолжить? [y] n"
read answ
if ( [ "$answ" == "y" ]); then
	rm -rf $clear_files
else
	echo "Отмена"
fi
