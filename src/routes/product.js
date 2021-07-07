const express = require('express');

const Product = require(__dirname + '/../models/Product');

const router = express.Router();


// 取得所有商品 + 篩選 ?
router.get('/', async (req, res)=>{
    // res.json([req.baseUrl, req.url]);
    res.json(await Product.getRows());
});



// 取得分類商品
// router.get('/:itemCategoryId', async (req, res)=>{
//     res.json(await Product.getRows(req.params.itemCategoryId));
// });


// 取得單項商品
router.get('/:itemId', async (req, res)=>{

    let p = await Product.getRow(req.params.itemId)

    res.json([req.baseUrl, req.url, p]);
});


module.exports = router;
