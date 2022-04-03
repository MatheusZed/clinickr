#!/bin/sh
set -e

echo 'Iniciando processo de configuração do banco'

rake db:setup

echo 'Banco configurado com sucesso'
ruby app.rb -o 0.0.0.0
