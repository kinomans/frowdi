-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 01 2025 г., 19:03
-- Версия сервера: 8.0.29
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `frowdi_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `movie_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `movie_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 2, 2),
(6, 2, 3),
(7, 2, 4),
(8, 2, 5),
(9, 3, 2),
(10, 3, 3),
(11, 3, 4),
(12, 3, 5),
(13, 4, 2),
(14, 4, 3),
(15, 4, 4),
(16, 4, 5),
(17, 5, 2),
(18, 5, 3),
(19, 5, 4),
(20, 5, 5),
(21, 6, 2),
(22, 6, 3),
(23, 6, 4),
(24, 6, 5),
(25, 7, 2),
(26, 7, 3),
(27, 7, 4),
(28, 7, 5),
(29, 8, 2),
(30, 8, 3),
(31, 8, 4),
(32, 8, 5),
(33, 9, 2),
(34, 9, 3),
(35, 9, 4),
(36, 9, 5),
(37, 10, 2),
(38, 10, 3),
(39, 10, 4),
(40, 10, 5),
(41, 11, 6),
(42, 11, 7),
(43, 11, 8),
(44, 12, 6),
(45, 12, 7),
(46, 12, 8),
(47, 13, 6),
(48, 13, 7),
(49, 13, 8),
(50, 14, 6),
(51, 14, 7),
(52, 14, 8),
(53, 15, 6),
(54, 15, 7),
(55, 15, 8),
(56, 16, 6),
(57, 16, 7),
(58, 16, 8),
(59, 17, 6),
(60, 17, 7),
(61, 17, 8),
(62, 18, 6),
(63, 18, 7),
(64, 18, 8),
(65, 19, 9),
(66, 19, 10),
(67, 19, 52),
(68, 19, 53),
(69, 19, 54),
(70, 19, 55),
(71, 20, 9),
(72, 20, 10),
(73, 20, 52),
(74, 20, 53),
(75, 20, 54),
(76, 20, 55),
(77, 21, 9),
(78, 21, 10),
(79, 21, 52),
(80, 21, 53),
(81, 21, 54),
(82, 21, 55),
(83, 22, 9),
(84, 22, 10),
(85, 22, 52),
(86, 22, 53),
(87, 22, 54),
(88, 22, 55),
(89, 23, 9),
(90, 23, 10),
(91, 23, 52),
(92, 23, 53),
(93, 23, 54),
(94, 23, 55),
(95, 24, 9),
(96, 24, 10),
(97, 24, 52),
(98, 24, 53),
(99, 24, 54),
(100, 24, 55),
(102, 32, 143);

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`id`, `name`, `image`) VALUES
(1, 'Боевик', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1000443.jpg'),
(2, 'Приключения', '/assets/posters/genre-pricl.png'),
(3, 'Комедия', '/assets/posters/genre-comedy.jpg'),
(4, 'Драма', '/assets/posters/genre-drama.png'),
(5, 'Фантастика', '/assets/posters/genre-fantastica.png'),
(6, 'Ужасы', 'https://kinopoiskapiunofficial.tech/images/posters/kp/45771.jpg'),
(7, 'Триллер', '/assets/posters/genre-triler.png'),
(8, 'Фэнтези', 'https://kinopoiskapiunofficial.tech/images/posters/kp/407636.jpg'),
(9, 'Мультфильм', 'https://kinopoiskapiunofficial.tech/images/posters/kp/458.jpg'),
(10, 'Детектив', '/assets/posters/genre-detective.png'),
(11, 'Мелодрама', 'https://kinopoiskapiunofficial.tech/images/posters/kp/900052.jpg'),
(12, 'Криминал', 'https://kinopoiskapiunofficial.tech/images/posters/kp/325.jpg'),
(13, 'Семейный', '/assets/posters/genre-sem.jpg'),
(16, 'Военный', 'https://kinopoiskapiunofficial.tech/images/posters/kp/930878.jpg'),
(18, 'Спорт', 'https://kinopoiskapiunofficial.tech/images/posters/kp/601564.jpg'),
(19, 'Музыка', 'https://kinopoiskapiunofficial.tech/images/posters/kp/395690.jpg'),
(20, 'История', '/assets/posters/genre-history.png');

-- --------------------------------------------------------

--
-- Структура таблицы `movies`
--

CREATE TABLE `movies` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int DEFAULT NULL,
  `duration` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` float DEFAULT '0',
  `trailer_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cover_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` bigint DEFAULT NULL,
  `revenue` bigint DEFAULT NULL,
  `director` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `producer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `awards` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `genre_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `poster_url`, `year`, `duration`, `rating`, `trailer_url`, `created_at`, `cover_url`, `original_language`, `country`, `budget`, `revenue`, `director`, `producer`, `awards`, `genre_id`) VALUES
(2, 'Лёд 3', 'Batman faces the Joker, a criminal mastermind who wants to create chaos.', 'https://kinopoiskapiunofficial.tech/images/posters/kp_small/5275429.jpg', 2024, '2ч 13м', 9, 'https://www.youtube.com/embed/JnI__lj4peQ', '2025-04-26 04:15:27', 'https://kinopoiskapiunofficial.tech/images/posters/kp_small/5275429.jpg', 'Русский', 'Россия', 500000000, 1530000000, 'Юрий Хмельницкий', 'Фёдор Бондарчук, Андрей Золотарёв', NULL, 4),
(3, 'Папины дочки', 'Проклятие Васнецовых настигает уже повзрослевших дочерей семейного психотерапевта. В канун очередной годовщины свадьбы из дома сбегает Даша, оставив трудоголику Венику прощальное письмо, обручальное кольцо и четырёх дочерей. Теперь Вениамин, совсем как его тесть когда-то, вынужден стать для своих детей и папой, и мамой, и другом. А поможет ему в этом неунывающее семейство Васнецовых.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/5249042.jpg', 2023, '1ч 30м', 8.6, 'https://www.youtube.com/embed/zSWdZVtXT7E', '2025-04-26 04:15:27', 'https://kinopoiskapiunofficial.tech/images/posters/kp/5249042.jpg', 'Русский', 'Россия', NULL, NULL, 'СТС, Start', 'СТС, Start', NULL, 3),
(4, 'Воздух', 'The aging patriarch of an organized crime dynasty transfers control to his reluctant son.', '/assets/posters/air.png', 2023, '2ч 31м', 9.1, 'https://www.youtube.com/embed/ruZhIOYK5Tc', '2025-04-26 04:15:27', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1311129.jpg', 'Русский', 'Россия', 450000000, 558000000, 'Алексей Герман-младший', 'Metrafilms, Амедиа продакшн', '6 премий Золотой орёл', 16),
(5, 'Холоп', '27-летний московский мажор Григорий ошалел от безнаказанности. Богатый папа стабильно его отмазывает, да так, что уже обновил автопарк и оборудование отделению полиции, где служит начальником его друг. После очередной выходки терпение отца иссякает, и он обращается к психологу, практикующему шоковые методы воздействия на пациентов.\\n\\nВскоре сынуля попадает в аварию и приходит в себя на деревенской конюшне. На дворе — Россия 1860 года, а сам он — бесправный конюх Гришка, которому за любую провинность и ослушание всегда готовы всыпать плетей, а то и вздёрнуть на глазах у всего честного народа.', '/assets/posters/lackey.png', 2019, '1ч 53м', 7.2, 'https://www.youtube.com/embed/C8m6K_Er3BI', '2025-04-26 04:15:27', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1183582.jpg', 'Русский', 'Россия', 200000000, 323103809, 'Клим Шипенко', 'КиноАтис', 'Награда \"Золотой орел\" за лучший актерский состав.\n', 3),
(6, 'Беспринципные', 'Добро пожаловать на Патриаршие. Смешные и волнующие подробности личной жизни богатых москвичей, которые, как и все, попадают в неловкие ситуации. Правда, ситуации у них не самые обычные... Жена чувствует себя виноватой, познакомившись с любовницей мужа. Муж прикрывается выдуманной дочерью друга. А друг толкает помощника на измену, потому что так хочет жена. И это только начало. Одним словом, неприличные истории о приличных, казалось бы, людях.', '/assets/posters/besprinc.png', 2020, '8 серий по 47 мин', 9.2, 'https://www.youtube.com/embed/JFBkBbB0FOs', '2025-04-27 16:57:59', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1355059.jpg', 'Русский', 'Россия', 109000000, 308000000, 'Роман Прыгунов', 'Медиаслово, Кинопоиск HD', 'Лучший комедийный онлайн-сериал на Национальной кинематографической премии АПКИТ и \"Сериал года\" на LEADERS Awards.', 3),
(7, 'Три Богатыря и путь земли', 'Увлекательные приключения самого известного сыщика всех времён', '/assets/posters/threeheroes.png', 2023, '1ч 25м', 8.3, 'https://www.youtube.com/embed/J3xIDk0K5BM', '2025-04-27 17:31:42', 'https://avatars.mds.yandex.net/get-kinopoisk-image/10809116/eaae6412-29ca-422c-93cf-d2774d054dcd/300x450', 'Русский', 'Россия', 8000000, 1164548872, 'Константин Феоктистов', 'Мельница, СТВ', 'ТЭФИ-Kids в номинации \"Лучший анимационный фильм для детей', 9),
(8, 'Инспектор Гаврилов', 'В надежде начать новую жизнь рецидивист Саша Медный решается на последнее ограбление. Но все идет не по плану. Скрываясь от преследования на поезде до Владивостока, он присваивает себе имя и форму соседа по купе — майора Гаврилова. Так недавний мошенник становится блюстителем порядка — начальником полиции провинциального Усть-Шахтинска. Насаждая в городе свои порядки, Медный переворачивает обычный уклад российской глубинки.', '/assets/posters/InspectorGavrilov.png', 2023, '17 серий по 50 мин', 8.2, 'https://www.youtube.com/embed/coMvsaJ3ch0', '2025-04-27 17:31:57', 'https://kinopoiskapiunofficial.tech/images/posters/kp/5321393.jpg', 'Русский', 'Россия', NULL, NULL, 'Кирилл Васильев', 'Start, Okko, Premier, Кинопоиск, СТС', NULL, 3),
(9, 'Шифр', 'Москва, 1956 год. Четыре женщины, которых связывает военное прошлое — работа в спецотделе ГРУ — сходятся вновь, чтобы вести расследования и помогать следственным органам в особо запутанных делах. Обладая феноменальными аналитическими способностями, Ирина, Анна, Софья и Катерина, рискуя собой, а также благополучием собственных семей, ловят преступников, которые угрожают жизни простых людей и всей стране в целом.', '/assets/posters/thecipher.png', 2019, '16 серий по 52 мин', 8.1, 'https://www.youtube.com/embed/O8Jh0pJ81K4', '2025-04-27 17:31:57', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1108411.jpg', 'Русский', 'Россия', NULL, NULL, 'Вера Сторожева', 'Первый канал', 'Премия АПКиТ 2023 в номинации «Лучший телесериал (5–24 серий)»', 10),
(10, 'Командир', 'Геннадий Зайцев — обычный подросток в глухой уральской деревне. Он вырос в многодетной семье без отца, но сумел пережить трудности военного детства и послевоенной разрухи, и стать у истоков создания антитеррористического подразделения «Группа «Альфа».\\n1 декабря 1988 года в г. Орджоникидзе (ныне Владикавказ) террористы захватывают в заложники 32 ребёнка, учительницу и водителя. Под руководством Зайцева проходит сложнейшая операция, в результате которой все заложники были освобождены, а террористы арестованы.', '/assets/posters/Commander.png', 2024, '2ч 24м', 8, 'https://www.youtube.com/embed/qFmvbxeQYX8', '2025-04-27 17:31:57', 'https://kinopoiskapiunofficial.tech/images/posters/kp/5277148.jpg', 'Русский', 'Россия', 230000000, 166981012, 'Александр Гурьянов, Тимур Хван', 'КарроПрокат', 'Специальный приз Губернатора Алтайского края на XXVI Всероссийском Шукшинском кинофестивале, Лучший художественный фильм VIII «Майкопского Международного Фильм Фестиваля», и Главный приз на фестивале МосФестФильм в номинации «Лучшая мужская роль» (победитель — Кирилл Зайцев). Также картина победила в номинации «Приз музея Победы» на III Международном фестивале Правильного кино.', 1),
(52, 'Брат 2', 'Данила отправляется в США, чтобы помочь другу. Продолжение культового фильма.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/41520.jpg', 2000, '2ч 7м', 8.2, 'https://www.youtube.com/embed/4WZ1gFVN1aI', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/41520.jpg', 'Русский', 'Россия', 1000000, 13000000, 'Алексей Балабанов', 'СТВ', 'Премия MTV Россия', 1),
(53, 'Левиафан', 'В российском городке автослесарь Коля сталкивается с коррупцией власти.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/79848.jpg', 2014, '2ч 20м', 7.7, 'https://www.youtube.com/watch?v=XmtXC_n6X6Q', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp_small/79848.jpg', 'Русский', 'Россия', 2000000, 12000000, 'Андрей Звягинцев', 'Non-Stop Production', '«Золотой глобус», номинация на «Оскар».', 4),
(54, 'Москва слезам не верит', 'Москва, 1950-е годы. Три молодые провинциалки приезжают в Москву в поисках того, что ищут люди во всех столицах мира — любви, счастья и достатка. Антонина выходит замуж, растит детей, любит мужа. Людмиле Москва представляется лотереей, в которой она должна выиграть свое особенное счастье. Катерина же отчаянно влюбляется, но избранник ее оставляет. Однако она не опускает руки, в одиночку растит дочь и к тому же успевает делать блестящую карьеру. В 40 лет судьба дарит ей неожиданную встречу.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46708.jpg', 1979, '2ч 30м', 8.2, 'https://www.youtube.com/embed/9noEXoYStAA', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp_small/46708.jpg', 'Русский', 'СССР', 600000, 36000000, 'Владимир Меньшов', 'Мосфильм', '«Оскар» за лучший иностранный фильм.', 4),
(55, 'Ирония судьбы, или С лёгким паром!', '31 декабря пошли друзья в баню попариться, по традиции смыть с себя все плохое, чтобы встретить Новый год чистыми, а «напарились» до такой степени (пивом и водкой), что отправили в Ленинград не того.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/77331.jpg', 1975, '3ч 8м', 8.6, 'https://www.youtube.com/embed/sDdrTIp8mxs', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/77331.jpg', 'Русский', 'СССР', 200000, 7000000, 'Эльдар Рязанов', 'Мосфильм', 'Гос. премия СССР', 3),
(56, 'Операция «Ы» и другие приключения Шурика', 'Студент Шурик попадает в самые невероятные ситуации: сражается с хулиганом Верзилой, весьма оригинальным способом готовится к экзамену и предотвращает «ограбление века», на которое идёт троица бандитов — Балбес, Трус и Бывалый.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/42782.jpg', 1965, '1ч 36м', 8.5, 'https://www.youtube.com/embed/hrvzSFKqifk', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/42782.jpg', 'Русский', 'СССР', 50000, 6000000, 'Леонид Гайдай', 'Мосфильм', 'Самый кассовый фильм 1965 года.', 3),
(57, 'Вий', 'Студент-философ Хома Брут должен провести в деревенской церкви три ночи у гроба умершей панночки. Парень будет читать молитвы над телом покойницы, но в деревне ходят слухи, что она была ведьмой.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/45771.jpg', 1967, '1ч 18м', 7.4, 'https://www.youtube.com/embed/XZLpVypDxVQ', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/45771.jpg', 'Русский', 'СССР', 70000, 1000000, 'Георгий Кропачёв, Константин Ершов', 'Мосфильм', 'Культовый советский хоррор.', 6),
(58, 'Ночной дозор', 'В мире, где идёт вечная война Света и Тьмы, обычный москвич оказывается втянутым в мистическую борьбу.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/79850.jpg', 2004, '1ч 54м', 6.4, 'https://www.youtube.com/embed/cl-lJiJsKCI', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/79850.jpg', 'Русский', 'Россия', 4200000, 33000000, 'Тимур Бекмамбетов', 'СТВ', 'Премия MTV Россия', 7),
(59, 'Дневной дозор', 'Ночью в подъезде своего дома убита молодая женщина. Убитая — Тёмная иная, а значит подозрение падает на Светлых. Гессер срочно собирает команду: обвинение в убийстве — серьезная проблема. Он должен понять, кто где был и чем занимался в указанное Тёмными время. Выясняется, что алиби отсутствует только у Городецкого.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/79925.jpg', 2006, '2ч 19м', 6.5, 'https://www.youtube.com/embed/4KjeC72cCCc', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/79925.jpg', 'Русский', 'Россия', 4000000, 36000000, 'Тимур Бекмамбетов', 'СТВ', 'Премия MTV Россия', 7),
(60, 'Кин-дза-дза!', 'Герои случайно попадают на пустынную планету, где всё решают спички.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/44811.jpg', 1986, '2ч 15м', 8, 'https://www.youtube.com/embed/D5VLYyM4QOA', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/44811.jpg', 'Русский', 'СССР', 800000, 6000000, 'Георгий Данелия', 'Мосфильм', 'Культовая советская фантастика.', 5),
(61, 'Сталкер', 'Проводник ведёт двух людей по загадочной Зоне в поисках исполнения желаний.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/43970.jpg', 1979, '2ч 41м', 8.2, 'https://www.youtube.com/embed/rtH9RyJ7uDc', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/43970.jpg', 'Русский', 'СССР', 1000000, 4000000, 'Андрей Тарковский', 'Мосфильм', 'Каннский фестиваль — приз ФИПРЕССИ', 5),
(62, 'Солярис', 'Психолог приезжает на космическую станцию, чтобы выяснить причину странных событий.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/43911.jpg', 1972, '2ч 47м', 8, 'https://www.youtube.com/embed/qqRmegVcWaA', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/43911.jpg', 'Русский', 'СССР', 900000, 9000000, 'Андрей Тарковский', 'Мосфильм', 'Гран-при Каннского фестиваля', 5),
(63, 'Асса', 'Любовная история на фоне перестроечного Крыма и рок-музыки.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/43545.jpg', 1987, '2ч 33м', 7.7, 'https://www.youtube.com/embed/lMBYCTsWJ1o', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/43545.jpg', 'Русский', 'СССР', 700000, 5000000, 'Сергей Соловьев', 'Мосфильм', 'Культовый советский фильм.', 4),
(64, 'Джентльмены удачи', 'Трое преступников и один доцент с одинаковой внешностью. Классическая советская комедия.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/44386.jpg', 1971, '1ч 24м', 8.5, 'https://www.youtube.com/embed/bJlTZraE2n8', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/44386.jpg', 'Русский', 'СССР', 30000, 6500000, 'Александр Серый', 'Мосфильм', 'Самый популярный фильм 1971 года.', 3),
(65, 'Кавказская пленница, или Новые приключения Шурика', 'Шурик отправляется в командировку и оказывается втянут в похищение невесты.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/44745.jpg', 1967, '1ч 22м', 8.4, 'https://www.youtube.com/embed/vz_VHUr-Pps', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/44745.jpg', 'Русский', 'СССР', 40000, 7600000, 'Леонид Гайдай', 'Мосфильм', 'Золотой приз ММКФ', 3),
(66, '12 стульев', 'Остап Бендер и Киса Воробьянинов ищут сокровища, спрятанные в одном из 12 стульев.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46789.jpg', 1971, '2ч 39м', 8.4, 'https://www.youtube.com/embed/pLTetoXkfFw', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46789.jpg', 'Русский', 'СССР', 150000, 7300000, 'Леонид Гайдай', 'Мосфильм', 'Культовая советская комедия.', 3),
(67, 'Собачье сердце', 'Профессор Преображенский превращает собаку в человека. По повести Булгакова.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/77335.jpg', 1988, '2ч 16м', 8.8, 'https://www.youtube.com/embed/cYOo77ZM8Oo', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/77335.jpg', 'Русский', 'СССР', 600000, 6700000, 'Владимир Бортко', 'Ленфильм', 'Премия ТЭФИ', 4),
(68, 'Любовь и голуби', 'История простой советской семьи, где супруг внезапно увлекается курортным романом.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/45146.jpg', 1984, '1ч 47м', 8.3, 'https://www.youtube.com/embed/JKb4rUfHJbY', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/45146.jpg', 'Русский', 'СССР', 100000, 5900000, 'Владимир Меньшов', 'Мосфильм', 'Любимая комедия миллионов.', 4),
(69, 'Остров', 'Судьба бывшего моряка на отдалённом монастыре. Драма о раскаянии и вере.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/397667.jpg', 2006, '1ч 52м', 8, 'https://www.youtube.com/embed/-1FMMTVQVs4', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp/397667.jpg', 'Русский', 'Россия', 1000000, 5000000, 'Павел Лунгин', 'Студия СТВ', 'Премия «Золотой орёл»', 4),
(71, 'Побег из Шоушенка', 'Заключённый Энди Дюфрейн обвинён в убийстве жены и её любовника. В тюрьме Шоушенк он заводит дружбу и не теряет надежды на свободу.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/326.jpg', 1994, '2ч 22м', 9.3, 'https://www.youtube.com/embed/kgAeKpAPOYk', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/326.jpg', 'Английский', 'США', 25000000, 28341469, 'Фрэнк Дарабонт', 'Castle Rock Entertainment', '7 номинаций на «Оскар», 21 победа.', 4),
(72, 'Крёстный отец', 'Глава мафиозной семьи Корлеоне передаёт власть своему сыну. Классика гангстерского жанра.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/325.jpg', 1972, '2ч 55м', 9.2, 'https://www.youtube.com/embed/E3b9jVCUh7Q', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/325.jpg', 'Английский', 'США', 6000000, 246120974, 'Фрэнсис Форд Коппола', 'Paramount Pictures', '3 «Оскара», 32 других награды.', 12),
(73, 'Крёстный отец 2', 'Вторая часть эпопеи о семье Корлеоне: юность Вито и укрепление власти Майкла.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/327.jpg', 1974, '3ч 22м', 9, 'https://www.youtube.com/embed/oQgTfIlAN64', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/327.jpg', 'Английский', 'США', 13000000, 47542841, 'Фрэнсис Форд Коппола', 'Paramount Pictures', '6 «Оскаров».', 12),
(74, 'Список Шиндлера', 'Реальная история немецкого промышленника, спасшего сотни евреев во время Холокоста.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/329.jpg', 1993, '3ч 15м', 8.9, 'https://www.youtube.com/embed/4r2Z0U9Y53o', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/329.jpg', 'Английский', 'США', 22000000, 322000000, 'Стивен Спилберг', 'Amblin Entertainment', '7 «Оскаров», «Золотой глобус».', 4),
(75, 'Форрест Гамп', 'Трогательная история необычного человека, на чью долю выпало множество испытаний.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/448.jpg', 1994, '2ч 22м', 8.8, 'https://www.youtube.com/embed/otmeAaifX04', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/448.jpg', 'Английский', 'США', 55000000, 678222284, 'Роберт Земекис', 'Paramount Pictures', '6 «Оскаров».', 4),
(76, '1+1 (Неприкасаемые)', 'Парализованный аристократ и его необычный помощник из бедного квартала. Тёплая французская драма.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/535341.jpg', 2011, '1ч 52м', 8.8, 'https://www.youtube.com/embed/tTwFeGArcrs', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/535341.jpg', 'Французский', 'Франция', 9500000, 426588510, 'Оливье Накаш, Эрик Толедано', 'Gaumont', 'Премия «Сезар»', 4),
(77, 'Титаник', 'История любви на фоне крушения знаменитого лайнера.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/2213.jpg', 1997, '3ч 15м', 8.7, 'https://www.youtube.com/embed/9IleMM5QBQ8', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp_small/2213.jpg', 'Английский', 'США', 200000000, 2200000000, 'Джеймс Кэмерон', '20th Century Fox', '11 «Оскаров».', 11),
(78, 'Зелёная миля', 'Тюремный надзиратель открывает в заключённом удивительный дар. Драма по Стивену Кингу.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/435.jpg', 1999, '3ч 9м', 8.6, 'https://www.youtube.com/embed/TODt_q-_4C4', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/435.jpg', 'Английский', 'США', 60000000, 286801374, 'Фрэнк Дарабонт', 'Castle Rock Entertainment', '4 номинации на «Оскар».', 4),
(79, 'Властелин колец: Возвращение короля', 'Финальная битва за Средиземье и уничтожение Кольца Всевластия.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/3498.jpg', 2003, '3ч 21м', 8.9, 'https://www.youtube.com/embed/lxAeV1-KpSA', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/3498.jpg', 'Английский', 'Новая Зеландия', 94000000, 1146030912, 'Питер Джексон', 'New Line Cinema', '11 «Оскаров».', 8),
(80, 'Властелин колец: Братство Кольца', 'Группа героев отправляется уничтожить опасное кольцо. Начало великой трилогии.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/328.jpg', 2001, '2ч 58м', 8.8, 'http://youtube.com/embed/RNksw9VU2BQ', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/328.jpg', 'Английский', 'Новая Зеландия', 93000000, 871530324, 'Питер Джексон', 'New Line Cinema', '4 «Оскара».', 8),
(81, 'Властелин колец: Две крепости', 'Путешествие продолжается, герои встречают новые испытания.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/312.jpg', 2002, '2ч 59м', 8.7, 'https://www.youtube.com/embed/n8EaedqFfuU', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/312.jpg', 'Английский', 'Новая Зеландия', 94000000, 926047111, 'Питер Джексон', 'New Line Cinema', '2 «Оскара».', 8),
(82, 'Начало', 'Группа профессионалов внедряет идеи в подсознание во сне.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/447301.jpg', 2010, '2ч 28м', 8.8, 'https://www.youtube.com/embed/85Zz1CCXyDI', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/447301.jpg', 'Английский', 'США', 160000000, 836800000, 'Кристофер Нолан', 'Warner Bros.', '4 «Оскара».', 5),
(83, 'Интерстеллар', 'Команда астронавтов отправляется через червоточину в другую галактику, чтобы спасти человечество.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/258687.jpg', 2014, '2ч 49м', 8.6, 'https://www.youtube.com/embed/xHGRCBV46ik', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/258687.jpg', 'Английский', 'США', 165000000, 701729206, 'Кристофер Нолан', 'Paramount Pictures', '1 «Оскар».', 5),
(84, 'Матрица', 'Компьютерный хакер узнаёт правду о реальности и восстании машин.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/301.jpg', 1999, '2ч 16м', 8.7, 'https://www.youtube.com/embed/YihPA42fdQ8', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/301.jpg', 'Английский', 'США', 63000000, 463517383, 'Лана Вачовски, Лилли Вачовски', 'Warner Bros.', '4 «Оскара».', 5),
(85, 'Терминатор 2: Судный день', 'Робот из будущего защищает мальчика от более совершенного киборга.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/444.jpg', 1991, '2ч 17м', 8.5, 'https://www.youtube.com/embed/2AOhYuL20ac', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/444.jpg', 'Английский', 'США', 102000000, 520000000, 'Джеймс Кэмерон', 'TriStar Pictures', '4 «Оскара».', 5),
(86, 'Тёмный рыцарь', 'Бэтмен поднимает ставки в войне с криминалом. С помощью лейтенанта Джима Гордона и прокурора Харви Дента он намерен очистить улицы Готэма от преступности. Сотрудничество оказывается эффективным, но скоро они обнаружат себя посреди хаоса, развязанного восходящим криминальным гением, известным напуганным горожанам под именем Джокер.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/111543.jpg', 2008, '2ч 32м', 9, 'https://www.youtube.com/embed/HF1_epZNoCg', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/111543.jpg', 'Английский', 'США', 185000000, 1004558444, 'Кристофер Нолан', 'Warner Bros.', '2 «Оскара».', 1),
(87, 'Достучаться до небес', 'Два смертельно больных друга отправляются навстречу мечте.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/32898.jpg', 1997, '1ч 27м', 8.7, 'https://www.youtube.com/embed/Slm8s89WTOo', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/32898.jpg', 'Немецкий', 'Германия', 3000000, 12000000, 'Томас Ян', 'Mr. Brown Entertainment', 'Культовый фильм.', 4),
(88, 'Бойцовский клуб', 'Офисный работник основывает подпольный клуб для борьбы со скукой жизни.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/361.jpg', 1999, '2ч 19м', 8.8, 'https://www.youtube.com/embed/C7-7qQ61QHU', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/361.jpg', 'Английский', 'США', 63000000, 101209702, 'Дэвид Финчер', 'Fox 2000 Pictures', 'Номинация на «Оскар».', 4),
(89, 'Амели', 'Девушка из Парижа решает делать мир вокруг лучше.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/341.jpg', 2001, '2ч 2м', 8.3, 'https://www.youtube.com/embed/IzmKcURzeNM', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/341.jpg', 'Французский', 'Франция', 10000000, 174200000, 'Жан-Пьер Жене', 'Claudie Ossard Productions', '4 «Сезара», 2 BAFTA.', 4),
(90, 'В погоне за счастьем', 'Крис Гарднер – отец-одиночка. Воспитывая пятилетнего сына, Крис изо всех сил старается сделать так, чтобы ребенок рос счастливым. Работая продавцом, он не может оплатить квартиру, и их выселяют.\\nОказавшись на улице, но не желая сдаваться, отец устраивается стажером в брокерскую компанию, рассчитывая получить должность специалиста. Только на протяжении стажировки он не будет получать никаких денег, а стажировка длится 6 месяцев...', 'https://kinopoiskapiunofficial.tech/images/posters/kp/104938.jpg', 2006, '1ч 57м', 8, 'https://www.youtube.com/embed/uemUXqy7mQI', '2025-05-22 13:22:06', 'https://kinopoiskapiunofficial.tech/images/posters/kp/104938.jpg', 'Английский', 'США', 55000000, 307100000, 'Габриеле Муччино', 'Overbrook Entertainment', 'Номинация на «Оскар».', 4),
(91, 'Шерлок Холмс и доктор Ватсон: Знакомство', 'Первая встреча великого сыщика и его верного друга.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/77269.jpg', 1979, '1ч 8м', 8.7, 'https://www.youtube.com/embed/VYML35ZisMQ', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/77269.jpg', 'Русский', 'СССР', 60000, 7000000, 'Игорь Масленников', 'Ленфильм', 'Любимейший советский детектив.', 10),
(92, 'Белое солнце пустыни', 'Легендарный приключенческий фильм о таможеннике Сухове.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46066.jpg', 1970, '1ч 23м', 8.5, 'https://www.youtube.com/embed/P4u13z7jlo4', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46066.jpg', 'Русский', 'СССР', 100000, 15000000, 'Владимир Мотыль', 'Мосфильм', 'Культовый фильм.', 2),
(93, 'Иван Васильевич меняет профессию', 'Учёный случайно отправляет в XX век царя Ивана Грозного.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/42664.jpg', 1973, '1ч 28м', 8.6, 'https://www.youtube.com/embed/0IALFVo90K4', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/42664.jpg', 'Русский', 'СССР', 60000, 7000000, 'Леонид Гайдай', 'Мосфильм', 'Одна из лучших советских комедий.', 3),
(98, 'Служебный роман', 'Две противоположности находят любовь в стенах учреждения.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/43869.jpg', 1977, '2ч 59м', 8.4, 'https://www.youtube.com/embed/rX1JWSTTksw', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/43869.jpg', 'Русский', 'СССР', 200000, 7200000, 'Эльдар Рязанов', 'Мосфильм', 'Культовая лирическая комедия.', 11),
(99, 'Ирония судьбы 2', 'С того Нового года, когда Женя Лукашин встретил свою Надю, прошло тридцать лет. Время не пощадило их отношений — они расстались, она вернулась в Ленинград. Старые друзья продолжают каждый год ходить в баню, но теперь к ним присоединился Костя — сын Жени Лукашина от нового брака, тоже, впрочем, неудачного. И вот Павел и Александр, ставшие уже дядей Пашей и дядей Сашей, подговаривают Костю совершить для отца новогоднее чудо и отправиться... в Петербург! \\n\\nНо в их хитрый план вмешивается случайность: там, в типовой квартирке по знакомому адресу: 3-я улица Строителей, дом 25, квартира 12, проживает красавица Наденька, дочь той самой Надежды. И именно сегодня её жених Ираклий приезжает, чтобы сделать Наде предложение..', 'https://kinopoiskapiunofficial.tech/images/posters/kp/276261.jpg', 2007, '1ч 55м', 6.2, 'https://www.youtube.com/embed/wIpQt7WcTvE', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/276261.jpg', 'Русский', 'Россия', 4000000, 50000000, 'Тимур Бекмамбетов', 'Базелевс', 'Российский блокбастер.', 3),
(100, 'Самый лучший день', 'История веселого деревенского полицейского, который влюбляется.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/843784.jpg', 2015, '1ч 52м', 6, 'https://www.youtube.com/embed/ylc1xUlIeC4', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/843784.jpg', 'Русский', 'Россия', 3000000, 26000000, 'Жора Крыжовников', 'Bazelevs', 'Премия «Золотой орёл».', 3),
(101, 'Стиляги', 'Это история Москвы начала пятидесятых, в которой компании молодых людей приходится бороться за право быть не такими как все, слушать другую музыку, по-другому одеваться и, конечно же, любить.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/395690.jpg', 2008, '2ч 10м', 7.6, 'https://www.youtube.com/embed/Bfck-H8pC8E', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/395690.jpg', 'Русский', 'Россия', 7000000, 17000000, 'Валерий Тодоровский', 'Красная стрела', 'Премия «Золотой орёл».', 19),
(102, 'Ёлки', 'Новогодние события происходят в 11 городах: Калининграде, Казани, Перми, Уфе, Бавлах, Екатеринбурге, Красноярске, Якутске, Новосибирске, Санкт-Петербурге и Москве. Герои фильма — таксист и поп-дива, бизнесмен и актер, сноубордист и лыжник, студент и пенсионерка, пожарный и директриса, вор и милиционер, гастарбайтер и президент России. Все они оказываются в самый канун Нового года в очень непростой ситуации, выйти из которой им поможет только чудо… или Теория шести рукопожатий, согласно которой каждый человек на земле знает другого через шесть знакомых.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/493768.jpg', 2010, '1ч 30м', 6.6, 'https://www.youtube.com/embed/DpfB6JW5YkE', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/493768.jpg', 'Русский', 'Россия', 3000000, 22000000, 'Тимур Бекмамбетов', 'Базелевс', 'Любимая российская комедия.', 13),
(103, 'Полосатый рейс', 'Моряки перевозят тигров и попадают в комичные ситуации.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/43104.jpg', 1961, '1ч 23м', 7.4, 'https://www.youtube.com/embed/AyQFn4GNCTY', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/43104.jpg', 'Русский', 'СССР', 30000, 6800000, 'Владимир Фетин', 'Ленфильм', 'Классика советского кино.', 3),
(104, 'Мимино', 'Тёплая комедия о дружбе и приключениях советского пилота.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46638.jpg', 1977, '1ч 37м', 8.2, 'https://www.youtube.com/embed/n5zyvvtFEE4', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46638.jpg', 'Русский', 'СССР', 70000, 7000000, 'Георгий Данелия', 'Мосфильм', 'Премия Госкино СССР.', 3),
(106, 'Обыкновенное чудо', 'Волшебная и трогательная история о любви и преодолении себя.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/77282.jpg', 1978, '2ч 46м', 8.2, 'https://www.youtube.com/embed/MoXrh28vdMU', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/77282.jpg', 'Русский', 'СССР', 120000, 7300000, 'Марк Захаров', 'Мосфильм', 'Культовый мюзикл.', 8),
(107, 'Король Лев', 'Молодой лев Симба должен занять место своего отца и спасти прайд.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/2360.jpg', 1994, '1ч 28м', 8.5, 'https://www.youtube.com/embed/OsKPzQV8qAg', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/2360.jpg', 'Английский', 'США', 45000000, 968500000, 'Роджер Аллерс, Роб Минкофф', 'Walt Disney Pictures', '2 «Оскара».', 9),
(108, 'Шрек', 'Огром Шрек отправляется спасать принцессу и заводит друзей.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/430.jpg', 2001, '1ч 30м', 8.1, 'https://www.youtube.com/embed/w6Vr7Fk9eZs', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/430.jpg', 'Английский', 'США', 60000000, 484400000, 'Эндрю Адамсон, Вики Дженсон', 'DreamWorks', 'Оскар за лучший анимационный фильм.', 9),
(109, 'Бременские музыканты', 'Весёлое музыкальное приключение по мотивам сказки братьев Гримм.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46223.jpg', 1969, '1ч 6м', 8, 'https://www.youtube.com/embed/YIAKiJ_aLI0', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46223.jpg', 'Русский', 'СССР', 30000, 4000000, 'Инессса Ковалевская', 'Союзмультфильм', 'Любимый мультик СССР.', 9),
(110, 'Жил-был пёс', 'Короткометражка о дружбе пса и волка. Мультфильм с легендарными цитатами.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/45319.jpg', 1982, '11 мин', 8.6, 'https://www.youtube.com/embed/IeZ8_XC1HHw', '2025-05-22 13:25:47', 'https://kinopoiskapiunofficial.tech/images/posters/kp/45319.jpg', 'Русский', 'СССР', 5000, 2000000, 'Эдуард Назаров', 'Союзмультфильм', 'Любимая анимация.', 9),
(111, 'Ну, погоди!', 'Легендарный советский мультсериал о приключениях Волка и Зайца.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46483.jpg', 1969, '7 мин (серия)', 9, 'https://www.youtube.com/embed/YqfkrRQgGo4', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/46483.jpg', 'Русский', 'СССР', 5000, 40000000, 'Вячеслав Котёночкин', 'Союзмультфильм', 'Самый популярный советский мультсериал.', 9),
(112, 'Трое из Простоквашино', 'Дружная компания мальчика, кота и пса заводит невероятные приключения.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/42326.jpg', 1978, '17 мин', 8.6, 'https://www.youtube.com/embed/E6k_Nhxjr0Q', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/42326.jpg', 'Русский', 'СССР', 6000, 8000000, 'Владимир Попов', 'Союзмультфильм', 'Любимый семейный мультфильм.', 9),
(113, 'Ежик в тумане', 'Добрый философский мультфильм о Ежике и его друге Медвежонке.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/42461.jpg', 1975, '10 мин', 8.2, 'https://www.youtube.com/embed/q0M1dTVHp8k', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/42461.jpg', 'Русский', 'СССР', 4000, 900000, 'Юрий Норштейн', 'Союзмультфильм', 'Лучший мультфильм XX века.', 9),
(114, 'Корпорация монстров', 'Два монстра открывают секрет смеха и страха.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/458.jpg', 2001, '1ч 32м', 8.1, 'https://www.youtube.com/embed/vpKxMNGPVMY', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/458.jpg', 'Английский', 'США', 115000000, 577400000, 'Пит Доктер', 'Pixar', 'Оскар за лучшую песню.', 9),
(115, 'История игрушек', 'Жизнь игрушек, которые оживают, когда на них не смотрят люди.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/482.jpg', 1995, '1ч 21м', 8.3, 'https://www.youtube.com/embed/oZs7E2vDQ4g', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/482.jpg', 'Английский', 'США', 30000000, 373554033, 'Джон Лассетер', 'Pixar', 'Оскар за спецэффекты.', 9),
(116, 'Тайна третьей планеты', 'Капитан Зеленый и Алиса ищут загадочную птицу на далёкой планете.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/42172.jpg', 1981, '50 мин', 8, 'https://www.youtube.com/embed/9CmHcr4s_mo', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/42172.jpg', 'Русский', 'СССР', 7000, 2500000, 'Роман Качанов', 'Союзмультфильм', 'Лучший советский мультфильм 1981 года.', 9),
(117, 'Дети шпионов', 'Дети становятся секретными агентами, чтобы спасти родителей.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/841.jpg', 2001, '1ч 28м', 5.6, 'https://www.youtube.com/embed/o3KiH5F62EY', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/841.jpg', 'Английский', 'США', 35000000, 147934180, 'Роберт Родригес', 'Dimension Films', 'Фантастика и приключения.', 2),
(118, 'Пираты Карибского моря: Проклятие Черной жемчужины', 'Капитан Джек Воробей и пираты ищут сокровища и сражаются с проклятием.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/4374.jpg', 2003, '2ч 23м', 8.1, 'https://www.youtube.com/embed/SBxju8HuSIQ', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/4374.jpg', 'Английский', 'США', 140000000, 654264015, 'Гор Вербински', 'Disney', 'Оскар за макияж.', 2),
(119, 'Гарри Поттер и философский камень', 'Жизнь десятилетнего Гарри Поттера нельзя назвать сладкой: родители умерли, едва ему исполнился год, а от дяди и тёти, взявших сироту на воспитание, достаются лишь тычки да подзатыльники. Но в одиннадцатый день рождения Гарри всё меняется. Странный гость, неожиданно появившийся на пороге, приносит письмо, из которого мальчик узнаёт, что на самом деле он - волшебник и зачислен в школу магии под названием Хогвартс. А уже через пару недель Гарри будет мчаться в поезде Хогвартс-экспресс навстречу новой жизни, где его ждут невероятные приключения, верные друзья и самое главное — ключ к разгадке тайны смерти его родителей.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/689.jpg', 2001, '2ч 32м', 7.6, 'https://www.youtube.com/embed/AFwrmkAHEk4', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/689.jpg', 'Английский', 'Великобритания', 125000000, 974755371, 'Крис Коламбус', 'Warner Bros.', '3 номинации на «Оскар».', 8),
(120, 'Гарри Поттер и Тайная комната', 'Гарри Поттер переходит на второй курс Школы чародейства и волшебства Хогвартс. Эльф Добби предупреждает Гарри об опасности, которая поджидает его там, и просит больше не возвращаться в школу.\\nЮный волшебник не следует совету эльфа и становится свидетелем таинственных событий, разворачивающихся в Хогвартсе. Вскоре Гарри и его друзья узнают о существовании Тайной Комнаты и сталкиваются с новыми приключениями, пытаясь победить темные силы.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/688.jpg', 2002, '2ч 41м', 7.4, 'https://www.youtube.com/embed/KZ2LPNjWeDM', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/688.jpg', 'Английский', 'Великобритания', 100000000, 879500000, 'Крис Коламбус', 'Warner Bros.', 'Номинации на BAFTA.', 8),
(121, 'Гарри Поттер и узник Азкабана', 'Гарри, Рон и Гермиона возвращаются на третий курс школы чародейства и волшебства Хогвартс. На этот раз они должны раскрыть тайну узника, сбежавшего из тюрьмы Азкабан, чье пребывание на воле создает для Гарри смертельную опасность.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/322.jpg', 2004, '2ч 22м', 7.9, 'https://www.youtube.com/embed/rRysSgY0yUE', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/322.jpg', 'Английский', 'Великобритания', 130000000, 796688549, 'Альфонсо Куарон', 'Warner Bros.', 'Номинация на «Оскар».', 8),
(122, 'Гарри Поттер и Кубок огня', 'Гарри Поттер, Рон и Гермиона возвращаются на четвёртый курс школы чародейства и волшебства Хогвартс. При таинственных обстоятельствах Гарри был отобран в число участников опасного соревнования — Турнира Трёх Волшебников, однако проблема в том, что все его соперники — намного старше и сильнее.\\nК тому же, знаки указывают на возвращение Лорда Волдеморта. Вскоре Гарри предстоит побороться не только за победу в соревновании, но и за свою жизнь.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/8408.jpg', 2005, '2ч 37м', 7.7, 'https://www.youtube.com/embed/9dlfKvJvcbQ', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/8408.jpg', 'Английский', 'Великобритания', 150000000, 896365071, 'Майк Ньюэлл', 'Warner Bros.', 'Номинация на «Оскар».', 8),
(123, 'Гарри Поттер и Орден Феникса', 'Гарри проводит свой пятый год в школе Хогвартс и обнаруживает, что многие из членов волшебного сообщества отрицают факт недавнего состязания юного волшебника с воплощением вселенского зла Волдемортом. Все делают вид, что не имеют ни малейшего представления, что злодей вернулся. Однако впереди волшебников ждет необычная схватка.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/48356.jpg', 2007, '2ч 18м', 7.5, 'https://www.youtube.com/embed/9w1ztHuuCd0', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/48356.jpg', 'Английский', 'Великобритания', 150000000, 942000000, 'Дэвид Йейтс', 'Warner Bros.', 'Номинация на BAFTA.', 8),
(124, 'Гарри Поттер и Принц-полукровка', 'Теперь не только мир волшебников, но и мир маглов ощущает на себе всевозрастающую силу Волан-де-Морта, а Хогвартс уже никак не назовешь надежным убежищем. Гарри подозревает, что в самом замке затаилась некая опасность, но Дамблдор больше сосредоточен на том, чтобы подготовить его к финальной схватке, которая, как он знает, уже не за горами. Вместе они пытаются разгадать секрет бессмертия Волан-де-Морта, а для этого Дамблдор приглашает на должность преподавателя по зельеварению своего старинного друга и коллегу — профессора Горация Слизнорта.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/89515.jpg', 2009, '2ч 33м', 7.6, 'https://www.youtube.com/embed/U0hMHgNw8hs', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/89515.jpg', 'Английский', 'Великобритания', 250000000, 934416487, 'Дэвид Йейтс', 'Warner Bros.', 'Номинация на «Оскар».', 8),
(125, 'Гарри Поттер и Дары Смерти: Часть I', 'Гарри Поттера ждёт самое страшное испытание в жизни — смертельная схватка с Волан-де-Мортом. Друзья и враги Гарри предстают в совершенно неожиданном свете. Граница между добром и злом становится всё призрачнее.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/276762.jpg', 2010, '2ч 26м', 7.7, 'https://www.youtube.com/embed/oBTJEwG2NOM', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/276762.jpg', 'Английский', 'Великобритания', 250000000, 976900000, 'Дэвид Йейтс', 'Warner Bros.', 'Номинация на BAFTA.', 8),
(126, 'Гарри Поттер и Дары Смерти: Часть II', 'Битва между добрыми и злыми силами мира волшебников перерастает во всеобщую войну. Ставки ещё никогда не были так высоки, а поиск убежища — столь сложен. И, быть может, именно Гарри Поттеру придется пожертвовать всем в финальном сражении с Волан-де-Мортом.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/407636.jpg', 2011, '2ч 10м', 8.1, 'https://www.youtube.com/embed/O5aCY_MPmzc', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/407636.jpg', 'Английский', 'Великобритания', 250000000, 1341000000, 'Дэвид Йейтс', 'Warner Bros.', '3 номинации на «Оскар».', 8),
(127, 'Человек-паук', 'Питер Паркер – обыкновенный школьник. Однажды он отправился с классом на экскурсию, где его кусает странный паук-мутант. Через время парень почувствовал в себе нечеловеческую силу и ловкость в движении, а главное – умение лазать по стенам и метать стальную паутину. Свои способности он направляет на защиту слабых. Так Питер становится настоящим супергероем по имени Человек-паук, который помогает людям и борется с преступностью. Но там, где есть супергерой, рано или поздно всегда объявляется и суперзлодей...', 'https://kinopoiskapiunofficial.tech/images/posters/kp/838.jpg', 2002, '2ч 1м', 7.3, 'https://www.youtube.com/embed/KLLhImjJ1NI', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/838.jpg', 'Английский', 'США', 139000000, 825025036, 'Сэм Рэйми', 'Columbia Pictures', 'Номинация на «Оскар».', 1),
(128, 'Человек-паук 2', 'Тихоня Питер Паркер балансирует на грани двух своих жизней: супергероя Человека-паука и обычного студента колледжа. Его отношения со всеми, кто ему дорог, в опасности или зашли в тупик. А жизнь приготовила ему новое испытание. Он должен использовать все свои суперспособности, чтобы одолеть жестокого безумца доктора Отто Октавиуса.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/2898.jpg', 2004, '2ч 7м', 7.4, 'https://www.youtube.com/embed/Kqug9t9t_l0', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/2898.jpg', 'Английский', 'США', 200000000, 789000000, 'Сэм Рэйми', 'Columbia Pictures', 'Оскар за визуальные эффекты.', 1),
(129, 'Человек-паук 3: Враг в отражении', 'Прошло пять лет с тех пор, как Питер осознал, что «с Великой силой приходит Великая ответственность!», и три года с тех пор, как он отказался быть борцом за справедливость. Но сейчас кажется, Питер прекрасно научился жить несколькими жизнями. Он хорошо учится, Нью-Йорк признал его героем, отношения с Мэри Джейн прочные. Питер даже намеревается сделать ей предложение!\\n\\nНо к сожалению, его лучший друг Гарри Озборн по-прежнему считает, что именно Человек-паук несет ответственность за безвременную кончину его отца. Гарри намеревается отомстить ему в образе Нового Гоблина. В то же самое время на криминальной сцене Нью-Йорка появляется другой могущественный суперзлодей, известный как Песочный Человек.\\n\\nКогда Человек-паук надевает таинственный черный костюм, его темная, более мстительная сторона полностью поглощает его. Эти трансформации заставляют его встретиться с самым сильным противником ― с самим собой…', 'https://kinopoiskapiunofficial.tech/images/posters/kp/82441.jpg', 2007, '2ч 19м', 6.2, 'https://www.youtube.com/embed/XahuuJFdJSw', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/82441.jpg', 'Английский', 'США', 258000000, 895000000, 'Сэм Рэйми', 'Columbia Pictures', 'Номинация на MTV Awards.', 1),
(130, 'Железный человек', 'Миллиардер-изобретатель Тони Старк попадает в плен к Афганским террористам, которые пытаются заставить его создать оружие массового поражения. В тайне от своих захватчиков Старк конструирует высокотехнологичную киберброню, которая помогает  ему сбежать. Однако по возвращении в США он узнаёт, что в совете директоров его фирмы плетётся заговор, чреватый страшными последствиями. Используя своё последнее изобретение, Старк пытается решить проблемы своей компании радикально...', 'https://kinopoiskapiunofficial.tech/images/posters/kp/61237.jpg', 2008, '2ч 6м', 7.9, 'https://www.youtube.com/embed/i_IIxuHAClc', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/61237.jpg', 'Английский', 'США', 140000000, 585174222, 'Джон Фавро', 'Marvel Studios', '2 номинации на «Оскар».', 1),
(131, 'Мстители', 'Локи возвращается, и в этот раз он не один. Земля оказывается на грани порабощения, и только лучшие из лучших могут спасти человечество. Глава международной организации Щ. И. Т. Ник Фьюри собирает выдающихся защитников справедливости и добра. Под предводительством Капитана Америки Железный Человек, Тор, Невероятный Халк, Соколиный Глаз и Чёрная Вдова вступают в войну с захватчиком.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/263531.jpg', 2012, '2ч 23м', 8, 'https://www.youtube.com/embed/5iw-hJ6xteE', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/263531.jpg', 'Английский', 'США', 220000000, 1519000000, 'Джосс Уидон', 'Marvel Studios', '3 номинации на «Оскар».', 1),
(132, 'Доктор Стрэндж', 'Страшная автокатастрофа поставила крест на карьере успешного нейрохирурга Доктора Стрэнджа. Отчаявшись, он отправляется в путешествие в поисках исцеления и открывает в себе невероятные способности к трансформации пространства и времени. Теперь он — связующее звено между параллельными измерениями, а его миссия — защищать жителей Земли и противодействовать злу, какое бы обличие оно ни принимало.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/409600.jpg', 2016, '1ч 55м', 7.5, 'https://www.youtube.com/embed/o3tqPNSGzfE', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/409600.jpg', 'Английский', 'США', 165000000, 677700000, 'Скотт Дерриксон', 'Marvel Studios', 'Номинация на «Оскар».', 5),
(133, 'Стражи Галактики', 'Отважному путешественнику Питеру Квиллу попадает в руки таинственный артефакт, принадлежащий могущественному и безжалостному злодею Ронану, строящему коварные планы по захвату Вселенной. Питер оказывается в центре межгалактической охоты, где жертва — он сам.\\n\\nЕдинственный способ спасти свою жизнь — объединиться с четверкой нелюдимых изгоев: воинственным енотом по кличке Ракета, человекоподобным деревом Грутом, смертельно опасной Гаморой и одержимым жаждой мести Драксом, также известным как Разрушитель. Когда Квилл понимает, какой силой обладает украденный артефакт и какую опасность он представляет для вселенной, одиночка пойдет на все, чтобы сплотить случайных союзников для решающей битвы за судьбу галактики.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/689066.jpg', 2014, '2ч 1м', 8, 'https://www.youtube.com/embed/p7VRUK7ctmU', '2025-05-22 13:43:21', 'https://kinopoiskapiunofficial.tech/images/posters/kp/689066.jpg', 'Английский', 'США', 170000000, 773300000, 'Джеймс Ганн', 'Marvel Studios', '2 номинации на «Оскар».', 5),
(134, 'Текст', 'Жизнь молодого человека меняется после выхода из тюрьмы, когда он получает доступ к чужому смартфону.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1234848.jpg', 2019, '2ч 11м', 7.3, 'https://www.youtube.com/embed/0wwoKbN0Yj8', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1234848.jpg', 'Русский', 'Россия', 1000000, 20000000, 'Клим Шипенко', 'НМГ Студия', 'Премия «Золотой орёл».', 4),
(135, 'Движение вверх', 'Есть победы, которые меняют ход истории. Победы духа, победы страны, победы всего мира. Таким триумфом стали легендарные «три секунды» - выигрыш сборной СССР по баскетболу на роковой мюнхенской Олимпиаде 1972 г. Впервые за 36 лет была повержена «непобедимая» команда США. Никто даже помыслить не мог о том, что это возможно – обыграть великолепных непогрешимых американцев на Олимпийских играх! Никто, кроме советских баскетболистов (русских и грузин, украинцев и казахов, белорусов и литовцев).\\n\\nКогда проигрыш означал поражение страны, когда нужно было выходить и бороться в раскаленной обстановке из-за произошедшего теракта, великий тренер сборной СССР был готов на все, лишь бы помочь своим подопечным разбить американский миф о непотопляемой команде мечты. Ведь он знал, что создал самую сильную сборную на планете, и в начале заставил поверить в это своих игроков, а затем весь мир.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/840817.jpg', 2017, '2ч 13м', 7.8, 'https://www.youtube.com/embed/w3pp2ek35HY', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/840817.jpg', 'Русский', 'Россия', 4500000, 54000000, 'Антон Мегердичев', 'СТВ', 'Кассовый рекорд российского кино.', 18);
INSERT INTO `movies` (`id`, `title`, `description`, `poster_url`, `year`, `duration`, `rating`, `trailer_url`, `created_at`, `cover_url`, `original_language`, `country`, `budget`, `revenue`, `director`, `producer`, `awards`, `genre_id`) VALUES
(136, 'Время первых', '1960-е, разгар холодной войны. Две супердержавы СССР и США бьются за первенство в космической гонке. Пока СССР впереди, на очереди — выход человека в открытый космос. За две недели до старта взрывается тестовый корабль. Времени на выявление причин нет. Опытный военный лётчик Павел Беляев и его напарник Алексей Леонов, необстрелянный и горячий, мечтающий о подвиге, — два человека, готовые шагнуть в неизвестность. Но никто не мог даже предположить всего, с чем им предстояло столкнуться в полёте. В этой миссии всё, что только могло, пошло не так.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/885316.jpg', 2017, '2ч 20м', 7.2, 'https://www.youtube.com/embed/mvsYJgqsuNc', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/885316.jpg', 'Русский', 'Россия', 9000000, 17000000, 'Дмитрий Киселёв', 'Базелевс', 'Премия «Ника».', 4),
(137, 'Балканский рубеж', 'Югославия. 1999 год. Российская спецгруппа получает приказ взять под контроль аэродром Слатина в Косово и удерживать его до прихода подкрепления. Но этот стратегический объект крайне важен албанскому полевому командиру и натовским генералам. Группа вынуждена принять неравный бой с террористами. К аэродрому устремляются российские миротворцы и силы НАТО. Мир вновь близок к большой войне.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1000443.jpg', 2019, '2ч 31м', 6.6, 'https://www.youtube.com/embed/EYQnmQaIp6Q', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1000443.jpg', 'Русский', 'Россия', 3000000, 9000000, 'Андрей Волгин', 'Кинокомпания 20/20', 'Патриотическое кино.', 1),
(138, 'Экипаж', 'Пилоты спасают пассажиров при катастрофе. Современный российский блокбастер.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/839818.jpg', 2016, '2ч 18м', 7, 'https://www.youtube.com/embed/5nlaow5dmk0', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/839818.jpg', 'Русский', 'Россия', 9000000, 24000000, 'Николай Лебедев', 'Централ Партнершип', 'Премия «Золотой орёл».', 2),
(139, 'Вратарь Галактики', '2071 год. Галактические войны разрушили Луну и изменили климат на Земле. Москва — в тропических лесах, а Нью-Йорк покрылся льдом. Над Москвой возвышается огромный инопланетный корабль-стадион, на котором проходят зрелищные межгалактические соревнования по космоболу — игре, объединившей в себе спорт и гладиаторские бои. За матчами следит вся галактика. Играть в космобол могут только атлеты — те, кто наделен необыкновенными способностями и может ими управлять. Космобол обожают все, кроме Антона, самого обычного парня, который всего лишь мечтает найти работу, чтобы вылечить больную маму. Но однажды у него обнаруживают сверхспособности и принимают в сборную. Теперь он игрок в космобол. Антон ещё не подозревает, какая роль уготована ему судьбой в этом матче, и что финальная игра станет сражением за Землю.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/841471.jpg', 2020, '1ч 56м', 5.1, 'https://www.youtube.com/embed/LSwZxtRaYNI', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/841471.jpg', 'Русский', 'Россия', 6500000, 11000000, 'Джаник Файзиев', 'СТВ', 'Российская фантастика.', 5),
(140, 'Дуэлянт', 'Петербург XIX века. Дуэлянты решают вопросы чести.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/840234.jpg', 2016, '1ч 50м', 6.5, 'https://www.youtube.com/embed/SdY1aNNj5Xc', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/840234.jpg', 'Русский', 'Россия', 9000000, 8000000, 'Алексей Мизгирёв', 'Hype Film', 'Премия «Ника» за лучшую работу художника.', 4),
(141, 'Притяжение', 'Как только что стало известно, сбитый над Москвой неопознанный объект имеет, возможно, внеземное происхождение. Большая часть столичного Чертаново оцеплена, к месту крушения стягиваются представители силовых структур, решается вопрос об эвакуации местных жителей. По словам нашего источника в Минобороны сейчас специальная комиссия пытается вступить в контакт с так называемыми гостями. В эти минуты мы готовим экстренный выпуск новостей, и о развитии событий вы узнаете первыми…', 'https://kinopoiskapiunofficial.tech/images/posters/kp/840250.jpg', 2017, '2ч 12м', 5.6, 'https://www.youtube.com/embed/frdsBT2tnOo', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/840250.jpg', 'Русский', 'Россия', 6000000, 18400000, 'Фёдор Бондарчук', 'Art Pictures Studio', 'Популярная российская фантастика.', 5),
(142, 'Легенда №17', 'История о хоккеисте Валерии Харламове и великой победе.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/601564.jpg', 2013, '2ч 14м', 7.5, 'https://www.youtube.com/embed/BRWyTgdWKZY', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/601564.jpg', 'Русский', 'Россия', 10000000, 29000000, 'Николай Лебедев', 'Третья Рим', 'Премия «Золотой орёл».', 18),
(143, 'Викинг', 'Сага о князе Владимире и крещении Руси.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/707407.jpg', 2016, '2ч 13м', 5, 'https://www.youtube.com/embed/ilBuJra6zZs', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/707407.jpg', 'Русский', 'Россия', 21000000, 34000000, 'Андрей Кравчук', 'Дирекция кино', 'Крупнобюджетный исторический фильм.', 20),
(144, 'Т-34', 'Экипаж советского танка совершает побег из немецкого лагеря.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/930878.jpg', 2018, '2ч 19м', 6.6, 'https://www.youtube.com/embed/FA6Xu_fgyzI', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/930878.jpg', 'Русский', 'Россия', 8000000, 35000000, 'Алексей Сидоров', 'Марс Медиа', 'Премия «Золотой орёл».', 16),
(145, 'Сталинград', '1942-й год. Сталинград. Советские войска планируют контрнаступление на немецкие части, занявшие правый берег Волги. Наступление сорвано. Лишь разведчикам под командованием капитана Громова удается перебраться на другой берег и закрепиться в одном из домов. Им дан приказ удержать его любой ценой. Кроме нескольких чудом уцелевших советских солдат они находят в доме его последнюю жительницу – 19-летнюю Катю.\\n\\nПриказ отбить дом, захваченный противником, получает немецкий офицер Кан. На фоне одного из самых кровопролитных сражений в истории человечества разворачиваются истории любви и драматического противостояния характеров.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/468196.jpg', 2013, '2ч 11м', 5.6, 'https://www.youtube.com/embed/rKgT1J6Obh4', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/468196.jpg', 'Русский', 'Россия', 30000000, 68000000, 'Фёдор Бондарчук', 'Art Pictures Studio', 'Российский военный блокбастер.', 16),
(146, 'Пара из будущего', '2040 год. Евгений и Александра уже 20 лет в браке, их отношения похожи на высохший урюк. Развестись у них тоже не получается, поскольку расторжение брака — очень дорогая процедура. Но судьба дает им шанс: Евгений и Александра попадают в прошлое, в тот самый день 20 лет назад, когда влюбленный Женя сделал предложение прелестной Саше. Теперь пара из будущего решает разлучить самих себя в молодости, но это будет непросто, так как молодые отстаивают свою любовь.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1405926.jpg', 2022, '1ч 40м', 6.5, 'https://www.youtube.com/embed/JsyQfERjjmY', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1405926.jpg', 'Русский', 'Россия', 2000000, 4000000, 'Алексей Нужный', 'Водород', 'Современная комедия.', 3),
(147, 'Майор Гром: Чумной Доктор', 'Майор полиции Игорь Гром известен всему Санкт-Петербургу пробивным характером и непримиримой позицией по отношению к преступникам всех мастей. Неимоверная сила, аналитический склад ума и неподкупность — всё это делает майора Грома идеальным полицейским. Но всё резко меняется с появлением человека в маске Чумного Доктора. Заявив, что его город «болен чумой беззакония», он принимается за «лечение», убивая людей, которые в своё время избежали наказания при помощи денег и влияния. Общество взбудоражено. Полиция бессильна. Игорь впервые сталкивается с трудностями в расследовании, от итогов которого может зависеть судьба всего города.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1109271.jpg', 2021, '2ч 16м', 6.2, 'https://www.youtube.com/embed/UBsGdt0qApU', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1109271.jpg', 'Русский', 'Россия', 4000000, 7000000, 'Олег Трофим', 'Bubble Studios', 'Популярный современный блокбастер.', 1),
(148, 'Каникулы строгого режима', 'Два заключённых скрываются от полиции в детском лагере.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/417840.jpg', 2009, '1ч 35м', 7, 'https://www.youtube.com/embed/RiSTPiDlBHw', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/417840.jpg', 'Русский', 'Россия', 1000000, 14000000, 'Игорь Зайцев', 'Централ Партнершип', 'Премия «Золотой орёл».', 13),
(150, 'Пальма', 'Реальная история о дружбе мальчика и собаки в советском аэропорту.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1142206.jpg', 2021, '1ч 50м', 7.3, 'https://www.youtube.com/embed/KvducCvZ-iY', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1142206.jpg', 'Русский', 'Россия', 1100000, 8000000, 'Александр Домогаров мл.', 'Киностудия Мосфильм', 'Приз зрительских симпатий.', 13),
(151, 'Чемпионы', 'Российская спортивная драма о великих олимпийских победах.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/763746.jpg', 2014, '2ч 20м', 7.1, 'https://www.youtube.com/embed/H5V_zcMYXnI', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/763746.jpg', 'Русский', 'Россия', 1800000, 4000000, 'Дмитрий Дюжев', 'ФГБУК Киноцентр', 'Премия «Золотой орёл».', 18),
(152, 'Громкая связь', 'Семеро друзей, собравшись в загородном доме, в шутку начинают игру — участники должны зачитывать вслух все приходящие им сообщения, а на звонки отвечать только по громкой связи. Они и представить себе не могли, какие удивительные открытия им предстоит сделать друг о друге.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1142619.jpg', 2019, '1ч 45м', 7, 'https://www.youtube.com/embed/Bu4eBZNT3ng', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/1142619.jpg', 'Русский', 'Россия', 1700000, 32000000, 'Алексей Нужный', 'Водород', 'Премия «Золотой орёл».', 4),
(153, 'Лёд', 'С самого детства Надя верила в чудеса. Она представляла себе, как выходит на лёд под овации публики и танцует свой самый красивый танец. И вот, благодаря вере и упорству, Надя становится знаменитой фигуристкой. Но когда ее мечты о громких победах, красивой жизни и прекрасном принце уже, кажется, готовы исполниться, судьба преподносит ей настоящее испытание.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/900052.jpg', 2018, '2ч 12м', 7.2, 'https://www.youtube.com/embed/kf3OpMtq8uo', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/900052.jpg', 'Русский', 'Россия', 2500000, 34000000, 'Олег Трофим', 'Водород', 'Кассовый успех российского проката.', 11),
(154, 'Последний богатырь', 'У Ивана, которому как раз исполнилось 50, две дочери: старшая, богатырка Марья, и младшая, начинающая колдунья Софья. Все в Белогорье идет своим чередом, но визит колдуна Северина, которому привиделось страшное бедствие, вносит смуту в размеренную жизнь волшебников. Чтобы спасти и Белогорье, и жизнь собственного отца, Софье придется отправиться в Москву прошлого, где все еще живет молодой и ни о чем не подозревающий Иван, а Марье — сразиться со злом в самом городе.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/5319850.jpg', 2017, '1ч 54м', 6.6, 'https://www.youtube.com/embed/35vjXxYkgcw', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/5319850.jpg', 'Русский', 'Россия', 8000000, 35000000, 'Дмитрий Дьяченко', 'Disney Россия', 'Лидер российского проката.', 8),
(155, 'Союз спасения', 'Императорские войска России заняли Париж. Россия стала первой державой мира. Теперь всё кажется возможным. Молодые победители, гвардейские офицеры, уверены, что равенство и свобода наступят - здесь и сейчас. Ради этого они готовы принести в жертву всё — положение, богатство, любовь, жизнь… и саму страну.\"', 'https://kinopoiskapiunofficial.tech/images/posters/kp/972740.jpg', 2019, '2ч 16м', 6.4, 'https://www.youtube.com/embed/fN4jYFSy8dQ', '2025-05-22 13:46:33', 'https://kinopoiskapiunofficial.tech/images/posters/kp/972740.jpg', 'Русский', 'Россия', 9000000, 17000000, 'Андрей Кравчук', 'Rock Films', 'Премия «Золотой орёл».', 20),
(157, 'Брат', 'Данила возвращается из армии и сталкивается с преступным миром Петербурга. Знаковый российский боевик 90-х.', 'https://kinopoiskapiunofficial.tech/images/posters/kp/41519.jpg', 1997, '1ч 40м', 8.3, 'https://www.youtube.com/embed/Zq55yxODJiA', '2025-05-22 13:17:38', 'https://kinopoiskapiunofficial.tech/images/posters/kp_small/41519.jpg', 'Русский', 'Россия', 200000, 1200000, 'Алексей Балабанов', 'СТВ', 'Гран-при фестиваля «Кинотавр»', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `movie_id`, `rating`, `comment`, `created_at`) VALUES
(1, 1, 2, 9, 'Очень вдохновляющий спортивный фильм. После просмотра хочется двигаться вперёд!', '2025-05-03 09:30:15'),
(2, 1, 3, 8, 'Семейный сериал с доброй атмосферой. Рекомендую смотреть всей семьёй.', '2025-05-03 15:22:41'),
(3, 1, 4, 10, 'Драма про сильных людей и трудные решения. Захватывает с первых минут.', '2025-05-04 10:11:09'),
(4, 1, 5, 8, 'Комедия на любителя, но несколько раз смеялся от души.', '2025-05-05 14:14:20'),
(5, 2, 2, 9, 'Сюжет спортивной драмы держит в напряжении до конца. Отличная постановка.', '2025-05-07 07:15:12'),
(6, 2, 3, 7, 'Симпатичный семейный сериал. Дети в восторге!', '2025-05-09 08:19:35'),
(7, 2, 4, 9, 'Хорошо показаны эмоции героев. Драма для тех, кто любит сильные истории.', '2025-05-10 10:44:27'),
(8, 2, 5, 8, 'Лёгкий юмор и необычный сюжет. Советую для отдыха.', '2025-05-11 16:24:55'),
(9, 3, 2, 10, 'Спорт, эмоции, мотивация — всё, что нужно для хорошего фильма.', '2025-05-12 06:45:17'),
(10, 3, 3, 8, 'Добрая комедия, возвращает в детство.', '2025-05-13 09:30:14'),
(11, 3, 4, 9, 'Драма захватывает, отличная актёрская игра.', '2025-05-13 17:15:48'),
(12, 3, 5, 8, 'Нестандартный юмор и жизненные ситуации.', '2025-05-15 10:40:33'),
(13, 4, 2, 8, 'Фильм мотивирует не сдаваться. Очень понравилось!', '2025-05-05 14:13:30'),
(14, 4, 3, 7, 'Весёлая история для всей семьи.', '2025-05-06 13:10:05'),
(15, 4, 4, 9, 'Сильная драма, после просмотра остаётся о чём подумать.', '2025-05-09 09:25:09'),
(16, 4, 5, 9, 'Смешные сцены, приятные герои.', '2025-05-10 15:14:44'),
(17, 5, 2, 8, 'Динамичный сюжет, интересно смотреть за соревнованиями.', '2025-05-12 11:03:15'),
(18, 5, 3, 7, 'Дети оценили, хороший позитивный сериал.', '2025-05-13 08:50:41'),
(19, 5, 4, 10, 'Душевная драма, очень тронула.', '2025-05-14 11:32:25'),
(20, 5, 5, 8, 'Комедия для всей семьи, лёгкая и весёлая.', '2025-05-16 07:09:13'),
(21, 6, 2, 9, 'Прекрасная спортивная история о борьбе за мечту.', '2025-05-09 09:11:20'),
(22, 6, 3, 8, 'Смешные моменты, позитивная атмосфера.', '2025-05-11 07:35:26'),
(23, 6, 4, 9, 'Драма раскрывает характеры героев. Рекомендую!', '2025-05-13 14:29:54'),
(24, 6, 5, 8, 'Юмор на уровне, настроение после просмотра отличное.', '2025-05-14 15:41:21'),
(25, 7, 2, 8, 'Фильм показывает настоящую силу характера.', '2025-05-15 06:16:13'),
(26, 7, 3, 8, 'Сериал семейный, иногда смешно до слёз.', '2025-05-16 09:22:44'),
(27, 7, 4, 9, 'Драма со смыслом, хочется пересмотреть.', '2025-05-17 10:31:39'),
(28, 7, 5, 7, 'Хорошая комедия, поднимает настроение.', '2025-05-18 07:22:31'),
(29, 8, 2, 9, 'Спорт и эмоции, отличное кино!', '2025-05-20 14:13:19'),
(30, 8, 3, 8, 'Семейный сериал, есть чему поучиться.', '2025-05-21 16:50:20'),
(31, 8, 4, 8, 'Драматичный сюжет и сильные переживания.', '2025-05-23 06:31:10'),
(32, 8, 5, 8, 'Смешная история, прекрасно провели вечер.', '2025-05-24 14:12:15'),
(33, 9, 2, 10, 'Очень понравилось! Спорт в лучшем виде.', '2025-05-25 06:41:11'),
(34, 9, 3, 8, 'Забавные персонажи, отличный настрой.', '2025-05-25 15:23:55'),
(35, 9, 4, 9, 'Драма тронула за душу.', '2025-05-27 10:41:42'),
(36, 9, 5, 7, 'Юмор легкий, вечер прошёл хорошо.', '2025-05-28 16:41:25'),
(37, 10, 2, 9, 'Спортивная драма, которую хочется пересматривать.', '2025-05-27 09:33:10'),
(38, 10, 3, 8, 'Очень весёлый сериал, семья в восторге.', '2025-05-29 08:12:39'),
(39, 10, 4, 10, 'Сильная драма, всё очень жизненно.', '2025-05-29 13:45:23'),
(40, 10, 5, 9, 'Добрая комедия, поднимает настроение.', '2025-05-30 07:14:30'),
(41, 11, 6, 9, 'Очень забавная комедия про столичных жителей, необычный юмор.', '2025-05-07 11:12:09'),
(42, 11, 7, 8, 'Весёлый мультфильм с интересными приключениями!', '2025-05-08 07:29:21'),
(43, 11, 8, 9, 'Интересный детектив, сюжет неожиданно закручивается.', '2025-05-09 09:14:14'),
(44, 12, 6, 8, 'Люблю московские комедии — герои и шутки жизненные.', '2025-05-10 08:13:19'),
(45, 12, 7, 8, 'Мультфильм с добрым юмором, отлично для детей.', '2025-05-12 10:18:12'),
(46, 12, 8, 7, 'Детектив держит в напряжении, хорошая концовка.', '2025-05-13 06:44:41'),
(47, 13, 6, 7, 'Смешно и актуально, Патриаршие узнаваемы.', '2025-05-13 12:23:18'),
(48, 13, 7, 8, 'Отличный мультик, понравились герои.', '2025-05-15 16:02:50'),
(49, 13, 8, 8, 'Детективная линия интересная, неожиданные повороты.', '2025-05-16 07:32:39'),
(50, 14, 6, 9, 'Очень весёлая и немного ироничная комедия.', '2025-05-17 15:14:14'),
(51, 14, 7, 9, 'Яркий мульт, сюжет захватывает с первых минут.', '2025-05-18 11:41:23'),
(52, 14, 8, 8, 'Детективная драма понравилась, хорошо снято.', '2025-05-19 08:17:50'),
(53, 15, 6, 8, 'Комедия с оригинальными сюжетами. Смотрели с друзьями.', '2025-05-20 10:40:15'),
(54, 15, 7, 7, 'Приключения богатырей всегда интересны детям.', '2025-05-21 06:11:27'),
(55, 15, 8, 9, 'Захватывающий сериал с неожиданным финалом.', '2025-05-22 11:18:42'),
(56, 16, 6, 8, 'Много жизненных ситуаций и отличный юмор.', '2025-05-24 08:15:08'),
(57, 16, 7, 8, 'Мультфильм понравился всей семье.', '2025-05-25 09:23:41'),
(58, 16, 8, 8, 'Непредсказуемый сюжет, интересные герои.', '2025-05-26 14:08:30'),
(59, 17, 6, 9, 'Смешные истории москвичей, смотрели с удовольствием.', '2025-05-13 15:15:14'),
(60, 17, 7, 8, 'Любим мультфильмы, этот особенно веселый.', '2025-05-16 07:30:32'),
(61, 17, 8, 9, 'Детектив получился динамичным и необычным.', '2025-05-19 08:24:15'),
(62, 18, 6, 7, 'Интересная комедия, хорошие шутки.', '2025-05-20 13:03:21'),
(63, 18, 7, 8, 'Весёлые приключения богатырей, понравилось детям.', '2025-05-21 12:18:42'),
(64, 18, 8, 7, 'Сюжет захватывающий, герои живые.', '2025-05-22 15:13:55'),
(65, 19, 9, 8, 'Детектив с неожиданными поворотами. Сюжет держит.', '2025-05-24 07:12:12'),
(66, 19, 10, 9, 'Драма о сильном человеке, отличный актёрский состав.', '2025-05-24 08:14:13'),
(67, 19, 52, 10, 'Боевик, который стал классикой. Люблю этот фильм.', '2025-05-24 09:16:14'),
(68, 19, 53, 9, 'Глубокая драма, заставляет задуматься.', '2025-05-24 10:18:15'),
(69, 19, 54, 9, 'Жизненная история, понравилась атмосфера фильма.', '2025-05-24 11:20:16'),
(70, 19, 55, 8, 'Новогодняя комедия — настроение сразу праздничное.', '2025-05-24 12:22:17'),
(71, 20, 9, 8, 'Интересный сериал, отлично раскрыты характеры героев.', '2025-05-26 07:17:22'),
(72, 20, 10, 9, 'Драма с хорошей динамикой событий.', '2025-05-26 09:15:42'),
(73, 20, 52, 10, 'Классика российского кино. Боевик с характером.', '2025-05-26 11:17:29'),
(74, 20, 53, 8, 'Очень трогательный и сильный фильм.', '2025-05-26 13:19:09'),
(75, 20, 54, 9, 'История о поиске счастья в большом городе.', '2025-05-26 15:12:39'),
(76, 20, 55, 8, 'Комедия на все времена. Всегда поднимает настроение.', '2025-05-26 17:10:51'),
(77, 21, 9, 9, 'Детектив отличный, динамика на высоте.', '2025-05-27 07:18:22'),
(78, 21, 10, 8, 'Драма про подростков, актуальная и интересная.', '2025-05-27 09:16:42'),
(79, 21, 52, 9, 'Боевик — классика жанра, советую всем любителям.', '2025-05-27 11:15:29'),
(80, 21, 53, 9, 'Фильм вызывает много эмоций и переживаний.', '2025-05-27 13:19:09'),
(81, 21, 54, 8, 'Хороший фильм о настоящей любви и жизни.', '2025-05-27 15:14:39'),
(82, 21, 55, 9, 'Всегда весело пересматривать эту комедию.', '2025-05-27 17:12:41'),
(83, 22, 9, 8, 'Интересно, как раскрыты расследования. Захватывает.', '2025-05-28 07:21:22'),
(84, 22, 10, 9, 'Сильная военная драма. Понравилось исполнение.', '2025-05-28 09:18:47'),
(85, 22, 52, 10, 'Фильм, который хочется пересматривать снова и снова.', '2025-05-28 11:14:51'),
(86, 22, 53, 9, 'Драма очень сильная, берёт за душу.', '2025-05-28 13:17:16'),
(87, 22, 54, 9, 'Жизненные истории, отличная постановка.', '2025-05-28 15:19:32'),
(88, 22, 55, 8, 'Настроение после просмотра сразу новогоднее.', '2025-05-28 17:16:44'),
(89, 23, 9, 9, 'Детектив очень интересный, советую любителям жанра.', '2025-05-29 07:20:30'),
(90, 23, 10, 8, 'Сильная история, заставляет задуматься.', '2025-05-29 09:18:45'),
(91, 23, 52, 10, 'Боевик получился захватывающим.', '2025-05-29 11:13:09'),
(92, 23, 53, 8, 'Драма, которая не оставляет равнодушным.', '2025-05-29 13:18:56'),
(93, 23, 54, 9, 'Хороший фильм, реальная жизнь показана отлично.', '2025-05-29 15:14:28'),
(94, 23, 55, 9, 'Классика отечественной комедии.', '2025-05-29 17:16:30'),
(95, 24, 9, 8, 'Детектив с интригой, интересно следить за расследованием.', '2025-05-30 07:23:10'),
(96, 24, 10, 9, 'Вдохновляющая драма, отличная актёрская игра.', '2025-05-30 09:16:49'),
(97, 24, 52, 9, 'Люблю отечественные боевики — этот один из лучших.', '2025-05-30 11:17:31'),
(98, 24, 53, 8, 'Очень трогательная история, смотришь на одном дыхании.', '2025-05-30 08:19:39'),
(99, 24, 54, 9, 'Глубокая драма с сильной эмоциональной составляющей.', '2025-05-30 13:19:21'),
(100, 24, 55, 8, 'Лёгкая комедия, заряжает позитивом.', '2025-05-30 15:22:10');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `surname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_admin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `surname`, `name`, `email`, `password_hash`, `created_at`, `is_admin`) VALUES
(1, 'Иванов', 'Иван', 'ivanov1@mail.ru', '$2y$10$.N6qafqgwK6K7jC9z2UIYOtHzfoMmmYmDcA5AUkkS3AvuG14oYDFK', '2025-05-02 06:12:13', 0),
(2, 'Петрова', 'Анна', 'petrova2@mail.ru', '$2y$10$kIu6b2lh1b6JP/4Alz64QOucQ6G3zILVTh8APCMoDYp0xEtqRPzhO', '2025-05-05 08:34:21', 0),
(3, 'Сидоров', 'Павел', 'sidorov3@mail.ru', '$2y$10$d8iCQB7xR7HuOEyuE0PH3uxQKBywH/FkItMlwRvA8G2PO8xCeWn2S', '2025-05-03 05:25:45', 0),
(4, 'Алексеева', 'Мария', 'alekseeva4@mail.ru', '$2y$10$V/7nSvD2oK9O4gkB8K6k9OrqwPuUf3WwF8pLvnBbh6MZ/dAKrjgnG', '2025-05-11 12:04:29', 0),
(5, 'Кузнецов', 'Михаил', 'kuznetsov5@mail.ru', '$2y$10$TtcB7VCKpEUGLqbmsoEd0u2FAJIm72gNxgQ9jkeI88At7uEZyk1FG', '2025-05-14 14:44:15', 0),
(6, 'Васильева', 'Ольга', 'vasilieva6@mail.ru', '$2y$10$Ry9PtZtBMSwRbZJvQ2jlbebIYGtoYe5d1UnfQAtw9/0W5n4QPVae.', '2025-05-07 13:01:57', 0),
(7, 'Попов', 'Артем', 'popov7@mail.ru', '$2y$10$1DNAvE4ExQdtbJ4uR/CL9u6L9vD0ll/.77PtXZ1u5QxYpiZbKq/dS', '2025-05-09 07:17:10', 0),
(8, 'Егорова', 'Дарья', 'egorova8@mail.ru', '$2y$10$NBpu2k1u2hJU3s7vjE4MMeN1lzNEnI8Gh2Cu1wqNN4ALR0jzFtVtq', '2025-05-18 11:32:18', 0),
(9, 'Смирнов', 'Максим', 'smirnov9@mail.ru', '$2y$10$ReGZ9dtPOhYpgE3Gb9W7UuHZ0xv.XWCoaeph5lXzph4D4tgm65/Py', '2025-05-19 10:49:01', 0),
(10, 'Морозова', 'Екатерина', 'morozova10@mail.ru', '$2y$10$0F62dSVmK4lU.QQ0V/UJ5uXL6ZrKyJUZkqIgRGeJHZKX4nN1C3I7.', '2025-05-20 06:29:42', 0),
(11, 'Волков', 'Сергей', 'volkov11@mail.ru', '$2y$10$.KjNm3XqlzV7y6awfPlJKuyTi0GLzX.JrP0txSHLwSt7M6L/bt3rC', '2025-05-06 09:32:59', 0),
(12, 'Федорова', 'Ирина', 'fedorova12@mail.ru', '$2y$10$DoXGqP/JF/Fx8aYOC2Av1eq7AKCUpXwSRZjqUVS6ewI00nS4vDK6e', '2025-05-08 10:55:07', 0),
(13, 'Денисов', 'Андрей', 'denisov13@mail.ru', '$2y$10$gwIcnvt7ysRqqwhXRYRG2eMvkwfiWkNfdUf8pVpbnmuRAOOVLzP9u', '2025-05-15 12:38:02', 0),
(14, 'Громова', 'Светлана', 'gromova14@mail.ru', '$2y$10$VbExJdJtT9zkMMYeVmBf0e.CzGqOHB3WJ1Xyp0ytstjqy3EQbOoM.', '2025-05-13 11:21:49', 0),
(15, 'Николаев', 'Дмитрий', 'nikolaev15@mail.ru', '$2y$10$4lA1oDr0yKzPIjhk8UehguEFwpD5O/cHRr7zYXuUWeZNTBXYEHzEm', '2025-05-21 15:41:30', 0),
(16, 'Тихонова', 'Мария', 'tikhonova16@mail.ru', '$2y$10$dmuMFLWqlhqFkif0JzC7eeQmcdlP/wS9GdJJ7uMJ0mOew6eI3Mvcy', '2025-05-23 06:53:27', 0),
(17, 'Гаврилов', 'Антон', 'gavrilov17@mail.ru', '$2y$10$PtXO3PSTrwlGlK6b04ZZIewIugS0J38dkQfOfW47kmDRI48fl3bw2', '2025-05-12 16:11:23', 0),
(18, 'Борисова', 'Валентина', 'borisova18@mail.ru', '$2y$10$62Gyw2yei5RUZZ7PY7riL.3.6N4ZMuZ6w.9ZLhOUpGHjYHLVFcCv2', '2025-05-28 12:08:45', 0),
(19, 'Кириллов', 'Роман', 'kirillov19@mail.ru', '$2y$10$JG2FTIYw7J2oqJQ8RV0U1u7X27wZCkrXtcFyt3tOnms00wq8tvIii', '2025-05-26 07:54:12', 0),
(20, 'Голубева', 'Елена', 'golubeva20@mail.ru', '$2y$10$Fz1SmD4FJZp7t/ZJ9ioh4OJYjEjts6beXRLQZTFwMldq5rO/gF3ai', '2025-05-29 09:10:23', 0),
(21, 'Ефимов', 'Артем', 'efimov21@mail.ru', '$2y$10$PI2lPiCr1HRK2J5d4WwduOZjH3lJIFUT8yk/oNJbNLPHRJqqr1jUS', '2025-05-12 13:24:17', 0),
(22, 'Киселёва', 'Анастасия', 'kiseleva22@mail.ru', '$2y$10$h4iGCdCQ9nq8r3nrfJ6KYe0K9phAZAxH8ZvXZH5K/6SG7IL9nTnL2', '2025-05-14 12:38:52', 0),
(23, 'Климов', 'Евгений', 'klimov23@mail.ru', '$2y$10$1Zt1ym6x7QZGHgSakFhILe8sTI0n8s2Y2DEh4bQIoemRXVckSpjlG', '2025-05-17 10:12:33', 0),
(24, 'Королёва', 'Наталья', 'koroleva24@mail.ru', '$2y$10$D8Pyh7/w9OSKqGy42bD1bOjU6u3ZY.3rtjBUy9/MghKlhzdfd2sHG', '2025-05-18 11:58:12', 0),
(25, 'Давыдов', 'Алексей', 'davyadov25@mail.ru', '$2y$10$05tR9h4v8Ti6z5r.YSiWlu8aR1s6rPxJk7NRxFS7BoM0wvJgGEevW', '2025-05-16 08:10:11', 0),
(26, 'Чернов', 'Игорь', 'chernov26@mail.ru', '$2y$10$4s0ve6NNtKAZv1iOjFbOmO3oTzrhXYrpwobTQGMkrh1D5nNnHyMxi', '2025-05-19 06:42:51', 0),
(27, 'Макарова', 'Виктория', 'makarova27@mail.ru', '$2y$10$KhKFS2lB6QSDvSUmAjE2HeuVZdlb5uDnS1okZwE5sswwLK8R4RvE6', '2025-05-23 14:45:04', 0),
(28, 'Захаров', 'Юрий', 'zakharov28@mail.ru', '$2y$10$n8Uyb8Go12ZgV5VxNqfdj.k4ja8K4y2.Ktl9dJ.5y3Nn8PaFhKh6C', '2025-05-24 16:19:35', 0),
(29, 'Яковлева', 'Светлана', 'yakovleva29@mail.ru', '$2y$10$y/Se5W5Fi9T1BGaC7GRs9ehkQjZWyb2F0byPY6sQDErc/vPo.zHSu', '2025-05-25 11:18:53', 0),
(30, 'Орлов', 'Николай', 'orlov30@mail.ru', '$2y$10$dFhx9kHPTAlDUk7WnI6BXO/efjbtzRW4D7dTVt9B3Zcrf9eK37FQG', '2025-05-31 07:22:40', 0),
(31, 'админ', 'админ', 'admin@frowdi.local', '$2y$10$rQK8nsXF0FgHAS7gRKvhZOU38h7YVaxTn05MwLkgp0B3WOa6mhdBi', '2025-06-09 18:12:12', 1),
(32, 'Фролов', 'Дмитрий', 'dimon.frolov.00@list.ru', '$2y$10$hTvalrsIUfVU6wxYuC2M8es1llHX509IrNJXaXAHwJWolWGQk63Ea', '2025-06-11 04:01:35', 0),
(33, 'Фролов', 'Дмитрий', 'dimoon.frolov.00@list.ru', '$2y$10$v79FxWkjTBVyfWywmtJFCuEtJOTmkjhaqhZRJiYcEe4osbLjI7ADi', '2025-06-11 04:08:25', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_genre` (`genre_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `fk_genre` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
