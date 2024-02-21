const router = require('express').Router();
const FavoritesController = require('../controller/favorite.controller');

router.post('/add', FavoritesController.addToFavorites);
router.get('/:userId/rooms', FavoritesController.getFavoriteRooms);
router.delete('/:roomId/:userId', FavoritesController.removeFromFavorites);

module.exports = router;
