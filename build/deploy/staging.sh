#!/bin/bash
SSH_USER="$1"
SSH_PASS="$2"
GIT_USER="$3"
GIT_PASS="$4"
expect -c "
	set timeout 10
	spawn ssh 151.106.98.0 -p 65002 -l ${SSH_USER}
	expect \"*connecting*\"
	send \"yes\r\"
	expect \"*?sword:*\"
	send \"${SSH_PASS}\r\"
	expect \"*login*\"
	send \"cd domains/inicial.com.br/apps/fabianocouto\r\"
	send \"git pull -f --no-edit https://${GIT_USER}:${GIT_PASS}@github.com/inicialsolucoes/fabianocouto.git staging\r\"
	expect \"*staging*\"
	send \"exit\r\"
	expect \"*closed*\"
	send \"exit\r\"
	interact
"
exit