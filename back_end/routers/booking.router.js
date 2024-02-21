const router = require('express').Router();
const BookingController = require('../controller/booking.controller');

router.get('/', BookingController.getAllBookings);
router.get('/:bookingId', BookingController.getBookingById);
router.post('/', BookingController.createBooking);
router.put('/:bookingId', BookingController.updateBooking);
router.delete('/:bookingId', BookingController.deleteBooking);

module.exports = router;