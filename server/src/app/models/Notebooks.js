const mongoose = require("../../database/database");

const NotebooksSchema = mongoose.Schema({
  title: {
    type: String,
    required: true
  },
  color: {
    type: String,
    required: true
  },
  description: {
    type: String
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
  },
  notes: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Notes',
  }],
  createdAt: {
    type: Date,
    default: Date.now
  }
})

const Notebooks = mongoose.model('Notebooks', NotebooksSchema);

module.exports = Notebooks;
