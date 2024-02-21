require('dotenv').config();
const express = require('express');
const morgan = require("morgan");
const {log} = require("mercedlogger");
const cors = require('cors');
const mongoose = require('mongoose');
const User = require('./api/models/User');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const CookieParser = require('cookie-parser');
const app = express();

app.use(express.json());
app.use(CookieParser());
app.use(cors({
  credentials: true,
  origin: 'http://127.0.0.1:5173',
}));
app.use(morgan("tiny"));

const bcryptSalt = bcrypt.genSaltSync(10);

mongoose.connect(process.env.MONGO_URL)

app.get('/test', (req, res) => {
  res.json('Hello World!')
})

app.post('/register', async (req, res) => {
  const { name, email, password } = req.body
  try {
    const userDoc = await User.create({
      name,
      email,
      password: bcrypt.hashSync(password, bcryptSalt)
    })
    res.json(userDoc)
  } catch(err) {
    res.status(422).json(err)
  }
})

app.post('/login', async (req, res) => {
  mongoose.connect(process.env.MONGO_URL);
  const { email, password } = req.body
  const userDoc = await User.findOne({email});
  if (userDoc) {
    const passOk = await bcrypt.compareSync(password, userDoc.password)
    // passOk ? res.cookie('token', '').json('pass ok') : res.status(422).json('pass not ok')
    if (passOk) {
      jwt.sign({email: userDoc.email, id: userDoc._id}, process.env.TOKEN_SECRET, {}, (err,token) => {
        if (err) throw err;
        res.cookie('token', token).json(token);
      })
    } else {
      res.status(422).json({ error: "Password doesn't match" });
    }
  } else {
    res.json({ error: "User doesn't exist" })
  }
})

app.get('/profile', (req,res) => {
  // mongoose.connect(process.env.MONGO_URL);
  const {token} = req.cookies;
  if (token) {
    jwt.verify(token, process.env.TOKEN_SECRET, {}, async (err, userData) => {
      if (err) throw err;
      const {name,email,_id} = await User.findById(userData.id);
      res.json({name,email,_id});
    });
  } else {
    res.json(null);
  }
});

app.get('/loggout', (req, res) => {
  res.clearCookie('token');
  return  res.json({Status: "Success"});
});

app.listen(process.env.PORT, () => log.green("SERVER STATUS", `Listening on port ${process.env.PORT}`))