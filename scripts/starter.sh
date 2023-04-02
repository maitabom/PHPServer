#!/bin/bash

# seta o dono do diretorio da aplicacao
chown -R 33:33 /var/www/html

# inicia o Apache
/etc/init.d/apache2 start

# loop infinito que fica monitorando o Apache
# Como este comando e executado pelo comando CMD no Dockerfile,
# se nao tiver este loop infinito com o sleep o conteiner ficar reiniciando
while sleep 300s; do
	PROCESS_2_STATUS=$(/etc/init.d/apache2 status | grep 'is not')

	if [ "$PROCESS_2_STATUS" != "" ]; then
		echo "Apache nao iniciou."
		/etc/init.d/apache2 start
	fi
done

