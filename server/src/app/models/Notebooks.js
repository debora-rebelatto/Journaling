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
  notes: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Notes',
  }],
})

const Notebooks = mongoose.model('Notebooks', NotebooksSchema);

module.exports = Notebooks;
