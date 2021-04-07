const mongoose = require("../database/database");

const NotesSchema = mongoose.Schema({
  name: { type: String, required: true },
  color: { type: String,  },
  date: { type: String }
})

const Notes = mongoose.model('Notes', NotesSchema);

module.exports = Notes;
