require('dotenv').config();
const port = process.env.PORT || 3000;

const express = require('express');
const db = require(__dirname + '/modules/mysql2-connent');

// const Product = require('./models/Product');

const app = express();

// 樣版引擎 ejs
app.set('view engine', 'ejs');

// parse application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: false }));
// parse application/json
app.use(express.json());

// 靜態內容資料夾
app.use(express.static(__dirname + '/../public'));


// ----- 路由定義


app.get('/',(req,res)=>{
    res.send('hello!');
})

app.post('/',(req,res)=>{
    res.send('POST hello');
})




// --- try-db

app.get('/try-db',(req,res)=>{
    db.query('SELECT * FROM `items` LIMIT 5')
        .then(([r])=>{
            res.json(r);
        })
        .catch(error=>{
            res.send(error);
        });
})


// --- PRODUCT

app.use('/product', require(__dirname + '/routes/product'))



// 404 放在所有的路由後面
app.use((req, res)=>{
    res.type('text/html');
    res.status(404).send('<h1>找不到頁面</h1>');
});

app.listen(port, ()=>{
    console.log(`sever : ${port}`);
})


