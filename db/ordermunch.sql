SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Order Munch`
--
-- --------------------------------------------------------
--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(5) NOT NULL,
  `food_id` int(55) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(5) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pref` tinyint(1) NOT NULL,
  `phone_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--
INSERT INTO `customers` (`id`, `name`, `email`, `password`, `pref`, `phone_no`) VALUES
(1, 'a', 'a@a', 'b09a418e0be8e9bde0d091738c655d066b5b7e30441672d79251708c58e577bc', 0, '1234567890'),
(2, 'b', 'b@b', 'bdb6286b5bf42fd244242bc68adb189bbce9e7628e8ef1fc3f210fd744066926', 0, '0123456789'),
(3, 'c', 'c@c', '0e634c8845d25fe60b7b2b564ec5036ef524d397206e84265a30d20897cd1b6a', 0, '9999999999'),
(4, 'd', 'd@d', '82b9af81aebaed62bc06db1e9bc08baa661502d5481536097969050d2ba7f01d', 1, '9999999999'),
(5, 'abcd', 'abcd@abcd', 'a5e18d5420ee6f9020ffadfd4a5d59a5e766034f098798dcce558e955066e5e9', 1, '8888888888');
--
-- --------------------------------------------------------
--
-- Table structure for table `food`
--
CREATE TABLE `food` (
  `id` int(5) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(5) NOT NULL,
  `res_id` int(5) NOT NULL,
  `pref` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `food`
--


INSERT INTO `food` (`id`, `name`, `price`, `res_id`, `pref`, `image`) VALUES
(1, 'Bianca Pizza', 12, 1, 1, 'images/bianca_pizza.jpg'),
(2, 'Seafood Pizza', 13, 1, 1, 'images/seafood_pizza.jpg'),
(3, 'Italiano Pizza', 9, 1, 1, 'images/italiano_pizza.jpg'),
(4, 'Cheese Pizza', 10, 2, 0, 'images/cheese_pizza.jpg'),
(5, 'Taco Pizza', 8.5, 1, 1, 'images/taco_pizza.jpg'),
(6, 'Pizza, Margherita', 8.25, 3, 0, 'images/pizza_margherita.jpg'),
(7, 'Pizza, Mushroom', 16, 3, 1, 'images/pizza_mushroom.jpg'),
(8, 'Pizza, Puttenesca', 12, 3, 1, 'images/pizza_puttenesca.jpg'),
(9, 'Pizza, Salami Piccante', 9.5, 4, 1, 'images/pizza_salami_piccante.jpg'),
(10, 'Pizza, White Truffle Meat Sauce', 8.9, 4, 0, 'images/white_truffle_meat_sauce.jpg'),
(11, 'Thai Chicken Pizza', 13, 4, 0, 'images/thai_chicken_pizza.jpg'),
(14, 'Vegetarian Pizza', 15, 1, 0, 'images/vegetarian_pizza.JPG'),
(15, 'Pizza Steak', 10, 1, 0, 'images/pizza_steak.jpg'),
(16, 'BBQ Chicken Pizza', 15, 2, 1, 'images/bbq_chicken_pizza.jpg'),
(17, 'Hawaiian Pizza', 14, 2, 0, 'images/hawaiian_pizza.jpg'),
(18, 'Buffalo Chicken Pizza', 16, 2, 1, 'images/buffalo_chicken_pizza.jpg'),
(19, 'Veggie Lover Pizza', 12, 1, 0, 'images/veggie_pizza.jpg'),
(20, 'Meat Lover Pizza', 18, 1, 1, 'images/meat_lovers_pizza.jpg'),
(21, 'Pepperoni Pizza', 11, 3, 0, 'images/pepperoni_pizza.jpg'),
(22, 'Four Cheese Pizza', 12.5, 3, 1, 'images/four_cheese_pizza.jpg'),
(23, 'Neapolitan Pizza', 17, 3, 1, 'images/neapolitan_pizza.jpg'),
(24, 'Greek Pizza', 14, 4, 1, 'images/greek_pizza.jpg'),
(25, 'Sicilian Pizza', 16, 4, 0, 'images/sicilian_pizza.jpg'),
(26, 'Detroit Style Pizza', 15.5, 4, 1, 'images/detroit_pizza.jpg'),
(27, 'Gluten-Free Pizza', 13, 1, 0, 'images/gluten_free_pizza.jpg'),
(28, 'Vegan Pizza', 14.5, 1, 1, 'images/vegan_pizza.jpg'),
(29, 'Stuffed Crust Pizza', 18, 2, 0, 'images/stuffed_crust_pizza.jpg'),
(30, 'Spicy Thai Pizza', 12, 2, 1, 'images/spicy_thai_pizza.jpg'),
(31, 'Kebab Pizza', 15, 3, 0, 'images/kebab_pizza.jpg'),
(32, 'Chicken Tikka Pizza', 17, 3, 1, 'images/chicken_tikka_pizza.jpg'),
(33, 'Pesto Pizza', 16, 4, 0, 'images/pesto_pizza.jpg'),
(34, 'Calzone Pizza', 11, 4, 1, 'images/calzone_pizza.jpg'),
(35, 'Capricciosa Pizza', 15, 1, 0, 'images/capricciosa_pizza.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(5) NOT NULL,
  `food_id` int(5) NOT NULL,
  `quantity` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `food_id`, `quantity`, `user_id`, `time`) VALUES
(2, 10, 1, 1, '2023-03-25 20:57:51'),
(3, 4, 1, 1, '2023-03-25 20:57:51'),
(4, 7, 3, 2, '2023-03-25 20:59:01'),
(5, 11, 2, 2, '2023-03-25 20:59:01'),
(6, 4, 1, 2, '2023-03-25 20:59:01'),
(8, 6, 3, 3, '2023-03-25 21:00:12'),
(10, 9, 1, 3, '2023-03-25 21:00:12'),
(11, 1, 2, 4, '2023-03-25 21:01:19'),
(12, 9, 3, 4, '2023-03-25 21:01:19'),
(13, 8, 1, 4, '2023-03-25 21:01:20'),
(14, 7, 2, 4, '2023-03-25 21:01:20'),
(15, 6, 2, 4, '2023-03-25 21:01:20'),
(17, 4, 1, 4, '2023-03-25 21:01:20'),
(19, 10, 1, 4, '2023-03-25 21:01:20'),
(20, 11, 2, 4, '2023-03-25 21:01:20'),
(21, 9, 3, 1, '2023-03-25 21:09:43'),
(22, 4, 10, 3, '2023-03-25 22:00:54'),
(23, 10, 1, 3, '2023-03-25 22:00:54'),
(24, 1, 2, 3, '2023-03-25 22:02:00'),
(25, 6, 2, 3, '2023-03-25 22:31:00'),
(26, 6, 2, 1, '2023-03-27 01:15:04'),
(27, 14, 6, 1, '2023-03-27 01:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `restaurnts`
--

CREATE TABLE `restaurants` (
  `id` int(5) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurnts`
--

INSERT INTO `restaurants` (`id`, `name`, `email`, `password`, `location`) VALUES
(1, 'a', 'a@a', 'b09a418e0be8e9bde0d091738c655d066b5b7e30441672d79251708c58e577bc', 'a'),
(2, 'b', 'b@b', 'bdb6286b5bf42fd244242bc68adb189bbce9e7628e8ef1fc3f210fd744066926', 'b'),
(3, 'c', 'c@c', '0e634c8845d25fe60b7b2b564ec5036ef524d397206e84265a30d20897cd1b6a', 'c'),
(4, 'd', 'd@d', '82b9af81aebaed62bc06db1e9bc08baa661502d5481536097969050d2ba7f01d', 'd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_id` (`res_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
