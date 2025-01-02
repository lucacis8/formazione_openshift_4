const express = require('express');
const app = express();
const port = 8080;

app.get('/', (req, res) => res.send('Ciao dal progetto di Luca!'));

app.listen(port, () => console.log(`App in esecuzione sulla porta ${port}`));
