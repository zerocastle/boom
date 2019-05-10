var express = require('express');
var router = express.Router();
var juso = null;
router.get('/', function(req,res) {
	res.sendfile(__dirname + '/juso.html');
});

router.post('/', function(req,res) {
    juso = null;
    console.log(req.body);  
    console.log(req.body.data);
    juso = req.body.data;
})

router.get('/mobile', function(req,res) {
	
	res.send(juso);
	juso = null;
});
module.exports = router;