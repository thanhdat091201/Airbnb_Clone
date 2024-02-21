const FavoriteService = require('../services/favorite.services');

exports.addToFavorites = async (req, res, next) => {
    try {
        const { roomId, userId } = req.body;
        const successRes = await FavoriteService.addToFavorites(roomId, userId);
        res.json({status:true, success:"Successfully added to favorites" });
    } catch (error) {
        res.status(500).json({ message: 'Failed to add to favorites' });
    }
}

exports.getFavoriteRooms = async (req, res, next) => {
    try {
        const { userId } = req.params;
        const favoriteRooms = await FavoriteService.getFavoriteRooms(userId);
        res.status(200).json(favoriteRooms);
    } catch (error) {
        res.status(500).json({ message: 'Failed to get favorite rooms' });
    }
}

exports.removeFromFavorites = async (req, res, next) => {
    try {
        const { roomId, userId } = req.params;
        const successRes = await FavoriteService.removeFromFavorites(roomId, userId);
        // res.status(200).json({ message: 'Successfully removed from favorites' });
        res.json({status:true, success:"Successfully removed from favorites" });
    } catch (error) {
        res.status(500).json({ message: 'Failed to remove from favorites' });
    }
}
