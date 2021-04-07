const mongoose = require('mongoose');

mongoose.connect(
  'mongodb+srv://deb:26NW4IF224EpjifU@cluster0.ahrgm.mongodb.net/journaling?retryWrites=true&w=majority',
  { useNewUrlParser: true,  useUnifiedTopology: true }
)

module.exports = mongoose;
