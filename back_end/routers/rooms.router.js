const router = require('express').Router();
const RoomsController = require('../controller/rooms.controller');

router.get('/GetRoomsAll', RoomsController.getAll);
router.get('/getRoomsByCategory/:category', RoomsController.getByCategory);

module.exports = router;
