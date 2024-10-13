// Получаем элемент изображения
const img = document.getElementById('bouncing-image');

// Переменные для позиций и скоростей
let posX, posY;
let speedX = 2; // Скорость по оси X
let speedY = 2; // Скорость по оси Y

// Переменные для размеров изображения
let imgWidth, imgHeight;

// Угол для вращения
let angle = 0;

// Функция анимации
function animate() {
    // Обновляем позиции
    posX += speedX;
    posY += speedY;

    // Проверяем столкновения с границами
    if (posX + imgWidth >= window.innerWidth || posX <= 0) {
        speedX = -speedX;
    }
    if (posY + imgHeight >= window.innerHeight || posY <= 0) {
        speedY = -speedY;
    }

    // Обновляем угол для вращения
    angle += 2;
    img.style.transform = `rotate(${angle}deg)`;

    // Перемещаем изображение
    img.style.left = posX + 'px';
    img.style.top = posY + 'px';

    // Запускаем анимацию
    requestAnimationFrame(animate);
}

// Функция инициализации
function init() {
    // Получаем размеры изображения
    imgWidth = img.offsetWidth;
    imgHeight = img.offsetHeight;

    // Инициализируем начальные позиции
    posX = Math.random() * (window.innerWidth - imgWidth);
    posY = Math.random() * (window.innerHeight - imgHeight);

    // Случайное начальное направление
    if (Math.random() < 0.5) speedX = -speedX;
    if (Math.random() < 0.5) speedY = -speedY;

    // Устанавливаем начальные позиции изображения
    img.style.left = posX + 'px';
    img.style.top = posY + 'px';

    // Запускаем анимацию
    animate();
}

// Проверяем, загружено ли изображение
if (img.complete) {
    // Если изображение уже загружено, инициализируем анимацию сразу
    init();
} else {
    // Иначе ждем события загрузки изображения
    img.onload = init;
}

// Обновляем размеры изображения при изменении размера окна
window.addEventListener('resize', () => {
    imgWidth = img.offsetWidth;
    imgHeight = img.offsetHeight;
});
