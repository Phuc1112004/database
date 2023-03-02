const express = require("express");
const app = express();
const PORT = process.env.PORT || 5000;        // PORT cổng ngẫu nhiên

const configDB = {
    host: '139.180.186.20',
    port: 3306,
    user: 'demo',
    password: 's(20A5Q.Mvk(bvoP',               // dùng xampp thì để trống
    database:'demo_s1',
    multipleStatements: true
};
const mysql = require("mysql2");
const conn = mysql.createConnection(configDB);

app.listen(PORT,function (){
    console.log(`Server is running on port ${PORT}`);
});

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});


app.get("/api/authors",function (req,res){           //gọi ra theo đường link
    var sql="select* from nhom4_authors";
    conn.query(sql,function (err,data) {
        if (err) res.send("404 not found");
        else res.send(data);
    });
});

app.get("/api/categories",function (req,res){           //gọi ra theo đường link
    var sql="select* from nhom4_categories";
    conn.query(sql,function (err,data) {
        if (err) res.send("404 not found");
        else res.send(data);
    });
});

app.get("/api/tags",function (req,res){           //gọi ra theo đường link
    var sql="select* from nhom4_subcategories";
    conn.query(sql,function (err,data) {
        if (err) res.send("404 not found");
        else res.send(data);
    });
});

app.get("/api/images",function (req,res){           //gọi ra theo đường link
    var sql="select* from nhom4_images";
    conn.query(sql,function (err,data) {
        if (err) res.send("404 not found");
        else res.send(data);
    });
});

app.get("/api/posts",function (req,res){           //gọi ra theo đường link
    var sql="select* from nhom4_posts";
    conn.query(sql,function (err,data) {
        if (err) res.send("Cannot fetching posts from database");
        else res.send(data);
    });
});

app.get("/api/planet",function (req,res){           //gọi ra theo đường link
    var sql="select* from nhom4_planet";
    conn.query(sql,function (err,data) {
        if (err) res.send("404 not found");
        else res.send(data);
    });
});

app.get("/api/categories/detail",function (req,res){
    var id = req.query.id;
    var sql = `select * from nhom4_categories where id = ${id}`;
    conn.query(sql,function (err,data){
        if(err) res.send(err);
        else if(data.length > 0)
            res.send(data[0]);
        else res.send("404 not found");
    });
});

app.get("/api/authors/detail",function (req,res){
    var id = req.query.id;
    var sql = `select * from nhom4_authors where id = ${id}`;
    conn.query(sql,function (err,data){
        if(err) res.send(err);
        else if(data.length > 0)
            res.send(data[0]);
        else res.send("404 not found");
    });
});
app.get("/api/images/detail",function (req,res){
    var id = req.query.id;
    var sql = `select * from nhom4_images where id = ${id}`;
    conn.query(sql,function (err,data){
        if(err) res.send(err);
        else if(data.length > 0)
            res.send(data[0]);
        else res.send("404 not found");
    });
});

app.get("/api/planet/detail",function (req,res){
    var id = req.query.id;
    var sql = `select * from nhom4_planet where id = ${id}`;
    conn.query(sql,function (err,data){
        if(err) res.send(err);
        else if(data.length > 0)
            res.send(data[0]);
        else res.send("404 not found");
    });
});
app.get("/api/posts/detail",function (req,res){
    var id = req.query.id;
    var sql = `select * from nhom4_posts where id = ${id}`;
    conn.query(sql,function (err,data){
        if(err) res.send(err);
        else if(data.length > 0)
            res.send(data[0]);
        else res.send("404 not found");
    });
});



