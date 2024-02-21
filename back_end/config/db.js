const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb://127.0.0.1:27017/Airbnb')
  .on('open', () => {
    console.log("Mongodb Connected Successfully");
  })
  .on('error', (err) => {
    console.log("Mongodb Connection Fail (ERROR)", err); 
  }); 

module.exports = connection;