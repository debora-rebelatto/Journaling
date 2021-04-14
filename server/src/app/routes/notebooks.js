const express = require('express');
const Notebook = require('../models/Notebooks');

const authMiddleware = require("../middleware/auth");

const router = express.Router();

router.use(authMiddleware);

router.post('/', authMiddleware, async(req, res) => {
  try {
    console.log(req.params);
    let notebook = await Notebook.create({ ...req.body, owner: req.userId });
    console.log(notebook)
    return res.status(200).send(notebook)
  } catch (error) {
    console.log(error);
    return res.status(400).send({ 'error': "Something wrong happend" })
  }
});

router.delete('/:id', authMiddleware, async(req, res) => {
  let id = req.params.id;

  try {
    if(!await Notebook.findById(id))
      return res.status(400).send({ 'error': 'Notebook does not exist' })

    await Notebook.deleteOne({ _id: id });
    return res.status(200);
  } catch (error) {
    console.log(error);
    return res.status(400).send({'error': error})
  }
});

router.get('/:id', async(req, res) => {
  var id = req.params.id;
  try {
    if(!await Notebook.findById(id))
      res.status(400).send({ 'error': 'Evento não existe' });

    var notebook = await Notebook.findById(id).populate('notes');
    return res.status(200).send(notebook);
  } catch(error) {
    return res.status(400).send({'error': "Something wrong happend"})
  }
})


/*
router.put('/:id', async(req, res) => {
  const doc = { name: req.body.name };
  try {
    await Notebook.update({_id: req.params.id}, doc)
    return res.status(200).send({'ok': 'ok' })
  } catch (err) {
    return res.status(400).send({'error': "Something wrong happend"})
  }
})
*/

router.get('/', async(req, res) => {
  try {
    return res.status(200).send(await Notebook.find());
  } catch(error) {
    return res.status(400).send({'error': "Something wrong happend"})
  }
})

module.exports = app => app.use('/notebooks', router);