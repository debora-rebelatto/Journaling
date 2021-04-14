const express = require('express');
const Notes = require('../models/Notes');
const Notebooks = require('../models/Notebooks');

const authMiddleware = require("../middleware/auth");
const router = express.Router();

router.use(authMiddleware);

router.post('/:id', authMiddleware, async (req, res) => {
  let id = req.params.id;

  try {
    var notebook = await Notebooks.findById(id).populate(['organizer', 'participants']);

    const notebookNote = new Notes({ ...req.body, notebook: id, owner: req.userId });
    await notebookNote.save();
    notebook.notes.push(notebookNote);

    await notebook.save();

    return res.status(200).send(notebook);
  } catch(err) {
    console.log(err)
    return res.status(400).send({ 'error': err });
  }
});

router.get('/', async(req, res) => {
  try {
    let notes = await Notes.find({ owner: req.userId });
    return res.status(200).send(notes);
  } catch(err) {
    return res.status(400).send({'err': err});
  }
})

// Get by Notebook ID
router.get('/notebook/:notebookId', async(req, res) => {
  try {
    let notes = await Notes.find({ notebook: req.params.notebookId/* , owner: req.userId */ });
    return res.status(200).send(notes);
  } catch(err) {
    return res.status(400).send({'err': err});
  }
})

module.exports = app => app.use('/notes', router);
