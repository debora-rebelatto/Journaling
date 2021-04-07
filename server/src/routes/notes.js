const express = require('express');
const Notebook = require('../models/Notebooks');

const router = express.Router();

router.post('/', async(req, res) => {
  let { id } = req.body;

  try{
    if(!await Notebook.find({id: id})) return res.status(400).send({ "error": "Not found!" })

  } catch(err) {

  }
});

router.delete('/', async(req, res) => {

});

router.get('/', async(req, res) => {
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
})

module.exports = app => app.use('/notes', router);