const mongoose = require("../../database/database");

const NotesSchema = mongoose.Schema({
  notebook:{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Notebooks',
    required: true
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  title: {
    type: String, required: true
  },
  color: {
    type: String
  },
  date: {
    type: String
  }
})

const Notes = mongoose.model('Notes', NotesSchema);

module.exports = Notes;
