const mysql = require('mysql');

const getData = (tag, callback) => {
    const connection = mysql.createConnection({
        host: 'bds8x3eqjt659zexhm6k-mysql.services.clever-cloud.com',
        user: 'ukpquiunilgd9a3d',
        password: 'sKRLt00lD4FffUASauii',
        database: 'bds8x3eqjt659zexhm6k',
        port: 3306
    });

    connection.connect((err) => {
        if (err) {
            return callback(err, null);
        }

        if (tag === 'hot') {
            connection.query('SELECT * from items', (error, results) => {
                if (error) {
                    connection.end();
                    return callback(error, null);
                }

                connection.end();
                callback(null, results);
            });
        } else if (tag === 'disc') {
            connection.query('SELECT * from discounts', (error, results) => {
                if (error) {
                    connection.end();
                    return callback(error, null);
                }
                connection.end();
                callback(null, results);
            });
        }
        else if (tag === 'nov') {
            connection.query('SELECT * from novelty', (error, results) => {
                if (error) {
                    connection.end();
                    return callback(error, null);
                }
                connection.end();
                callback(null, results);
            });
        }
    });
};

const getUser = (sessionId) => {
    const connection = mysql.createConnection({
        host: 'bds8x3eqjt659zexhm6k-mysql.services.clever-cloud.com',
        user: 'ukpquiunilgd9a3d',
        password: 'sKRLt00lD4FffUASauii',
        database: 'bds8x3eqjt659zexhm6k',
        port: 3306
    });

    connection.query(`SELECT username FROM users WHERE session = ${sessionId}`, (error, results) => {
        if (error) {
            connection.end();
            return callback(error, null);
        }

        connection.end();
        callback(null, results);
    });
}

module.exports = { getData, getUser };