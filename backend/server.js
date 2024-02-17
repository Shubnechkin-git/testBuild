const express = require('express'); //Строка 1
const app = express(); //Строка 2
const port = process.env.PORT || 5000; //Строка 3
const path = require('path');

const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');

const login = require('./login');
const register = require('./register');
const { getHotItems, getNoveltyItems, getDiscountItems, getProduct } = require('./items');
const { getExpressBackendRoute, checkUser, getUserInfo, checkSession, logutUser, addToCart } = require('./routes');
const { getCatalogItem } = require('./catalog');
// Сообщение о том, что сервер запущен и прослушивает указанный порт 
app.listen(port, () => console.log(`Listening on port http://localhost:${port}`)); //Строка 6

var cors = require('cors')
const corsOptions = {
  origin: 'https://testbuild-27ld.onrender.com/', // Укажите ваш домен React-приложения
  optionsSuccessStatus: 200, // некоторые старые браузеры (IE11, старый Android) не отправляют 204
};

app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '../build')));

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');

  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content - Type, Accept, Authorization');

  if (req.method === 'OPTIONS') {

    res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE, GET');

    return res.status(200).json({});

  }

  next();

})



app.options('/register', cors());
app.options('/catalog', cors());

register(app);

login(app);

getHotItems(app);

getNoveltyItems(app);

getDiscountItems(app);

getProduct(app); //возращает 

getCatalogItem(app); //возращает товары в каталог

checkUser(app);//проверяет есть ли пользователь в бд

checkSession(app);//проверяет сессию

logutUser(app);//реагирует на конпку выход из профиля по пути /logout

getUserInfo(app);//ответ на user

addToCart(app);//добавление товара в корзину /cart

getExpressBackendRoute(app);//ответ на express_backend

app.use((req, res) => {
  if (req.url != '/' && req.url != '/catalog' && req.url != '/profile' && req.url != '/about' && req.url != '/cart') {
    console.log(req.url);
    res.status(404).sendFile(path.join(__dirname, '../build', '404.html'));
  }
  else
    res.status(404).sendFile(path.join(__dirname, '../build', 'index.html'));
});

