#!/bin/bash

echo "Digite o nome do host"
read namehost

echo $namehost > /etc/hostname

echo "Lembre-se de alterar o arquivo /etc/hosts adicionando o hostname $namehost!!" 

sleep 10

echo "Instalando pacotes..."
echo
verifica() {

[ $? == 0 ] && echo "Pacote $pacote instalado com sucesso... "|| echo "Ocorreu ume erro na instalação do pacote $pacote. Saindo..." exit 1

}

pacote="Cherrytree"

echo "Instalando $pacote......"
echo
apt install snapd && snap install cherrytree

echo

verifica

echo

pacote="Google Chrome"

echo "Instalando $pacote......"
echo
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

apt-get update

apt install google-chrome-stable

echo

verifica

echo

pacote="GNS3 Web Client"

echo "Instalando $pacote......"
echo
https://github.com/GNS3/gns3-webclient-pack/releases/download/v1.0.0b2/GNS3.WebClient.pack-1.0.0b2.dmg

add-apt-repository ppa:gns3/unstable

apt-get update

apt-get install gns3-webclient-pack

echo

verifica

echo

pacote="Virtualbox"

echo "Instalando $pacote......"
echo
wget https://download.virtualbox.org/virtualbox/7.0.14/virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb

dpkg -i virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb

apt -f install -y

echo

verifica

pacote="Remmina"

echo "Instalando $pacote......"
echo

add-apt-repository ppa:remmina-ppa-team/remmina-next

apt-get update

apt-get install remmina remmina-plugin-* libfreerdp-plugins-standard

echo

verifica

echo "Removendo arquivos do usuário..."

rm /home/aluno/Documentos/*
rm /home/aluno/Downloads/*
