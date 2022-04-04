# clinickr

Usando Docker sem Compose

Usar comando para parar o db local para nao dar conflito:
sudo service postgresql stop

Executar comando no cmd:
sh bin/start.sh

Apagando todos os containers:
sh bin/destroy.sh


Abrir browser:

http://localhost:4567/api/v1/{CONSULTAR APIS}



Utilizando as APIS:


Importando planilhas:

POST:

http://localhost:4567/api/v1/import

Content type Multpart Form
{ file: 'arquivo.csv' }