const express = require('express');
const body_parser = require('body-parser');
const userRouter = require('./routers/user.router');
const roomRouter = require('./routers/rooms.router');
const favoriteRouter = require('./routers/favorite.router');
const bookingRouter = require('./routers/booking.router');

const app = express();

app.use(body_parser.json());

app.use('/', userRouter);

app.use('/rooms', roomRouter);

app.use('/favorites', favoriteRouter);

app.use('/booking', bookingRouter);

app.use((err, req, res, next) => {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  });

module.exports = app;