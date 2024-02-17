const path = require('path');
const mysql = require('mysql');

const getExpressBackendRoute = (app) => {
    app.get('/express_backend', (req, res) => {
        res.send({ express: "Подключено" });
        console.log("App.js sessionId:", req.cookies.sessionId);
    });
}

const checkUser = (app) => {
    app.post('/checkUser', (req, res) => {
        const connection = mysql.createConnection({
            host: 'bds8x3eqjt659zexhm6k-mysql.services.clever-cloud.com',
            user: 'ukpquiunilgd9a3d',
            password: 'sKRLt00lD4FffUASauii',
            database: 'bds8x3eqjt659zexhm6k',
            port: 3306
        });

        const { username, mail, number } = req.body;
        const query = 'SELECT COUNT(*) as count FROM users WHERE username = ? OR mail = ? Or number = ?';

        connection.query(query, [username, mail, number], (error, results) => {
            if (error) {
                console.error('Ошибка при проверке пользователя:', error);
                res.status(500).json({ success: false, error: 'Ошибка при проверке пользователя' });
            } else {
                const userExists = results[0].count > 0;
                res.json({ success: true, exists: userExists });
            }
        });

        connection.end();
    });
}

const getUserInfo = (app) => {
    // Эндпоинт для получения информации о пользователе
    app.post('/user', (req, res) => {
        const sessionId = req.cookies.sessionId;

        if (sessionId) {
            // Подключение к базе данных (замените значения на свои)
            const connection = mysql.createConnection({
                host: 'bds8x3eqjt659zexhm6k-mysql.services.clever-cloud.com',
                user: 'ukpquiunilgd9a3d',
                password: 'sKRLt00lD4FffUASauii',
                database: 'bds8x3eqjt659zexhm6k',
                port: 3306
            });

            // Подготовленный запрос для безопасности
            const query = 'SELECT id,username,mail,number FROM users WHERE sessionId = ?';

            connection.query(query, [sessionId], (error, results) => {
                if (error) {
                    console.error('Ошибка при запросе к базе данных:', error);
                    res.json({ success: false, error: 'Ошибка при запросе к базе данных' });
                } else {
                    if (results.length > 0) {
                        const userInfo = results[0]; // Предполагаем, что результат - это объект пользователя
                        res.json({ success: true, user: userInfo });
                    } else {
                        res.json({ success: false, error: 'Пользователь не найден' });
                    }
                }

                // Закрываем соединение с базой данных
                connection.end();
            });
        } else {
            res.json({ success: false, error: 'Отсутствует sessionId' });
        }
    });
}

const checkSession = (app) => {
    app.get('/checkSession', (req, res) => {
        const sessionId = req.cookies.sessionId;

        if (sessionId) {
            // Здесь вы должны выполнить запрос к базе данных для проверки существования сессии
            const connection = mysql.createConnection({
                host: 'bds8x3eqjt659zexhm6k-mysql.services.clever-cloud.com',
                user: 'ukpquiunilgd9a3d',
                password: 'sKRLt00lD4FffUASauii',
                database: 'bds8x3eqjt659zexhm6k',
                port: 3306
            });

            const query = 'SELECT COUNT(*) as count FROM users WHERE sessionId = ?';

            connection.query(query, [sessionId], (error, results) => {
                if (error) {
                    console.error('Ошибка при проверке сессии:', error);
                    res.status(500).json({ success: false, error: 'Ошибка при проверке сессии' });
                } else {
                    const sessionExists = results[0].count > 0;
                    res.json({ success: sessionExists });
                }

                connection.end();
            });
        } else {
            res.json({ success: false });
        }
    });
}

const getProduct = (productId, categoryName, tableName) => {
    return new Promise((resolve, reject) => {
        const connection = mysql.createConnection({
            host: 'bds8x3eqjt659zexhm6k-mysql.services.clever-cloud.com',
            user: 'ukpquiunilgd9a3d',
            password: 'sKRLt00lD4FffUASauii',
            database: 'bds8x3eqjt659zexhm6k',
            port: 3306
        });

        let productInfo = {
            table_name: tableName,
            title: null,
            price: null,
            img: null,
        };

        if (productInfo.table_name == null) {
            switch (categoryName) {
                case "Популярные товары":
                    productInfo.table_name = "items";
                    break;
                case "Новинки":
                    productInfo.table_name = "novelty";
                    break;
                case "Скидки":
                    productInfo.table_name = "discounts";
                    break;
                case "Каталог":
                    productInfo.table_name = "products";
                    break;
                default:
                    reject('Неверная категория товара');
                    return;
            }
        }

        const query = `SELECT * FROM ${productInfo.table_name} WHERE id = ?`;

        connection.query(query, [productId], (error, results) => {
            if (error) {
                connection.end();
                reject('Ошибка при получении товара: ' + error.message);
            } else {
                if (results.length > 0) {
                    productInfo.title = results[0].title;
                    productInfo.price = results[0].price;
                    productInfo.img = results[0].img;
                    connection.end();
                    resolve(productInfo);
                } else {
                    reject('Товар с id ' + productId + ' не найден в таблице ' + table_name);
                }
            }
        });
    });
};


const addToCart = (app) => {
    // Подключение к базе данных
    const connection = mysql.createConnection({
        host: 'bds8x3eqjt659zexhm6k-mysql.services.clever-cloud.com',
        user: 'ukpquiunilgd9a3d',
        password: 'sKRLt00lD4FffUASauii',
        database: 'bds8x3eqjt659zexhm6k',
        port: 3306
    });

    // SQL-запрос для добавления товара в корзину
    const addToCartQuery = `
        INSERT INTO cart (user_id, product_id, product_name, count, price, total_price, table_name)
        VALUES (?, ?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE count = count + VALUES(count), total_price = count * price
    `;

    app.post('/cart', async (req, res) => {
        // Получение данных о товаре из тела запроса
        const { product_id, category, user_info } = req.body;

        // Получение информации о товаре из product_info
        const product_info = await getProduct(product_id, category, null); // Предполагается, что product_info содержит информацию о товаре

        // Проверка наличия необходимых данных
        if (!product_id || !category || !user_info || !product_info) {
            return res.status(400).json({ error: 'Недостаточно данных для добавления в корзину' });
        }

        // Попытка выполнить SQL-запрос
        connection.query(addToCartQuery, [user_info.id, product_id, product_info.title, 1, product_info.price, product_info.price, product_info.table_name], (error, results) => {
            if (error) {
                console.error(error);
                return res.status(500).json({ error: 'Произошла ошибка при добавлении товара в корзину' });
            } else {
                return res.status(200).json({ success: true, message: 'Товар успешно добавлен в корзину' });
            }
        });
    });
};

const getUserCart = (app) => {
    app.post('/getCart', async (req, res) => {
        const connection = mysql.createConnection({
            host: 'bds8x3eqjt659zexhm6k-mysql.services.clever-cloud.com',
            user: 'ukpquiunilgd9a3d',
            password: 'sKRLt00lD4FffUASauii',
            database: 'bds8x3eqjt659zexhm6k',
            port: 3306
        });

        const userId = req.body.sessionInfo.userInfo.id;
        const query = `SELECT * FROM cart WHERE user_id = ?`;

        connection.query(query, [userId], async (error, results) => {
            if (error) {
                connection.end();
                console.error('Ошибка при получении корзины пользователя:', error);
                res.status(500).json({ error: 'Ошибка при получении корзины пользователя' });
            } else {
                try {
                    const cartItems = [];
                    for (const item of results) {
                        const productInfo = await getProduct(item.product_id, null, item.table_name);
                        cartItems.push({ ...item, product_info: productInfo });
                    }
                    connection.end();
                    console.log('Корзина пользователя успешно получена:', cartItems);
                    res.status(200).json(cartItems);
                } catch (error) {
                    console.error('Ошибка при получении информации о продукте:', error);
                    res.status(500).json({ error: 'Ошибка при получении информации о продукте' });
                }
            }
        });
    });
};

const logutUser = (app) => {
    app.post('/logout', (req, res) => {
        // Удаление куки сессии
        res.clearCookie('sessionId');
        res.json({ success: true });
    });
}

module.exports = {
    getExpressBackendRoute,
    checkUser,
    getUserInfo,
    checkSession,
    logutUser,
    addToCart,
    getUserCart
}