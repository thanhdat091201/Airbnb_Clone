const FavoriteModel = require('../model/favorite.model');

class FavoriteService {
    static async addToFavorites(roomId, userId) {
        try {
            const CreateFavorite = new FavoriteModel({roomId, userId});
            return await CreateFavorite.save();
        } catch (err) {
            throw err;
        }
    }

    static async getFavoriteRooms(userId) {
        try {
            const favorites = await FavoriteModel.find({ userId }).populate('roomId');
            const favoriteRooms = favorites.map((favorite) => favorite.roomId);
            return favoriteRooms;
        } catch (err) {
            throw err;
        }
    }

    static async removeFromFavorites(userId) {
        try {
            await FavoriteModel.findOneAndRemove({ roomId, userId });
        } catch (err) {
            throw err;
        }
    }
}

module.exports = FavoriteService;
