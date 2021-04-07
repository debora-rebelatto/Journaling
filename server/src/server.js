const express = require('express');
const cors = require('cors')

const app = express();
  
app.use(cors())
app.use(express.json());

require('./routes/notes')(app);
require('./routes/notebooks')(app);

let port = 3000

app.listen(port, () => console.log('Server running on port ' + port))