const path = require('path');

const getAnyRoute = (app, connection) => {
    if (process.env.NODE_ENV === 'production') {
        // app.get("/*", function (req, res) {
        //     // res.sendFile(path.join(__dirname + './../my-shop', 'build', 'index.html'));
        //     res.sendFile(path.join(__dirname));
        //     // res.sendFile(path.join(__dirname + '/build', 'index.html'));
        // });
        app.get('*', (req, res) => {
            res.sendFile(path.join(__dirname, '../my-shop/build', 'index.html'));
        });
    }
}

const getExpressBackendRoute = (app, connection) => {
    app.get('/express_backend', (req, res) => {
        res.send({ express: "Подключено" });
        console.log("App.js sessionId:", req.cookies.sessionId);
    });
}

const checkUser = (app, connection) => {
    app.post('/checkUser', (req, res) => {

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


    });
}

const getUserInfo = (app, connection) => {
    // Эндпоинт для получения информации о пользователе
    app.post('/user', (req, res) => {
        const sessionId = req.cookies.sessionId;

        if (sessionId) {
            // Подключение к базе данных (замените значения на свои)

            // Подготовленный запрос для безопасности
            const query = 'SELECT id,username,mail,number,isAdmin FROM users WHERE sessionId = ?';

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

            });
        } else {
            res.json({ success: false, error: 'Отсутствует sessionId' });
        }
    });
}

const checkSession = (app, connection) => {
    app.get('/checkSession', (req, res) => {
        const sessionId = req.cookies.sessionId;

        if (sessionId) {
            // Здесь вы должны выполнить запрос к базе данных для проверки существования сессии

            const query = 'SELECT COUNT(*) as count FROM users WHERE sessionId = ?';

            connection.query(query, [sessionId], (error, results) => {
                if (error) {
                    console.error('Ошибка при проверке сессии:', error);
                    res.status(500).json({ success: false, error: 'Ошибка при проверке сессии' });
                } else {
                    const sessionExists = results[0].count > 0;
                    res.json({ success: sessionExists });
                }


            });
        } else {
            res.json({ success: false });
        }
    });
}

const getProduct = (productId, categoryName, tableName, connection) => {
    return new Promise((resolve, reject) => {

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

                reject('Ошибка при получении товара: ' + error.message);
            } else {
                if (results.length > 0) {
                    productInfo.title = results[0].title;
                    productInfo.price = results[0].price;
                    productInfo.img = results[0].img;

                    resolve(productInfo);
                } else {
                    reject('Товар с id ' + productId + ' не найден в таблице ' + table_name);
                }
            }
        });
    });
};


const addToCart = (app, connection) => {

    // SQL-запрос для добавления товара в корзину
    const addToCartQuery = `
        INSERT INTO cart (user_id, product_id, product_name, category, count, price, total_price, table_name)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE count = count + VALUES(count), total_price = count * price
    `;

    app.post('/cart', async (req, res) => {
        // Получение данных о товаре из тела запроса
        const { product_id, category, user_info, count } = req.body;

        // console.log(req.body);
        // Получение информации о товаре из product_info
        const product_info = await getProduct(product_id, category, null, connection); // Предполагается, что product_info содержит информацию о товаре

        // Проверка наличия необходимых данных
        if (!product_id || !category || !user_info || !product_info) {
            return res.status(400).json({ error: 'Недостаточно данных для добавления в корзину' });
        }

        // Попытка выполнить SQL-запрос
        connection.query(addToCartQuery, [user_info.id, product_id, product_info.title, category, count, product_info.price, product_info.price, product_info.table_name], (error, results) => {
            if (error) {
                console.error(error);
                return res.status(500).json({ error: 'Произошла ошибка при добавлении товара в корзину' });
            } else {
                if (count == 1) {
                    return res.status(200).json({
                        success: true, message: 'Товар успешно добавлен в корзину!', data: {
                            product_id, product_info
                        }
                    });
                }
                else if (count == -1) {
                    return res.status(200).json({
                        success: true, message: 'Товар успешно удален из корзины!', data: {
                            product_id, product_info
                        }
                    });
                }
            }
        });
    });
};

const deleteFromCart = (app, connection) => {
    app.post('/deleteCart', async (req, res) => {

        const id = req.body.id;
        const query = `DELETE FROM cart WHERE id=?`;

        connection.query(query, id, (results, error) => {
            if (results) {
                console.log(results);
                return res.status(200).json({ success: true, message: 'Произошла ошибка при удаление товара из корзины!' })
            }
            else {
                console.error(error);
                return res.status(500).json({ success: false, error: 'Товар был успешно удален из корзины!' });
            }
        });
    });
}

const getUserCart = (app, connection) => {
    app.post('/getCart', async (req, res) => {
        const userId = req.body.sessionInfo.userInfo.id;
        if (req.body.cartProductId == null) {

            const query = `SELECT * FROM cart WHERE user_id = ?`;

            connection.query(query, [userId], async (error, results) => {
                if (error) {

                    console.error('Ошибка при получении корзины пользователя:', error);
                    res.status(500).json({ error: 'Ошибка при получении корзины пользователя' });
                } else {
                    try {
                        const cartItems = [];
                        for (const item of results) {
                            const productInfo = await getProduct(item.product_id, null, item.table_name, connection);
                            cartItems.push({ ...item, product_info: productInfo });
                        }

                        // console.log('Корзина пользователя успешно получена:', cartItems);
                        res.status(200).json(cartItems);
                    } catch (error) {
                        console.error('Ошибка при получении информации о продукте:', error);
                        res.status(500).json({ error: 'Ошибка при получении информации о продукте' });
                    }
                }
            });
        }
        else {
            const query = `SELECT * FROM cart WHERE id = ?`;

            connection.query(query, [req.body.cartProductId], async (error, results) => {
                if (error) {

                    console.error('Ошибка при получении корзины пользователя:', error);
                    res.status(500).json({ error: 'Ошибка при получении корзины пользователя' });
                } else {
                    try {
                        res.status(200).json(results[0]);
                    } catch (error) {
                        console.error('Ошибка при получении информации о продукте:', error);
                        res.status(500).json({ error: 'Ошибка при получении информации о продукте' });
                    }
                }
            });
        }
    });
};


const logutUser = (app, connection) => {
    app.post('/logout', (req, res) => {
        // Удаление куки сессии
        res.clearCookie('sessionId');
        res.json({ success: true });
    });
}

module.exports = {
    getAnyRoute,
    getExpressBackendRoute,
    checkUser,
    getUserInfo,
    checkSession,
    logutUser,
    addToCart,
    getUserCart,
    deleteFromCart
}