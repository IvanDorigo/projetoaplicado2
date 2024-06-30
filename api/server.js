const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');

const app = express();
const port = 3001;

app.use(bodyParser.json());

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'Ads321567&',
  database: 'PousadaDB',  // Certifique-se de que o nome do banco de dados está correto
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the database');
});

app.post('/sensor-data', (req, res) => {
  const { sensorId, value, date, time } = req.body;

  const sqlQuery = 'INSERT INTO sensor_input_data(sensor_input_idsensor_input, valor_input_data, data_valor_input, time_input_data) VALUES (?, ?, ?, ?)';
  connection.query(sqlQuery, [sensorId, value, date, time], (err, results) => {
    if (err) {
      console.error('Error inserting data:', err);
      return res.status(500).send('Error inserting data');
    }
    res.status(200).send('Data inserted successfully');
  });
});

//inclui agora
app.post('/salvarCliente', (req, res) => {
  const { nome, cpf, telefone, email, endereco, passaporte } = req.body;

  const sqlQuery = 'INSERT INTO clientes (nome, cpf, telefone, email, endereco, passaporte) VALUES (?, ?, ?, ?, ?, ?)';
  connection.query(sqlQuery, [nome, cpf, telefone, email, endereco, passaporte], (err, results) => {
    if (err) {
      console.error('Erro ao inserir cliente:', err);
      return res.status(500).send('Erro ao inserir cliente');
    }
    res.status(200).send('Cliente inserido com sucesso');
  });
});
//até aqui 
app.listen(port, () => {
  console.log('Server running on port ${port}');
});