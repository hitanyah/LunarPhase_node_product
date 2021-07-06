const express = require('express');

const Product = require(__dirname + '/../models/Product');

const router = express.Router();



// 取得所有商品 + 篩選 ?
router.get('/product', async (req, res)=>{
    res.json([req.baseUrl, req.url]);
});



// 取得商品


// 取得單項商品
router.get('/:sid', async (req, res)=>{

    let p = await Product.getRow(req.params.sid)

    res.json([req.baseUrl, req.url, p]);
});


module.exports = router;
