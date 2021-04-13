const express = require('express');
const Notebook = require('../models/Notebooks');

const authMiddleware = require("../middleware/auth");

const router = express.Router();

router.use(authMiddleware);

router.post('/', authMiddleware, async(req, res) => {
  try {
    let notebook = await Notebook.create(req.body);
    return res.status(200).send({ notebook })
  } catch (error) {
    return res.status(400).send({ 'error': "Something wrong happend" })
  }
});

router.delete('/:id', authMiddleware, async(req, res) => {
  try {
    await Notebook.deleteOne({ _id: req.params.id });
    return res.status(200).send({'ok': "ok"})
  } catch (error) {
    console.log(error);
    return res.status(400).send({'error': "Something wrong happend"})
  }
});

router.put('/:id', async(req, res) => {
  const doc = { name: req.body.name };
  try {
    await Notebook.update({_id: req.params.id}, doc)
    return res.status(200).send({'ok': 'ok' })
  } catch (err) {
    return res.status(400).send({'error': "Something wrong happend"})
  }
})

router.post('/note/:id', async(req, res) => {

  const note = {
    "name": "name",
  }

  try {
    Notebook.findOneAndUpdate(
      { _id: req.params.id },
      { $push: { "notes.name": "note" } }
    );


    console.log(await Notebook.find({_id: req.params.id}))

    return res.status(200).send({ "ok": "ok" })
  } catch (error) {
    console.log(error)
    return res.status(400).send({'error': "Something wrong happend"})
  }
});

router.get('/', async(req, res) => {
  try {
    return res.status(200).send(await Notebook.find());
  } catch(error) {
    return res.status(400).send({'error': "Something wrong happend"})
  }
})

module.exports = app => app.use('/notebooks', router);