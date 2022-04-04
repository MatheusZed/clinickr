# clinickr

Projeto para gerenciamento de consultas atravez de uma api.

## APP Version
  - Ruby [3.1.1]
  - [Lista de Gem](Gemfile)

## Usando Docker sem Compose

### Usar comando para parar o db local para nao dar conflito:
sudo service postgresql stop

### Executar comando no cmd para configurar ambiente:
sh bin/start.sh

### Apagando todos os containers:
sh bin/destroy.sh


## Abrir browser:
http://localhost:4567/api/v1/{CONSULTAR APIS}

## API

### Importando planilhas

**Request**

```
POST /api/v1/import
```

Content type Multpart Form
{ file: 'arquivo.csv' }

### Busca testes

**Request**

```
GET /api/v1/tests/:result_token
```

**Response**

Status: 200(OK)

```json
[
  {
    "result_token": "IQCZ17",
    "result_date": "2021-08-05",
    "patient": {
      "name": "Emilly Batista Neto",
      "cpf": "048.973.170-88",
      "email": "gerald.crona@ebert-quigley.com",
      "birthday": "2001-03-11T00:00:00.000Z"
    },
    "doctor": {
      "name": "Maria Luiza Pires",
      "crm": "B000BJ20J4",
      "crm_state": "PI"
    },
    "tests": [
      {
        "test_type": "hemácias",
        "test_limits": "45-52",
        "result": "97"
      }
    ]
  },
  {
    "result_token": "IQCZ17",
    "result_date": "2021-08-05",
    "patient": {
      "name": "Emilly Batista Neto",
      "cpf": "048.973.170-88",
      "email": "gerald.crona@ebert-quigley.com",
      "birthday": "2001-03-11T00:00:00.000Z"
    },
    "doctor": {
      "name": "Maria Luiza Pires",
      "crm": "B000BJ20J4",
      "crm_state": "PI"
    },
    "tests": [
      {
        "test_type": "hemácias",
        "test_limits": "45-52",
        "result": "89"
      }
    ]
  }
]
```

### Busca pacientes

**Request**

```
GET /api/v1/patients
```

**Response**

Status: 200(OK)

```json
[
  {
    "id": 1,
    "name": "Antônio Rebouças",
    "cpf": "071.488.453-78",
    "email": "adalberto_grady@feil.org",
    "birthday": "1999-04-11T00:00:00.000Z",
    "city": "Tefé",
    "state": "Sergipe",
    "address": "25228 Travessa Ladislau",
    "created_at": "2022-04-04T02:39:57.372Z",
    "updated_at": "2022-04-04T02:39:57.372Z"
  }
]
```

### Busca medicos

**Request**

```
GET /api/v1/doctors
```

**Response**

Status: 200(OK)

```json
[
  {
    "id": 1,
    "name": "Dra. Isabelly Rêgo",
    "email": "diann_klein@schinner.org",
    "crm": "B0002W2RBG",
    "crm_state": "SP",
    "created_at": "2022-04-04T02:39:57.276Z",
    "updated_at": "2022-04-04T02:39:57.276Z"
  }
]
```
