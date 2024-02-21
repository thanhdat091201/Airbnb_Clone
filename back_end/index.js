const app = require('./app');
const db = require('./config/db');
const UserModel = require('./model/user.model');
const RoomsModel = require('./model/rooms.model');
const BookingModel = require('./model/booking.model');
const FavoriteModel = require('./model/favorite.model');

const port = 3000;

app.get('/', (req, res) => {
    res.send('Welcome Nguyen Thanh Dat!')
});

app.listen(port, () => {
    console.log(`listening on port http://localhost:${port}`)
});