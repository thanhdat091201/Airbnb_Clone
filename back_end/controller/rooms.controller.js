const RoomsService = require('../services/rooms.services');

exports.getAll = async(req, res, next) => {
    try {
        const rooms = await RoomsService.getAllRooms();
        res.status(200).json(rooms);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

exports.getByCategory = async(req, res, next) => {
    try {
        const category = req.params.category;
        const rooms = await RoomsService.getRoomsByCategory(category);
        res.status(200).json(rooms);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}