const express = require('express');

const router = express.Router();

router.get('/', async(req, res) => {
  console.log('jkdhsadsakjh');
  return res.status(200).send('dffsdfdsf');
});

module.exports = app => app.use('/user', router)