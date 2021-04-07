const { SchemaType, SchemaTypes } = require("../database/database");
const mongoose = require("../database/database");

const NotebooksSchema = mongoose.Schema({
  name: { type: String, required: true },
  color: { type: String, required: true },
  notes: [{
    name: { type: String, required: true },
    // color: { type: String,  },
    // date: { type: String }
  }]
})

const Notebooks = mongoose.model('Notebooks', NotebooksSchema);

module.exports = Notebooks;
