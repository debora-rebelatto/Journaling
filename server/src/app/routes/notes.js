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

    /* await Promise.all(
      notebook.notes.map(async notes => {
        if(notes.participant == req.userId) {
          return res.status(400).send({"error": "Usuário já inscrito neste evento"})
        }
      })
    ); */

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

/* router.delete('/:id', async(req, res) => {
  let id = req.params.id;
  try {
    var notebook = await Notebooks.findById(id).populate(['organizer', 'participants']);

    await Promise.all(
      notebook.notes.map(async notes => {
        // if(notes.participant == req.userId) {
        //   return res.status(400).send({"error": "Usuário já inscrito neste evento"})
        // }
      })
    );

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
 */
router.get('/', async(req, res) => {
  try {
    let notes = await Notes.find();
    return res.status(200).send(notes);
  } catch(err) {
    return res.status(400).send({'err': err});
  }
})

module.exports = app => app.use('/notes', router);

  /*return res.status(200).send([
    { "name": "name1", "color": "EE1D6A", "date": "" },
    { "name": "name2", "color": "2A27E4", "date": "" },
    { "name": "name3", "color": "F8A8B4", "date": "" },
    { "name": "name4", "color": "EE1D6A", "date": "" },
    { "name": "name1", "color": "FFC300", "date": "" },
    { "name": "name2", "color": "FF5733", "date": "" },
    { "name": "name3", "color": "C70039", "date": "" },
    { "name": "name4", "color": "581845", "date": "" },
    { "name": "name1", "color": "FFC300", "date": "" },
    { "name": "name2", "color": "FF5733", "date": "" },
    { "name": "name3", "color": "C70039", "date": "" },
    { "name": "name4", "color": "581845", "date": "" },
    { "name": "name1", "color": "FFC300", "date": "" },
    { "name": "name2", "color": "FF5733", "date": "" },
    { "name": "name3", "color": "C70039", "date": "" },
    { "name": "name4", "color": "581845", "date": "" },
  ]);*/