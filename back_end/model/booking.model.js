const db = require('../config/db');
const mongoose = require('mongoose');
const UserModel = require('../model/user.model');
const RoomsModel = require('../model/rooms.model');
const {Schema} = mongoose;

const bookingSchema = new Schema({
    roomId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: UserModel.modelName,
        required: true,
    },
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: RoomsModel.modelName,
        required: true,
    },
    checkInDate: {
        type: Date,
        required: true,
    },
    checkOutDate: {
        type: Date,
        required: true,
    },
    adults: {
        type: Number,
        required: true,
    },
    children: {
        type: Number,
        required: true,
    },
    infants: {
        type: Number,
        required: true,
    },
    pets: {
        type: Number,
        required: true,
    },
    paymentMethod: {
        type: String,
        required: true,
    },
    totalPrice: {
        type: Number,
        required: true,
    }
});

const BookingModel = db.model('booking', bookingSchema);

module.exports = BookingModel;
