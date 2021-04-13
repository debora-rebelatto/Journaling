const express = require('express');
const cors = require('cors')
const morgan = require('morgan');

const app = express();

require('dotenv').config();

app.use(morgan('dev'));
app.use(cors());
app.use(express.json());

require('./app/routes/notes')(app);
require('./app/routes/notebooks')(app);
require('./app/routes/user')(app);

let port = 3000

app.listen(port, () => console.log('Server running on port ' + port))