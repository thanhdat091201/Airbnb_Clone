const db = require('../config/db');
const mongoose = require('mongoose');

const {Schema} = mongoose;

const roomSchema = new Schema({
    category: {
        type: String,
        required: true,
    },
    displayImage: {
        type: String,
        required: true,
    },
    cardName: {
        type: String,
        required: true,
    },
    cardDistance: {
        type: String,
        required: true,
    },
    cardDate: {
        type: String,
        required: true,
    },
    cardPrice: {
        type: String,
        required: true,
    },
    cardRating: {
        type: String,
        required: true,
    },
});

const RoomsModel = db.model('rooms', roomSchema);

module.exports = RoomsModel;