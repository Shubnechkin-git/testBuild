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
        const connection = mysql.createConnection({
            host: 'bds8x3eqjt659zexhm6k-mysql.services.clever-cloud.com',
            user: 'ukpquiunilgd9a3d',
            password: 'sKRLt00lD4FffUASauii',
            database: 'bds8x3eqjt659zexhm6k',
            port: 3306
        });

        connection.connect((err) => {
            if (err) {
                console.error('Ошибка при соединении с базой данных:', err);
                res.status(500).json({ error: 'Ошибка при соединении с базой данных' });
                return;
            }

            connection.query('SELECT * FROM products', (error, results) => {
                if (error) {
                    console.error('Ошибка при выполнении запроса к базе данных:', error);
                    res.status(500).json({ error: 'Ошибка при выполнении запроса к базе данных' });
                    return;
                }

                connection.end();
                res.status(200).json(results);
            });
        });
    });

}

module.exports = {
    getCatalogItem
}