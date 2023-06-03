#!/bin/bash

echo "Criando Diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

# -crypt está deprecado para versão mais atualizada do ubuntu server, para que funcionasse a criação de senha utilizei o -1 no lugar
# Exemplo de como foi ensinado no cruso: useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd carlos -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim......"

