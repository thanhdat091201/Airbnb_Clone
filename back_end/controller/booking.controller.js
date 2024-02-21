const BookingService = require('../services/booking.services');

exports.getAllBookings = async (req,res,next) => {
    try {
        const bookings = await BookingService.getAllBookings();
        res.status(200).json(bookings);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

exports.getBookingById = async (req,res,next) => {
    try {
        const { bookingId } = req.params;
        const booking = await BookingService.getBookingById(bookingId);
        res.status(200).json(booking);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

exports.createBooking = async (req,res,next) => {
    try {
        const bookingData = req.body;
        const booking = await BookingService.createBooking(bookingData);
        res.status(201).json(booking);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}


exports.updateBooking = async (req,res,next) => {
    try {
        const { bookingId } = req.params;
        const bookingData = req.body;
        const booking = await BookingService.updateBooking(bookingId, bookingData);
        res.status(200).json(booking);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

exports.deleteBooking  = async (req,res,next) => {
    try {
        const { bookingId } = req.params;
        await BookingService.deleteBooking(bookingId);
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}