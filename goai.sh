#!/bin/bash

# Eliminar la instalación actual de Go
sudo rm -rf /usr/local/go

# Verificar y limpiar variables de entorno
sed -i '/\/usr\/local\/go\/bin/d' ~/.bashrc
sed -i '/GOPATH/d' ~/.bashrc

# Recargar configuración de shell
source ~/.bashrc

# Descargar e instalar la última versión de Go
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz

# Configurar variables de entorno
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
echo "export GOPATH=\$HOME/go" >> ~/.bashrc
echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc

# Recargar configuración de shell
source ~/.bashrc

# Verificar la instalación de Go
go version

echo "Instalación completada."
