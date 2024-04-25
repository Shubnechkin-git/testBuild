const getColor = (app, connection) => {
    app.get('/getColor', async (req, res) => {
        return res.status(200).json({ success: true, message: 'Настройки получены!' })
    });
}

const setColor = (app, connection) => {
    app.post('/updateColor', async (req, res) => {

        const color = req.body.color;
        const section = req.body.section;
        const query = `UPDATE settings SET ${section} = ?`;

        connection.query(query, color, (results, error) => {
            if (error) {
                return res.status(200).json({ success: true, message: 'Фон был успешно сохранен!' })
            }
            else {
                console.error(error);
                return res.status(500).json({ success: false, error: error, message: 'Произошла ошибка при обновление фона!' });
            }
        });
    });
};

module.exports = {
    setColor,
    getColor
}; 