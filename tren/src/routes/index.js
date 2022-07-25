const router = require("express-promise-router")();
const {registerUser} = require("../controllers/user");
const {login} = require("../controllers/user");
const {getrain,sellsit} = require("../controllers/tren");

router.post("/register", registerUser);
router.post("/login",login);
router.get("/tren",getrain)

module.exports = router;