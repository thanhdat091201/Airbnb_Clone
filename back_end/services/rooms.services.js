const RoomsModel = require('../model/rooms.model');

class RoomService {
    static async getAllRooms() {
        try {
          const rooms = await RoomsModel.find();
          return rooms;
        } catch (error) {
          throw new Error('Failed to get rooms.');
        }
    }

    static async getRoomsByCategory(category) {
        try {
          const rooms = await RoomsModel.find({ category });
          return rooms;
        } catch (error) {
          throw new Error('Failed to get rooms by category.');
        }
    }
}

module.exports = RoomService;