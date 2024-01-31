const mysql = require('mysql');

const getCatalogItem = (app) => {
    // let items = [{
    //     title: 'Catalog1',
    //     img: 'https://mamcupy.com/upload/resize_cache/iblock/fa1/602_401_240cd750bba9870f18aada2478b24840a/fa12434d56b924044312fc1a21254674.jpg',
    //     price: '2333'
    // },
    // {
    //     title: 'Catalog2',
    //     img: 'https://mamcupy.com/upload/resize_cache/iblock/fa1/602_401_240cd750bba9870f18aada2478b24840a/fa12434d56b924044312fc1a21254674.jpg'
    // },
    // {
    //     title: 'Catalog3',
    //     img: 'https://mamcupy.com/upload/resize_cache/iblock/fa1/602_401_240cd750bba9870f18aada2478b24840a/fa12434d56b924044312fc1a21254674.jpg'
    // },
    // {
    //     title: 'Catalog4',
    //     img: 'https://mamcupy.com/upload/resize_cache/iblock/fa1/602_401_240cd750bba9870f18aada2478b24840a/fa12434d56b924044312fc1a21254674.jpg'
    // },
    // {
    //     title: 'Catalog5',
    //     img: 'https://mamcupy.com/upload/resize_cache/iblock/fa1/602_401_240cd750bba9870f18aada2478b24840a/fa12434d56b924044312fc1a21254674.jpg'
    // },
    // ]
    app.get('/catalog', (req, res) => {
        res.setHeader('Content-Type', 'application/json');
        const connection = mysql.createConnection({
            host: 'sql10.freemysqlhosting.net',
            user: 'sql10679533',
            password: 'TxZCTlZdK6',
            database: 'sql10679533',
            port: 3306
        });
        connection.connect((err) => {
            if (err) {
                return err;
            }
            else {
                connection.query('SELECT * from products', (error, results) => {
                    if (error) {
                        connection.end();
                        return callback(error, null);
                    }
                    connection.end();
                    res.send(JSON.stringify(results));
                });
            }
        });

    })
}

module.exports = {
    getCatalogItem
}