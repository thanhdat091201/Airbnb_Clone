const db = require('../config/db');
const mongoose = require('mongoose');
const UserModel = require('../model/user.model');
const RoomsModel = require('../model/rooms.model');
const {Schema} = mongoose;

const favoriteSchema = new Schema({
    roomId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: RoomsModel.modelName,
        required: true,
    },
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: UserModel.modelName,
        required: true,
    },
});


const FavoriteModel = db.model('favorite', favoriteSchema);

module.exports = FavoriteModel;