const BookingModel = require('../model/booking.model');

class BookingService {
  static async createBooking(bookingData) {
    try {
        const booking = new BookingModel(bookingData);
        const newBooking = await booking.save();
        return newBooking;
    } catch (error) {
        throw new Error('Failed to reserve the room');
    }
  }

  static async getAllBookings() {
    try {
        const bookings = await BookingModel.find();
        return bookings;
    } catch (error) {
        throw new Error('Failed to get bookings.');
    }
  }

  static async getBookingById(bookingId) {
    try {
        const booking = await BookingModel.findById(bookingId);
        return booking;
    } catch (error) {
        throw error;
    }
  }

  static async updateBooking (bookingId, bookingData) {
    try {
        const booking = await BookingModel.findByIdAndUpdate(bookingId, bookingData, { new: true });
        return booking;
    } catch (error) {
        throw new Error('Failed to update booking.');
    }
  }

  static async deleteBooking (bookingId) {
    try {
        await BookingModel.findByIdAndDelete(bookingId);
    } catch (error) {
        throw new Error('Failed to delete booking.');
    }
  }
}

module.exports = BookingService;
