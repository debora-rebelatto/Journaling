const mongoose = require("../../database/database");

const NotesSchema = mongoose.Schema({
  title: {
    type: String, required: true
  },
  color: {
    type: String
  },
  notebook: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Notebooks',
    required: true
  },
  content: {
    type: String
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  createdAt: {
    type: Date,
    default: Date.now
  }
})

const Notes = mongoose.model('Notes', NotesSchema);

module.exports = Notes;
