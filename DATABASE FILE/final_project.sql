-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 19, 2024 at 06:06 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(11) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(1, 'admin', '99c02c7201dfcf7e7d2059009b26837b', 'admin@gmail.com', '', '2024-04-18 01:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `LOCATIONS`
--

CREATE TABLE `LOCATIONS` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `postalCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LOCATIONS`
--

INSERT INTO `LOCATIONS` (`id`, `restaurant_id`, `address`, `city`, `latitude`, `longitude`, `postalCode`) VALUES
(1, 1, 'Cascade Village Mall Across From Target', 'Bend', 44.10266476, -121.3007971, 97701),
(2, 2, '148 S Barrington Ave', 'Los Angeles', 34.06456347, -118.4690173, 90049),
(3, 3, '5142 Hollywood Blvd', 'Los Angeles', 34.1017424, -118.3019729, 90027),
(4, 4, '801 Saint Emanuel St', 'Houston', 29.75247947, -95.35416442, 77003),
(5, 5, '478 South St', 'Hyannis', 41.64827787, -70.29134463, 2601),
(6, 6, '1 N University Hl', 'Provo', 40.25083927, -111.6492677, 84602),
(7, 7, '200 E Chestnut St', 'Chicago', 41.89854289, -87.6219955, 60611),
(8, 8, '145 E Gay St', 'West Chester', 39.96193, -75.60276, 19380),
(9, 9, '26900 Newport Rd', 'Menifee', 33.68678191, -117.1903038, 92584),
(10, 10, '2111 Stewart Ave', 'Wausau', 44.95747331, -89.66768203, 54401),
(11, 11, '1707 Delaware Ave', 'Wilmington', 39.7583638, -75.5626631, 19806),
(12, 12, '116 Ann St', 'Pickens', 34.883816, -82.7078, 29671),
(13, 13, '2619 Red Bluff Kroger Jct', 'Pasadena', 29.716011, -95.200573, 77506),
(14, 14, '11165 S Eastern Ave', 'Henderson', 35.98879, -115.101074, 89052),
(15, 15, '21100 91st Pl S', 'Kent', 47.413195, -122.218841, 98031),
(16, 16, '264 Lakeside Ave', 'Laconia', 43.607478, -71.459311, 3246),
(17, 17, '1431 Plaza Pl', 'Southlake', 32.945053, -97.12952, 76092),
(18, 18, '3505 A Longmire Dr', 'College Station', 30.582817, -96.28639, 77845),
(19, 19, '711 N 132nd St', 'Omaha', 41.266346, -96.119545, 68154),
(20, 20, '190 N Swift Rd', 'Addison', 41.9317, -88.0421, 60101),
(21, 21, '11651 W 64th Ave', 'Arvada', 39.812937, -105.129404, 80004),
(22, 22, '22 Englar Rd', 'Westminster', 39.58133698, -76.98956, 21157),
(23, 23, '50a', 'Hermosa Beach', 33.862, -118.400769, 90254),
(24, 24, '19 Kelly St', 'Luzerne', 41.285007, -75.898346, 18709),
(25, 25, '111 Lawrence Rd', 'Lawrence Township', 40.24614006, -74.74381959, 8648),
(26, 26, '44 N Brentwood', 'Saint Louis', 38.649703, -90.341542, 63105),
(27, 27, '2901 Watson Blvd', 'Endicott', 42.11067, -76.02803, 13760),
(28, 28, '100 Charlton Rd', 'Sturbridge', 42.12484282, -72.05860695, 1566),
(29, 29, '401 E Whitestone Blvd', 'Cedar Park', 30.52266137, -97.82690265, 78613),
(30, 30, '2631 Mcingvale Rd', 'Hernando', 34.822393, -89.973027, 38632),
(31, 31, '1876 Black Rock Tpke', 'Fairfield', 41.18031, -73.247734, 6825),
(32, 32, '1310 N W 23rd Ave', 'Gainesville', 29.673973, -82.33917, 32605),
(33, 33, '901 Loveland Madeira Rd', 'Loveland', 39.26125063, -84.2709923, 45140),
(34, 34, '14004 E Indiana Ave', 'Spokane', 47.675464, -117.225497, 99216),
(35, 35, '555 Soquel Ave', 'Santa Cruz', 36.97572, -122.01743, 95062),
(36, 36, '11981 S Strang Line Rd', 'Olathe', 38.90896786, -94.76871014, 66062),
(37, 37, '378 Broad St', 'Bloomfield', 40.806263, -74.192924, 7003),
(38, 38, '28985 Golden Lantern', 'Laguna Niguel', 33.54206, -117.69095, 92677),
(39, 39, '4138 Ogletown Stanton Rd', 'Newark', 39.68517, -75.68316, 19713),
(40, 40, '6007 Us 60 E', 'Barboursville', 38.413007, -82.307758, 25504),
(41, 41, '1602 E Forsyth St', 'Americus', 32.071243, -84.208984, 31709),
(42, 42, '148 W River St', 'Providence', 41.84392, -71.413666, 2904),
(43, 43, '14 Scott Adam Rd', 'Cockeysville', 39.47173, -76.63863, 21030),
(44, 44, '4940 E Ray Rd', 'Phoenix', 33.31993, -111.97697, 85044),
(45, 45, '14805 W 64th Ave', 'Arvada', 39.812653, -105.166004, 80007),
(46, 46, '400 S Orlando Ave', 'Maitland', 28.62476934, -81.36355922, 32751),
(47, 47, '1 Corporate Dr', 'Shelton', 41.27626, -73.12953, 6484),
(48, 48, '4952 Merrick Rd', 'Massapequa Park', 40.66648, -73.452324, 11762),
(49, 49, '522 Saddle River Rd', 'Saddle Brook', 40.90908, -74.09194, 7663),
(50, 50, '932 S 10th St', 'Philadelphia', 39.938407, -75.159763, 19147),
(51, 51, '775 Goodman Rd E', 'Southaven', 34.962692, -89.975845, 38671),
(52, 52, '133 Back River Neck Rd', 'Essex', 39.309917, -76.44597, 21221),
(53, 53, '22507 Plymouth Rd', 'Redford', 42.37159, -83.26215, 48239),
(54, 54, '901 Nordic Dr', 'White Lake', 42.650524, -83.52507, 48383),
(55, 55, '8028 S Emerson Ave', 'Indianapolis', 39.64946776, -86.08348131, 46237),
(56, 56, '1818 Manhattan Blvd', 'Harvey', 29.88751, -90.056046, 70058),
(57, 57, '406 E Colfax Ave', 'Denver', 39.739883, -104.98201, 80203),
(58, 58, '200 E Main Cross St', 'Findlay', 41.03949, -83.64813, 45840),
(59, 59, '10300 Forest Hill Blvd', 'Wellington', 26.64711379, -80.20931934, 33414),
(60, 60, '3817 W 13th St N', 'Wichita', 37.70839273, -97.38826742, 67203),
(61, 61, '14 E 10th St', 'Erie', 42.12574064, -80.08198836, 16501),
(62, 62, '1665 Stelton Rd', 'Piscataway', 40.5337146, -74.41911221, 8854),
(63, 63, '1933 5th Ave', 'Seattle', 47.613, -122.3383, 98101),
(64, 64, '130 Town Center Rd', 'King Of Prussia', 40.0945493, -75.36821154, 19406),
(65, 65, '1295 Grandview Ave', 'Columbus', 39.984147, -83.044937, 43212),
(66, 66, '1425 Gross Rd', 'Mesquite', 32.81036, -96.62621, 75149),
(67, 67, '3130 Route 10 W', 'Denville', 40.8708844, -74.51648712, 7834),
(68, 68, '938 N Main St', 'Suffolk', 36.743145, -76.583496, 23434),
(69, 69, '1019 Westgate Ave', 'Newark', 40.04792, -82.44069, 43055),
(70, 70, '1203 Walnut St', 'Newton Highlands', 42.320827, -71.205376, 2461),
(71, 71, '1401 Coshocton Ave', 'Mount Vernon', 40.40309, -82.44859, 43050),
(72, 72, '1001 Jason Pl', 'Chatham', 39.684379, -89.706158, 62629),
(73, 73, '562 Broad St', 'Newark', 40.74180603, -74.16905811, 7102),
(74, 74, '3610 Route 378', 'Bethlehem', 40.5813, -75.388214, 18015),
(75, 75, '357 Us Highway 9', 'Englishtown', 40.31333772, -74.30512905, 7726),
(76, 76, '7301 N Fm 620', 'Austin', 30.405542, -97.853065, 78726),
(77, 77, '9822 Libra Ave', 'Sacramento', 38.562374, -121.328061, 95827),
(78, 78, '242 Harvard St', 'Brookline', 42.341129, -71.120988, 2446),
(79, 79, '4921 State Road 26 E', 'Lafayette', 40.41754, -86.81142, 47905),
(80, 80, '717 E Chicago St', 'Bronson', 41.87371, -85.186226, 49028),
(81, 81, '2001 Saint Charles Ave', 'New Orleans', 29.93543034, -90.07900715, 70130),
(82, 82, '95 Mall Rd Burlington Mall Nordstrom Entrance', 'Burlington', 42.4856233, -71.2118857, 1803),
(83, 83, '2898 Reynolda Rd', 'Winston Salem', 36.144259, -80.300566, 27106),
(84, 84, '3770 Las Vegas Blvd S', 'Las Vegas', 36.104416, -115.17607, 89109),
(85, 85, '1495 Union Ave', 'Memphis', 35.13593, -90.01149, 38104),
(86, 86, '15950 Eureka Rd', 'Southgate', 42.1992749, -83.216983, 48195),
(87, 87, '2300 S 16th St', 'Philadelphia', 39.92231, -75.17348, 19145),
(88, 88, '18 Maple St', 'Danvers', 42.565882, -70.936112, 1923),
(89, 89, '7559 Metropolitan Ave', 'Middle Village', 40.71322392, -73.87542844, 11379),
(90, 90, '8385 W 21st St N', 'Wichita', 37.72265196, -97.43952, 67205),
(91, 91, '22 Warren St', 'New York', 40.71432, -74.00777, 10007),
(92, 92, '5 York St', 'Kennebunk', 43.38404, -70.54453, 4043),
(93, 93, '1231 Park St', 'Alameda', 37.76190689, -122.2450572, 94501),
(94, 94, '1760 44th St S W', 'Wyoming', 42.88401467, -85.70610523, 49519),
(95, 95, '153 11 Union Tpke', 'Flushing', 40.719749, -73.80995, 11367),
(96, 96, '653 W 26th St', 'Erie', 42.10643, -80.08851, 16508),
(97, 97, '801 2nd Ave', 'New York', 40.7504272, -73.9722061, 10017),
(98, 98, '315 S College Mall Rd', 'Bloomington', 39.16349566, -86.497757, 47401),
(99, 99, '623 Highland Ave', 'Connellsville', 40.02406613, -79.59280639, 15425),
(100, 100, '1300 Raritan Rd', 'Clark', 40.633867, -74.309443, 7066),
(101, 101, '12326 W 143rd St', 'Homer Glen', 41.62928, -87.91965, 60491),
(102, 102, '1001 S Main St', 'Baltimore', 39.836708, -82.60525, 43105),
(103, 103, '3151 Steinway St', 'Astoria', 40.7600589, -73.91814829, 11103),
(104, 104, 'Midway Airport', 'Chicago', 41.7876304, -87.7417593, 60638),
(105, 105, '12514 120th Ave N E', 'Kirkland', 47.7141111, -122.181, 98034),
(106, 106, '1909 E Ray Rd', 'Chandler', 33.32076, -111.80924, 85225),
(107, 107, '3747 Church Rd', 'Mount Laurel', 39.92969, -74.97526, 8054),
(108, 108, '267 Swanton Rd', 'Saint Albans', 44.838036, -73.081566, 5478),
(109, 109, '1201 16th St', 'Denver', 39.748593, -104.996471, 80202),
(110, 110, 'Rt 114', 'Danvers', 42.5520956, -70.95789297, 1923),
(111, 111, '18607 Bothell Way N E', 'Bothell', 47.762601, -122.208193, 98011),
(112, 112, '120 E Post Rd', 'White Plains', 41.02836, -73.76654, 10601),
(113, 113, '2220 Wildcat Reserve', 'Littleton', 39.53555771, -105.0149, 80129),
(114, 114, '337 N Shore Dr', 'Pittsburgh', 40.44582032, -80.01054704, 15212),
(115, 115, '1165 N Stratford Rd', 'Moses Lake', 47.14469, -119.27833, 98837),
(116, 116, '458 9th Ave', 'New York', 40.75452836, -73.995624, 10018),
(117, 117, '317 2nd St', 'Langley', 48.03972, -122.41025, 98260),
(118, 118, '6607 Glenway Ave', 'Cincinnati', 39.15657, -84.630101, 45211),
(119, 119, '417 12th St', 'Hammonton', 39.631881, -74.808583, 8037),
(120, 120, '708 Jersey Ave', 'Hoboken', 40.729038, -74.044874, 7030),
(121, 121, '715 Lenoir Rhyne Blvd S E', 'Hickory', 35.72376469, -81.32007122, 28602),
(122, 122, '1125 H St NE', 'Washington', 38.9001696, -76.9902978, 20002),
(123, 123, '267 S 19th St', 'Philadelphia', 39.948228, -75.172549, 19103),
(124, 124, '5365 Alton Pkwy', 'Irvine', 33.6713, -117.789, 92604),
(125, 125, '3401 Esperanza Xing', 'Austin', 30.40052, -97.72676, 78758),
(126, 126, '201 N Main St', 'Keller', 32.93635265, -97.25380991, 76248),
(127, 127, '1042 Union Rd', 'Buffalo', 42.828365, -78.75513, 14224),
(128, 128, '233 Broadway', 'New York', 40.712266, -74.007918, 10279),
(129, 129, '2035 4th Ave', 'Seattle', 47.613308, -122.3405, 98121),
(130, 130, '302 E 12th St', 'New York', 40.7306862, -73.9854965, 10003),
(131, 131, '659 W Main Rd', 'Middletown', 41.520603, -71.29902, 2842),
(132, 132, '3208 N Loop 250 W', 'Midland', 32.01104178, -102.1571124, 79707),
(133, 133, '4999 Old Orchard Shopping Ctr', 'Skokie', 42.05731867, -87.74851122, 60077),
(134, 134, '6101 Bardstown Rd', 'Louisville', 38.15805, -85.59119, 40291),
(135, 135, '73722 El Paseo', 'Palm Desert', 33.719958, -116.378539, 92260),
(136, 136, '1720 E Sternberg Rd', 'Fruitport', 43.15464555, -86.20251463, 49415),
(137, 137, '1 Seascape Resort Dr', 'Aptos', 36.951958, -121.878676, 95003),
(138, 138, '1516 E Wood St', 'Paris', 36.3119687, -88.29254186, 38242),
(139, 139, '109 W County Ctr', 'Saint Louis', 38.60194477, -90.44655146, 63131),
(140, 140, '16049 Johnson Rd', 'Charlotte', 35.02941614, -80.85045251, 28277),
(141, 141, '1788 Main St W', 'Locust', 35.25537535, -80.452548, 28097),
(142, 142, '135 Village St', 'Medway', 42.140137, -71.39677, 2053),
(143, 143, '1402 S 12th Ave', 'Marshalltown', 42.031575, -92.89331, 50158),
(144, 144, '944 S Irby St', 'Florence', 34.1761, -79.76639, 29501),
(145, 145, '1294 Chalkstone Ave', 'Providence', 41.83253, -71.45175, 2908),
(146, 146, '700 Main St', 'Nashville', 36.17451746, -86.7605567, 37206),
(147, 147, '711 E Main St', 'Lexington', 33.977715, -81.229095, 29072),
(148, 148, '317 S Main St', 'Grapevine', 32.938723, -97.078219, 76051),
(149, 149, '1045 NW Kings Blvd', 'Corvallis', 44.5772, -123.2753, 97330),
(150, 150, '427 S Boston Ave', 'Tulsa', 36.15205156, -95.98882702, 74103),
(151, 151, '1514 Us 41', 'Schererville', 41.495491, -87.470989, 46375),
(152, 152, '9128 5th Ave', 'Brooklyn', 40.6183, -74.02934, 11209),
(153, 153, '18 Auburn Way S', 'Auburn', 47.30715113, -122.2253753, 98002),
(154, 154, '186 Hillside Ave', 'Milford', 41.220893, -73.005318, 6460),
(155, 155, '216 Townsend St', 'San Francisco', 37.778633, -122.393319, 94107),
(156, 156, '300 E Grand Ave', 'Chickasha', 35.02899335, -97.93078473, 73018),
(157, 157, '& The Embarcadero', 'San Francisco', 37.79932696, -122.3973175, 94111),
(158, 158, '32925 1st Ave S', 'Federal Way', 47.307087, -122.334694, 98003),
(159, 159, '3500 E Main St', 'Farmington', 36.74987198, -108.1603169, 87402),
(160, 160, '11301 Rockville Pike', 'Kensington', 39.04173903, -77.10734816, 20895),
(161, 161, '286 Main St', 'Great Barrington', 42.19469, -73.362096, 1230),
(162, 162, '1504 Old Country Rd', 'Westbury', 40.74672753, -73.59584708, 11590),
(163, 163, '4746 Vernon Blvd', 'Long Island City', 40.74425041, -73.95362487, 11101),
(164, 164, '481 Main St', 'Dennis Port', 41.66548, -70.13004, 2639),
(165, 165, '6593 Collins Dr', 'Moorpark', 34.29484636, -118.8437469, 93021),
(166, 166, '305 W Fm 1382', 'Cedar Hill', 32.60322934, -96.94112778, 75104),
(167, 167, '10880 N 32nd St', 'Phoenix', 33.585795, -112.013289, 85028),
(168, 168, '15 Route 236', 'Clifton Park', 42.83774, -73.738235, 12065),
(169, 169, '305 E Harrison St', 'Lakeview', 40.482773, -83.92229, 43331),
(170, 170, '9774 Zimbro Ave', 'Manassas', 38.753685, -77.491615, 20110),
(171, 171, '3502 Park Ave', 'Weehawken', 40.771072, -74.02265, 7086),
(172, 172, '141 W Railroad Ave', 'Williams', 35.251274, -112.187965, 86046),
(173, 173, '8136 W 3rd St', 'Los Angeles', 34.072135, -118.366983, 90048),
(174, 174, '15740 Aurora Ave N', 'Seattle', 47.744408, -122.34544, 98133),
(175, 175, '551 E Laburnum Ave', 'Richmond', 37.5856, -77.424484, 23222),
(176, 176, '5821 SE International Way', 'Portland', 45.43198, -122.6033, 97222),
(177, 177, '2905 Goose Creek Rd', 'Louisville', 38.287037, -85.57828, 40241),
(178, 178, '448 Franklin Ave', 'Hartford', 41.73670214, -72.6752126, 6114),
(179, 179, '418 E Wyoming Ave', 'Philadelphia', 40.02071, -75.11754, 19120),
(180, 180, '12274 Rockville Pike', 'Rockville', 39.057884, -77.12069, 20852),
(181, 181, '5781 Lee Blvd', 'Lehigh Acres', 26.620066, -81.766235, 33971),
(182, 182, '291 Grand Ave', 'Southlake', 32.94368424, -97.12974465, 76092),
(183, 183, '820 N Alta Ave', 'Dinuba', 36.55233, -119.3951, 93618),
(184, 184, '2460 W 26th Ave', 'Denver', 39.7535, -105.017, 80211),
(185, 185, '34579 Yucaipa Blvd', 'Yucaipa', 34.03323689, -117.0502934, 92399),
(186, 186, '8001 N Port Washington Rd', 'Milwaukee', 43.162429, -87.91198075, 53217),
(187, 187, '1250 W Lake St', 'Addison', 41.94476156, -88.01763178, 60101),
(188, 188, '112 Internatl Boardwalk', 'Redondo Beach', 33.8315, -118.385, 90277),
(189, 189, '637 Wyckoff Ave', 'Wyckoff', 41.010715, -74.1728, 7481),
(190, 190, '1420 E Hatch Rd', 'Modesto', 37.60925, -120.97111, 95351),
(191, 191, '13 Harbourside Ln', 'Hilton Head Island', 32.18039, -80.72779, 29928),
(192, 192, '11200 Scaggsville Rd', 'Laurel', 39.14696, -76.89989, 20723),
(193, 193, '10401 Us 441', 'Belleview', 29.07113559, -82.07051306, 34420),
(194, 194, '684 King George Rd', 'Fords', 40.53234323, -74.30763611, 8863),
(195, 195, '1812 Red Cliffs Dr', 'Saint George', 37.118553, -113.544716, 84790),
(196, 196, '8370 E State Route 69', 'Prescott Valley', 34.585773, -112.319275, 86314),
(197, 197, '6 Bessom St', 'Marblehead', 42.50031408, -70.85926875, 1945),
(198, 198, '8809 Baltimore National Pike', 'Ellicott City', 39.27898, -76.81683, 21043),
(199, 199, '5000 Kahala Ave', 'Honolulu', 21.271709, -157.77395, 96816),
(200, 200, '116 John R Rice Blvd', 'Murfreesboro', 35.84764, -86.44008, 37129),
(201, NULL, '1st address', 'BLOOMINGTON', 39.16, -86, 47408);

-- --------------------------------------------------------

--
-- Table structure for table `MENUS`
--

CREATE TABLE `MENUS` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `menus_amountMax` double NOT NULL,
  `menus_amountMin` double NOT NULL,
  `menus_description` text,
  `menus_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MENUS`
--

INSERT INTO `MENUS` (`id`, `restaurant_id`, `menus_amountMax`, `menus_amountMin`, `menus_description`, `menus_name`) VALUES
(1, 1, 22.5, 15.5, '', 'Bianca Pizza'),
(2, 2, 12, 12, '', 'Pizza, Margherita'),
(3, 3, 10.99, 7.99, 'Choose a pizza size.', 'Cheese Pizza'),
(4, 4, 9.95, 9.95, 'Choose any of your own toppings to make it your own', 'Create Your Own Pizza'),
(5, 5, 8.95, 8.95, '', 'Cheese Pizza'),
(6, 6, 19.95, 15.71, 'Seven layer bean dip', 'Mexican Pizza Dip'),
(7, 7, 10.99, 10.99, '', 'Pizza Margherita'),
(8, 8, 2.59, 2.59, '', 'Pizza Bagel (plain)'),
(9, 9, 8.99, 8.99, 'BBQ Sauce, Mozzarella Cheese, diced Chicken Breast, Onions', 'Bbq Chicken Pizza'),
(10, 10, 4.99, 4.99, 'Pepperoni, marinara, garlic, seasoning and parmesan cheese', 'Pizza'),
(11, 3, 12.5, 12.5, 'Tomato sauce, mozzarella cheese, toppings', 'Tuna Pizza'),
(12, 12, 2.99, 2.99, '', 'Small Pepperoni or Cheese Pizza'),
(13, 13, 8, 8, 'Our original round pizza topped with pepperoni, sausage and bacon.', '3 Meat Treat Pizza'),
(14, 14, 19.99, 16.99, 'Broccoli, spinach, peppers and mushrooms', 'Garden Pizza'),
(15, 15, 1.75, 1.75, 'Italian pepperoni, hot italian sausage, fresh ground western beef, cob smoked bacon, marinated chicken breast, new england baked ham anchovy filets, fresh plum tomatoes, freshly cut broccoli, fresh white mushrooms, fresh green spinach, freshly sliced eggplant, freshly sliced red onions, freshly sliced green peppers, marinated sun dried tomatoes, sliced jalapeno peppers, roasted red peppers, freshly chopped garlic, california black olives, sweet hawaiian pineapple, marinated artichoke hearts, scrambled eggs new, italian gorgonzola cheese, greek feta cheese, vegan soy cheese, grated parmesan cheese, flavorful four cheese blend', 'Pizza Toppings'),
(16, 16, 15, 15, '', 'Pizza'),
(17, 3, 8.95, 8.95, 'Boursin, mozzarella, arugula, parmesan', 'Sausage Onion Jam Pizza'),
(18, 18, 13.99, 13.99, '', 'Cheese Pizza'),
(19, 19, 16.24, 16.24, 'Mozzarella, ricotta, garlic, no sauce', 'White Pizza'),
(20, 20, 6.7, 6.7, 'Our backed light crust, stuffed and folded with our freshest ingredients, basted with garlic butter, sprinkled with romano cheese and parsley', 'Cheese Pizzarito'),
(21, 1, 7.99, 7.99, '', 'Pizza Dough Balls'),
(22, 22, 15.95, 9, '', 'Margherita Pizza'),
(23, 23, 9.75, 9.75, '', 'Build Your Own Pizza'),
(24, 24, 13.95, 13.95, 'Mild or hot', 'Chicken Wing Pizza'),
(25, 25, 19.95, 19.95, '', 'Blt Pizza'),
(26, 26, 5, 5, '', 'Cheese Pizza'),
(27, 27, 9.5, 9.5, '', 'Pizza'),
(28, 28, 5.99, 5.99, '', 'Half Pizzas'),
(29, 29, 5.99, 5.99, '', 'Cheese Pizza'),
(30, 30, 7, 7, '', 'Byo Pizza'),
(31, 31, 7.99, 7.99, '', 'Cheese Pizza'),
(32, 32, 4.25, 4.25, '', 'Pizza Sub'),
(33, 33, 4.39, 4.39, '', 'Kids Size Pizza'),
(34, 34, 10.75, 10.75, '', 'Eggscellent Pizza (white)'),
(35, 35, 5.99, 5.99, '', 'Mini Pizza'),
(36, 36, 8.79, 8.79, 'Creamy artichoke spinach sauce, featuring bacon, is topped with sliced chicken breast, fresh tomatoes, artichokes, mozzarella and cheddar cheese.', 'Artichoke Chicken Pizza'),
(37, 37, 17, 17, '', 'Cheese Steak Pizza'),
(38, 38, 2.95, 2.95, '', 'Pizza Bagel'),
(39, 39, 2.5, 2.5, '', 'Chinese Pizza'),
(40, 40, 6.99, 6.99, 'With two toppings, sauce and mozzarella.', 'Personal Pizza'),
(41, 41, 3.75, 3.75, 'Flour tortilla topped with cheese sauce and ground beef', 'Mexican Pizza'),
(42, 42, 4.95, 4.95, '', 'Pizza Combo'),
(43, 43, 16.95, 13.95, 'BBQ sauce, grilled chicken breast, cheddar and mozzarella.', 'Bbq Chicken Pizza'),
(44, 44, 15.99, 15.99, 'Mozzarella and cheddar, chorizo, red onion and jalapenos.', 'Pizza Mexicana'),
(45, 45, 12, 12, '', 'White Pizza'),
(46, 46, 18.5, 18.5, '', 'Pizza Blanca'),
(47, 47, 5.25, 5.25, 'Breaded chicken with 2 ounces of pepperoni, melted provolone topped with marinara sauce', 'Chicken Pizza'),
(48, 48, 20.5, 20.5, '', 'Spicy Buffalo Pizza'),
(49, 49, 16.95, 14.95, '', 'Baked Ziti Pizza'),
(50, 50, 8.95, 8.95, '', 'Pizza Burger'),
(51, 51, 4.59, 2.99, '', 'Pizza Bread'),
(52, 52, 16.99, 12.99, '', 'Greek Pizza'),
(53, 53, 3.75, 3.75, '', 'Pizza  Burger'),
(54, 54, 11.99, 11.99, '', '8 Corner Pizza'),
(55, 55, 1.42, 1.42, '', 'Cheese Pizza'),
(56, 56, 6.49, 5.49, 'Pepperoni in marinara sauce, mozzarella cheese, chives', 'Pizza'),
(57, 57, 1.2, 1.2, '', 'Pizza Roll'),
(58, 58, 8.75, 8.75, 'Corned beef, 1000 island, sauerkraut, red onion', 'Berlin Pizza'),
(59, 59, 116.99, 116.99, '', 'Pizza'),
(60, 60, 4.89, 4.89, '', 'Taco Pizza'),
(61, 61, 4.99, 4.99, 'Traditional pizza logs with pepperoni and mozzarella cheese served with a side of our homemade marinara sauce', 'Pizza Logs'),
(62, 62, 7.99, 7.99, 'Crispy breaded chicken, blue cheese and buffalo sauce', 'Buffalo Pizza'),
(63, 63, 16, 16, '', 'Bbq Chicken Pizza'),
(64, 64, 7.29, 7.29, '', 'Pizza Steak'),
(65, 65, 15, 15, '', 'Garden Pizza'),
(66, 66, 4.75, 4.75, '', 'Cheese Pizza'),
(67, 67, 10.95, 10.95, 'Tuna or salmon scallion pancake seaweed spicy kapayaki sauce', 'Sushi Pizza'),
(68, 68, 1.25, 1.25, '', 'Pizza Roll'),
(69, 69, 4.5, 4.5, '', 'Italian, Veggie or Pizza Sub'),
(70, 70, 9, 9, 'Any topping extra charge will be applied', 'Adult Cheese Pizza'),
(71, 71, 17.49, 9.49, '', 'Captain Jean Pizza'),
(72, 72, 12.99, 12.99, 'Cheese, pepperoni, mushrooms, green peppers, sausage', 'Deluxe Pizza'),
(73, 73, 8.5, 8.5, 'A classic featuring our house made pizza sauce.', 'Broad Street Cheese Pizza'),
(74, 74, 7, 7, 'Flat bread seasoned with garlic olive oil topped with mozzarella, parmesan, tomatoes and balsamic glaze.', 'Margarita Flat Bread Pizza'),
(75, 75, 12, 12, '', 'Tuna Pizza'),
(76, 76, 14.49, 14.49, 'Hamburger, breakfast bacon, red onions, and cheddar cheese .', 'Bacon Pizzaburger'),
(77, 77, 14.25, 14.25, '', 'Buffalo Chicken Pizza'),
(78, 78, 14, 14, 'house made sausage, pickled onion, broccoli rabe, creamy goat cheese', 'Wood Oven Pizza'),
(79, 79, 12.99, 12.99, '', 'Cheese Pizza'),
(80, 80, 9.99, 9.99, '', 'Large Cheese Pizza.'),
(81, 81, 4.95, 4.95, '', 'Great Tasting Cheese Pizza'),
(82, 82, 12.49, 12.49, 'Chicken, roasted red peppers, garlic and spinach topped with mozzarella, drizzled with basil pesto', 'Chicken Verde Artisan Crust Pizza'),
(83, 83, 7.25, 7.25, '', 'Flatbread Pizza of The Day'),
(84, 84, 14, 14, 'Fresh Mozzarella, Slices of Fresh Roma Tomatoes, Zucchini Blossoms, Topped with Fresh Basil Leaves, Dried Oregano, Drizzle of Balsamic Glaze', 'Caprese Pizza'),
(85, 85, 8.95, 8.95, 'Mozzarella and Ricotta', 'White Pizza'),
(86, 86, 9.99, 9.99, 'Your Choice Of Bbq Chicken Or Sante Fe', 'Homemade Mexican Pizza'),
(87, 87, 6.95, 6.95, '', 'Chicken Pizza Steak'),
(88, 88, 1.85, 1.85, '', 'Pizza Roll'),
(89, 89, 2.5, 2.5, '', 'Pizza Dough'),
(90, 90, 1.99, 1.99, 'Ground beef, melted cheddar cheese and your choice of sauce on a fried corn shell topped with green olives.', 'Taco Pizza'),
(91, 91, 14, 14, '', 'Arugula Pizza (seasonal)'),
(92, 92, 18.6, 18.6, 'Large', 'Chicken Supreme Pizza'),
(93, 93, 23.99, 9.99, '', 'Arthichoke Heart Chicken Pizza'),
(94, 94, 12.25, 12.25, '', 'Taco Pizza'),
(95, 95, 12.95, 12.95, '', 'Spicy Tuna Pizza or Spicy Salmon Pizza'),
(96, 96, 5.99, 5.99, '', 'Pizza'),
(97, 97, 17, 17, '', 'Cheese Pizza'),
(98, 98, 4, 4, 'Cheese or Pepperoni', 'Pizza Slice'),
(99, 99, 6.99, 6.99, 'Our pizza dough stuffed with pepperoni, cheese and seasonings deep fried to a golden brown.', 'Pizza Fries'),
(100, 100, 13, 13, 'shredded mozzarella, corned beef, russian dressing', 'The Reuben Pizza'),
(101, 101, 3.75, 3.75, '', 'Pizza Bread'),
(102, 102, 15.3, 5.1, '', 'Margherita Pizza (on Honey Wheat Dough)'),
(103, 103, 18.5, 18.5, 'Grilled chicken, roman lettuce, groutons, caeser salad dressin', 'Caeser Sald Pizza'),
(104, 104, 5.55, 5.55, 'Pepperoni, marinara sauce, provolone cheese, mushrooms and italian seasoning', 'Pizza Sandwich'),
(105, 105, 10, 10, '', 'Moped Pizza'),
(106, 106, 7, 7, '', 'Bacon Cheddar Burger Pizza'),
(107, 107, 4.99, 4.99, '', 'Pizza Fries'),
(108, 108, 6.95, 6.95, 'Garlic (no charge) , carrots, bacon, mushrooms, onions, sauteed onions, green peppers, fresh tomatoes, broccoli, black olives, pepperocini, hot pepper rings, pineapple, pepperoni, sausage, ham, meatball, vermont cheddar, ricotta blend, extra cheese, anchovies.', 'Cheese Pizza'),
(109, 109, 12.95, 12.95, 'Mozzarella, fontina, red onion and cilantro', 'B.b.q. Chicken Pizza'),
(110, 110, 8.99, 8.99, '', 'Thin Crust Margarita Pizza'),
(111, 111, 11, 11, 'olive oil, roasted wild mushrooms, goat cheese fried shallots', 'Mushroom Hunter Pizza'),
(112, 112, 18.99, 18.99, 'Fresh Tomato, Fresh Mozzarella and Basil', 'Caprese Pizza'),
(113, 113, 23.5, 17.5, '', 'Meat Lover Pizza'),
(114, 114, 17.99, 7.99, 'Sausage, pepperoni, capicola and hot pizza sauce, hot peppers and onions', 'Blast Furnace Pizza'),
(115, 115, 5, 5, '', 'To The Price of Any Pizza'),
(116, 116, 16.95, 9.5, '', 'Fresh Mushroom Pizza'),
(117, 117, 7.5, 6.5, '', 'Pizza'),
(118, 118, 4.39, 4.39, '', 'Kids Size Pizza'),
(119, 119, 5.79, 5.79, '', 'Pizza Steak'),
(120, 120, 14, 14, 'Sunny side up eggs, crispy pancetta, spinach, mozzarella', 'Truffled Egg Pizza'),
(121, 121, 8.8, 8.8, 'A deep fried flour tortilla topped with beans, choice of meat, monterey jack and cheddar cheese, garnished with fresh tomatoes, fresh green onions, fresh guacamole and sour cream.', 'Mexican Pizza'),
(122, 122, 8, 8, '', 'Khans Korean Pizza'),
(123, 123, 5, 5, '', 'Pizza Boy Citra Pils (4)'),
(124, 124, 15.75, 15.75, '', 'Pizza or Calzone'),
(125, 125, 116.99, 116.99, '', 'Pizza'),
(126, 126, 5.25, 5.25, '', '1 Topping Pizza'),
(127, 127, 5.5, 5.5, '', 'Blt or Pizza Sub'),
(128, 128, 10, 10, '', 'Grilled Pizza'),
(129, 129, 7.29, 7.29, 'Whole', 'Pizza Special'),
(130, 130, 10.95, 10.95, 'Tomato, Basil, Garlic', 'Marinara Pizza'),
(131, 131, 7.3, 7.3, '', '1 Item Pizza'),
(132, 132, 4.99, 4.99, '', 'Chocolate Chip Pizza'),
(133, 133, 5.95, 5.95, '', 'Cheese Flatbread Pizza'),
(134, 134, 14.99, 14.99, 'BBQ sauce, chicken, red onion, cheddar and mozzarella cheese.', 'Bbq Chicken Pizza'),
(135, 135, 11, 11, '', 'Pizza Vino Caesar'),
(136, 136, 9.99, 9.99, '', 'Stuffed Jalapeno Pizza'),
(137, 137, 12, 12, 'Red Sauce, Mozzarella', 'Pepperoni Pizza'),
(138, 138, 4.99, 4.99, '2 Per Order', 'Pizza Bread Cheese'),
(139, 139, 116.99, 116.99, '', 'Pizza'),
(140, 140, 20.99, 20.99, '', 'Add To Large Pizzas'),
(141, 141, 6.49, 6.49, 'Just like a mini pepperoni and mozzarella pizza. Rolled into a finger food appetizer.', 'Pizza Rolls'),
(142, 142, 1.25, 1.25, '', 'Pizza Slice'),
(143, 143, 1.99, 1.99, '', 'Breakfast Pizza Slice'),
(144, 144, 2.8, 2.8, '', 'Pizza By The Slice'),
(145, 145, 4, 4, '', 'Pizza Bread'),
(146, 146, 5, 5, '', 'Pizza Bagel'),
(147, 147, 5, 5, '', 'Cheese Pizza'),
(148, 148, 10, 10, '', 'Chicken Supreme Pizza'),
(149, 149, 19.5, 19.5, '', 'Taco Pizza'),
(150, 150, 8, 8, 'Broccolini, green onion, spinach, goat cheese, chile, salsa verde', 'Veggie Pizza'),
(151, 151, 12, 12, '', 'Our Famous Thin Crust Pizza'),
(152, 152, 3.75, 3.75, '', 'Pizza Burger'),
(153, 153, 8, 8, 'Personal cheese pizza', 'Pizza'),
(154, 154, 5.95, 5.95, 'A flour tortilla, lightly baked, covered with melted cheeses, green chiles, topped with sour cream and guacamole.', 'Mexican Pizza'),
(155, 155, 18, 18, '', 'Shrimp Chorizo Pizza'),
(156, 156, 12, 12, 'Bbq sauce, mozzarella cheese, chunks of honey pepper bacon, chicken and diced red onions', 'Bbq Chicken Pizza'),
(157, 157, 13, 13, '', 'Carmelized Leek Pizza, Roasted Garlic Soubise, Fingerling Potatoes'),
(158, 158, 7.99, 4.99, 'Pepperoni, ham and cheese', 'Stuffed Pizza Rolls'),
(159, 159, 12.95, 12.95, 'Spicy tuna. mango, avocado, crunchy, scallion tobiko, eel sauce, mango .', 'Sushi Pizza'),
(160, 160, 6.24, 6.24, 'White', 'Crab Pizza'),
(161, 161, 12.95, 12.95, 'A combination of bbq sauce, chicken, red onions, fresh mozzarella, smoked gouda, oregano and parmesan', 'Abbondante Bbq Chicken Pizza'),
(162, 162, 9.95, 9.95, '', 'Hummus Veggie Pizza'),
(163, 163, 11.95, 11.95, '', 'Nutilla Pizza'),
(164, 164, 16.1, 10.55, 'Feta, spinach, pizza cheese, sauce, oregano, black olives, olive oil, onions', 'Greek Pizza'),
(165, 165, 8.95, 8.95, 'San Marzano tomato sauce, provolone, fresh mozzarella, parmesan, burrata, garlic, oregano.', 'Cheese Pizza'),
(166, 166, 6.49, 6.49, '', 'Pizza Dolce Alla Nutella'),
(167, 167, 5.99, 5.99, '', 'Italian Herb Pizza Crust'),
(168, 168, 15.25, 15.25, 'Mushrooms, hot peppers, onions, olives, and mozzarella.', 'Arrabbiatta Pizza'),
(169, 169, 14, 14, '', 'Florentine Pizza'),
(170, 170, 7.99, 7.99, '', '3 Topping Pizza'),
(171, 171, 15, 15, '', 'Baked Ziti Pizza'),
(172, 172, 11.89, 11.89, '', 'Mexican Pizza'),
(173, 173, 9.95, 9.95, 'Caramelized onion, pancetta, and swiss cheese baked with 2 eggs on top.', 'Morning Pizza'),
(174, 174, 1.2, 1.2, '', 'Pizza Roll'),
(175, 175, 20.99, 20.99, '', 'Add To Large Pizzas'),
(176, 176, 5, 5, '', 'Cheesy Pizza'),
(177, 177, 23.25, 23.25, 'Instead of tomato sauce, this pizza gets covered with just the right amount of sweet bbq sauce, grilled chicken, and onions', 'Bbq Chicken Pizza'),
(178, 178, 14, 14, '', 'Spicy Chicken Pizza'),
(179, 179, 2.75, 2.75, '', '2 Pizza Roll'),
(180, 180, 17.5, 17.5, 'Our white pizza with cubes of chicken with bbq sauce', 'Bbq Chicken Pizza'),
(181, 181, 20, 20, '', '2 Large Cheese Pizzas'),
(182, 182, 10, 10, '', 'Nutella Pizza'),
(183, 183, 12.99, 12.99, '', 'Cheese Pizza'),
(184, 184, 2.95, 2.95, '', 'Cheese Pizza'),
(185, 185, 27.36, 16.53, 'Bbq sauce, chicken, red onion, garhc, cashews', 'Bbq Chicken Pizza'),
(186, 186, 7.75, 7.75, '', 'Cheese Pizza'),
(187, 187, 13.95, 10.95, '', 'Pizza Mania'),
(188, 188, 6.5, 6.5, '', 'Miso Pizza'),
(189, 189, 16.95, 16.95, '', 'Bbq Chicken Pizza'),
(190, 190, 10.59, 10.59, '', 'Cheese Pizza'),
(191, 191, 7, 7, 'Kids pizza served with French fries', 'Kids Pizza'),
(192, 192, 5.99, 5.99, '', 'Pizza Fries'),
(193, 193, 16.5, 16.5, '', 'Large 4 Topping Pizza'),
(194, 194, 4.95, 4.95, 'Mozzarella cheese and tomato sauce', 'Pizza Burger'),
(195, 195, 14.99, 14.99, '', 'Pizza Con Formaggio'),
(196, 196, 5.75, 5.75, '', 'Mexican Pizza'),
(197, 197, 2.5, 2.5, '', 'Pizza Roll'),
(198, 198, 14.99, 14.99, '', 'Pizza Abbroz'),
(199, 199, 10, 10, 'Mozzarella, parmesan, marinara sauce', 'Cheese Pizza'),
(200, 200, 10.99, 10.99, 'Blended cheeses, red onions, BBQ sauce and pork or grilled chicken', 'Barbeque Pizza');

-- --------------------------------------------------------

--
-- Stand-in structure for view `restaurantcustomerinfo`
-- (See below for the actual view)
--
CREATE TABLE `restaurantcustomerinfo` (
);

-- --------------------------------------------------------

--
-- Table structure for table `RESTAURANTS`
--

CREATE TABLE `RESTAURANTS` (
  `id` int(11) NOT NULL,
  `tag` text NOT NULL,
  `categories` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RESTAURANTS`
--

INSERT INTO `RESTAURANTS` (`id`, `tag`, `categories`) VALUES
(1, 'Little Pizza Paradise', 'Pizza Place'),
(2, 'The Brentwood', 'American Restaurant,Bar,Bakery'),
(3, 'Bravo Pizza Hollywood', 'Pizza Place'),
(4, 'Lucky\'s Pub', 'Bar,Beer Garden,Sports Bar,Sports Bar, Bar, and Beer Garden'),
(5, 'Roadhouse Cafe', 'American Restaurant, Seafood Restaurant, and French Restaurant'),
(6, 'Brigham Young University', 'University,University University'),
(7, 'Francesca\'s On Chestnut', 'Italian Restaurant,Restaurant,Italian Restaurant Streeterville'),
(8, 'Country Bagel Bakery', 'Bagels,Bakeries,Restaurants,Restaurant,Breakfast Brunch & Lunch Restaurants,,Bagel Shop,Breakfast Spot,Coffee Shop'),
(9, 'Giovanni\'s Pizza and Pasta', 'Italian Restaurant,Pizza Place,Take Out Restaurants,Restaurants,Italian Restaurant and Pizza Place,Pizza,doctor'),
(10, 'Philly\'s Subs', 'Sandwich Place'),
(11, 'Satsuma', 'Asian Restaurant,Asian Restaurant Forty Acres'),
(12, 'Gatehouse Restaurant', 'Family Style Restaurants,Restaurants,Restaurant'),
(13, 'Little Caesars Pizza', 'Pizza Place'),
(14, 'Joey\'s N Y Pizza', 'Pizza Place,Pizza,Take Out Restaurants,Caterers,Italian Restaurants,Restaurants'),
(15, 'Keyme', 'Keymakers,Locks & Locksmiths'),
(16, 'Tower Hill Tavern', 'Restaurants,Bars & Pubs'),
(17, 'Brio Tuscan Grille - Southlake - Southlake Town Square', 'Restaurant'),
(18, 'Doubledave\'s Pizza Works', 'Restaurant,Pizza Place'),
(19, 'Frank\'s Pizzeria', 'Pizza Place,Take Out Restaurants,Restaurants,Pizza'),
(20, 'Casino\'s Pizza', 'Pizza Place,Restaurant'),
(21, 'Glutenfree Things', 'Bakery,Bakery Restaurants,Food Products Retail,Variety Stores,Organic Foods & Products,Bakeries,Restaurant,Bakery Northwest Arvada'),
(22, 'Mediterraneo Ristorante', 'Italian Restaurant'),
(23, 'Patrick Molloy\'s Sports Pub', 'Pub,Sports Bar'),
(24, 'Salerno\'s Pizza Restaurant', 'Pizza Place,Take Out Restaurants,Restaurants,Italian Restaurants,Pizza'),
(25, 'Nino\'s Trattoria & Pizzeria', 'Pizza Place,Italian Restaurant,Restaurants,Pizza Place and Italian Restaurant'),
(26, 'Oceano Bistro - Clayton', 'Restaurant'),
(27, 'Brothers 2', 'Italian Restaurant, Pizza Place, and Bar,catering companies'),
(28, 'Uno Pizzeria & Grill - Sturbridge', 'American Restaurant, Pizza Place, and Gluten-free Restaurant,American Restaurant,Pizza Place,Gluten-free Restaurant'),
(29, 'Doubledave\'s Pizzaworks', 'Pizza Place'),
(30, 'Buon Cibo', 'Food and Beverage,Restaurant'),
(31, 'Tomato & Basil', 'Pizza Place,Italian Restaurants,Pizza,Mediterranean Restaurants,Restaurants'),
(32, 'Blockbuster', 'Video Rental & Sales,Video Games,DVD Sales & Service'),
(33, 'Larosa\'s Pizzeria', 'Pizza Place'),
(34, 'Boston\'s Restaurant & Sports Bar', 'Pizza Place,Restaurant,American Restaurant'),
(35, 'Ristorante Italiano', 'Caterers,Restaurants,Take Out Restaurants,Italian Restaurants,Fast Food Restaurants,Mediterranean Restaurants,Seafood Restaurants,Italian Restaurant'),
(36, 'Zios Italian Kitchen - Olathe', 'Italian Restaurant'),
(37, 'Town Pub', 'American Restaurants,Bars,Pizza,Italian Restaurants,Mediterranean Restaurants,Night Clubs,Taverns,Bar & Grills,Family Style Restaurants,Restaurants,Northern Nj,Pub'),
(38, 'I Love Bagels', 'Restaurant,Restaurants,Bagels,Bakeries,Bagel Shop'),
(39, 'Ming Garden Cocktails Chinese Restaurant', 'Chinese Restaurants,Cocktail Lounges,Take Out Restaurants,Fast Food Restaurants,Seafood Restaurants,Bar and Grills,Asian Restaurants,Restaurants,Chinese Restaurant'),
(40, 'Tascali\'s Decades Pasta & Grill', 'Italian Restaurant'),
(41, 'La Hacienda', 'Restaurant,Restaurants,Mexican Restaurant'),
(42, 'West River Cafe', 'Caf and Coffee Shop,Coffee & Espresso Restaurants,Coffee Shops,Pizza,Caterers,Bagels,Restaurants'),
(43, 'Original Giorgio\'s', 'Pizza Place,Mediterranean Restaurant,Take Out Restaurants,Caterers,Restaurants,Pizza'),
(44, 'Peter Piper Pizza', 'Pizza,Restaurants,Pizza Place,Pizza Place Ahwatukee Foothills'),
(45, 'Martinizing', 'Sales Promotions & Counseling Services,Sales Consultants'),
(46, 'Nypd Pizza', 'Pizza Place,American Restaurant,Karaoke Bar,Pizza Place, American Restaurant, and Karaoke Bar'),
(47, 'Enterprise Deli', 'Deli / Bodega,Delicatessens,Restaurants,Restaurant'),
(48, 'Pizza Bistro', 'Pizza Place'),
(49, 'Riccardo\'s Pizza', 'Italian Restaurant,Restaurant'),
(50, 'Carluccio\'s', 'Italian Restaurant,Restaurants,Restaurant Equipment & Supplies Retail'),
(51, 'Avellino\'s Pizza', 'Take Out Restaurants,Caterers,Restaurants,Italian Restaurants,Pizza'),
(52, 'Prima Pizza', 'Pizza,Restaurants'),
(53, 'Prince Pizza', 'Pizza Place,Take Out Restaurants,Caterers,Pizza Place North West Detroit,Restaurants,Pizza'),
(54, 'Jet\'s Pizza', 'Pizza Place,Take Out Restaurants,Restaurants,Sandwich Shops,Pizza'),
(55, 'Greek\'s Pizzeria', 'Pizza Place'),
(56, 'The Spud Spot', 'Restaurants,Take Out Restaurants,Fast Food Restaurants,American Restaurants,Creole & Cajun Restaurants,Restaurant,Breakfast Brunch & Lunch Restaurants,,Snack Place'),
(57, 'China Kitchen', 'Restaurant,Chinese,Chinese Restaurant'),
(58, 'Tavern At The Inn', 'American Restaurants,Bars,Party and Event Planners,Brew Pubs,Meeting and Event Planning Services,Banquet Halls and Reception Facilities,Seafood Restaurants,Caterers,Taverns,Pizza,Restaurants,Business Services,Expos Conventions,Bars Clubs,Bars Pubs,Event Planning,Banquet Rooms,Reception Centers,Party Planners,Bed Breakfasts,Hotels Motels,Conventions,Wholesale Industrial Inspection Devices,Lounge'),
(59, 'California Pizza Kitchen', 'Pizza Place,Take Out Restaurants,American Restaurants,Restaurants,Italian Restaurants,Pizza'),
(60, 'Knolla\'s Pizza', 'Pizza Place'),
(61, 'Sluggers Sports Bar', 'Sports Bar, American Restaurant, and Bar,American Restaurant,Bar,Sports Bar'),
(62, 'Suraya\'s - Grill and Fried Chicken', 'American Restaurant and Asian Restaurant'),
(63, 'Icon Grill', 'American Restaurant,Restaurant'),
(64, 'Michael\'s Jewish Delicatessen', 'Deli / Bodega'),
(65, 'Spagio', 'Restaurant,Restaurants,European Restaurants'),
(66, 'Atheneos Greek Village Cafe', 'Restaurants,Texas (tx),Mesquite,Mesquite Restaurants,Greek Restaurant,Restaurant'),
(67, 'Midori Japanese Restaurant', 'Japanese Restaurant'),
(68, 'China Moon', 'Chinese Restaurant'),
(69, 'Louie\'s Pizza', 'Pizza,Restaurants,Pizza Place,Take Out Restaurants,Caterers'),
(70, 'Walnut Grille', 'Vegetarian / Vegan Restaurant,Restaurant,Bar & Grills,Caterers,Restaurants'),
(71, 'Pirate\'s Cove', 'Pizza,Caterers,Take Out Restaurants,Family Style Restaurants,Restaurants,Catering,Pizza Place'),
(72, 'Antonio\'s Pizza', 'Pizza Place,Restaurants,Food & Entertainment'),
(73, 'Broad Street Cafe', 'Breakfast Spot,labor organizations'),
(74, 'Art Cafe', 'Restaurant'),
(75, 'Hunan Gourmet', 'Chinese Restaurants,Gourmet Restaurants,Asian Restaurants,Restaurants,Hunan Restaurants,Seafood Restaurants,Chinese Restaurant'),
(76, 'Austin\'s Pizza', 'Pizza,Take Out Restaurants,Italian Restaurants,Caterers,Restaurants,Pizza Place'),
(77, 'Milanos Pizza', 'Pizza Place,Sacramento Restaurants'),
(78, 'Lineage - Permanently Closed', 'Restaurant'),
(79, 'Fox\'s Pizza Den', 'Pizza Place,Pizza,Restaurants,Take Out Restaurants,Fast Food Restaurants,Italian Restaurants,Family Style Restaurants'),
(80, 'Bronson Strike Zone', 'Batting Cages,Bowling Lanes & Bowling Centers,Bowling Alley,Sports Bar,Arcade'),
(81, 'Copeland\'s Cheescake Bistro', 'American Restaurant,Cajun / Creole Restaurant,Bakery'),
(82, 'Uno Pizzeria & Grill', 'Restaurant'),
(83, 'Dioli\'s Italian Market', 'Mediterranean Restaurants,Restaurants,Bakeries,Delis And Delicatessens,Italian Restaurants,Pizza,Delicatessens,Deli / Bodega,Italian Restaurant'),
(84, 'D. Vino Italian Food and Wine Bar - Monte Carlo', 'Restaurant'),
(85, 'Little Italy Pizza', 'Pizza Place,Italian Restaurant'),
(86, 'Mexican Gardens', 'Mexican Restaurant'),
(87, 'Mi Pal\'s Deli', 'Deli / Bodega,Mediterranean Restaurants,American Restaurants,Deli / Bodega South Philadelphia,Caterers,Restaurants,Sandwich Shops,Bagels,Italian Restaurants,Delicatessens,Health Food Restaurants'),
(88, 'Supreme Roast Beef & Sea Food', 'Greek Restaurant and Fast Food Restaurant,Greek Restaurant,Fast Food Restaurant'),
(89, 'Rosa Ii Pizzeria & Restaurant', 'Pizza Place'),
(90, 'Taco Pronto', 'Mexican Restaurant,Fast Food Restaurant'),
(91, 'Gran Morsi', 'Restaurant,Italian Restaurant'),
(92, 'Kennebunk House Of Pizza', 'Restaurants,Italian Restaurants,Pizza,Pizza Place'),
(93, 'The Fire Den', 'Sports Bar,Bar,Sports Bar and Bar,Sports Bar and Bar East End'),
(94, 'Russo\'s Pizza', 'Pizza Place,Italian Restaurant,Salad Place,Restaurant'),
(95, 'Kyoto Sushi', 'Sushi Restaurant, Asian Restaurant, and Japanese Restaurant Northeastern Queens,Restaurants,Japanese Restaurant,Asian Restaurant,Sushi Restaurant,Locksmiths'),
(96, 'Booies Pizza', 'Caterers,Carry-out food,Karaoke,Pizza,Restaurants,American restaurants,Cafeteria restaurants,Italian restaurants,Sandwiches,Catering,Sandwich Shops,Food Delivery Service,Take Out Restaurants,Cafeteria,Pizza Place'),
(97, 'Patsy\'s Pizzeria', 'restaurant'),
(98, 'Fazoli\'s', 'Italian Restaurant,Fast Food Restaurant'),
(99, 'The Italian Oven', 'Italian Restaurant'),
(100, 'Oh\' Brian\'s on the Green', 'Gastropub,Latin American Restaurants,Bars,American Restaurants,Restaurant,Brew Pubs,Caterers,Restaurants,Night Clubs,Family Style Restaurants,Bar & Grills,Mexican Restaurants,Taverns'),
(101, 'Baldinelli Pizza', 'Pizza,Restaurants,Pizza Place'),
(102, 'Cristy\'s Pizza', 'Pizza Place,Pizza,Sandwich Shops,Italian Restaurants,Delicatessens,Restaurants'),
(103, 'Steinway Pizza', 'Pizza Place'),
(104, 'Potbelly Sandwich Shop', 'wich Place'),
(105, 'Cafe Veloce', 'italian restaurant,Italian Restaurant, Pizza Place, and Wine Bar,Restaurant'),
(106, 'Hungry Howie\'s Pizza', 'Pizza Place,Pizza,Restaurants,Take Out Restaurants'),
(107, 'Tony Soprano\'s Pizza', 'Restaurants,Italian Restaurants,Pizza,Pizza Place'),
(108, 'Pie In The Sky', 'Restaurants,Pizza,Delicatessens'),
(109, 'Mellow Mushroom Pizza Bakers', 'Pizza Place, Bar, and Sports Bar LoDo,American Restaurant,Coffee Shop LoDo,Restaurants,Pizza Place, Bar, and Sports Bar,Pizza Place LoDo,Bakeries,Restaurant,American Restaurant LoDo,Bar,Dessert Shops,Pizza Place,Sports Bar,Burger Joint, American Restaurant, and Fast Food Restaurant LoDo'),
(110, 'Grassfields Bar & Grill', 'American Restaurant'),
(111, 'Tavern On The Square', 'Restaurant'),
(112, 'Euro Pizzeria', 'Pizza Place'),
(113, 'Abo\'s Pizza', 'Pizza Place'),
(114, 'Rivertowne North Shore', 'American Restaurant,Bar'),
(115, 'Lake Bowl Inc', 'Bowling Alley,Bowling,Bowling Equipment & Accessories,Bars,Cocktail Lounges,Restaurants'),
(116, 'Burgers & Cupcakes', 'Burger Joint and Cupcake Shop'),
(117, 'Mo\'s Pub Eatery', 'Bartending Service,Caterers,Pub'),
(118, 'Larosa\'s Pizzeria', 'Pizza Place and Italian Restaurant'),
(119, 'Baglianis Food Market', 'Food Stores,Butcher Shops,Seafood Markets,Restaurants,Delis And Delicatessens'),
(120, 'The Hamilton Inn', 'Restaurant'),
(121, 'Rancho Viejo Mexican Grill', 'Mexican Restaurant'),
(122, 'Khan\'s Bar & Grill', 'Asian Restaurant,Washington Dc'),
(123, 'C19', 'Italian Restaurant Rittenhouse Square,Italian Restaurant'),
(124, 'Zpizza', 'Pizza Place,Pizza'),
(125, 'California Pizza Kitchen', 'Pizza,Take Out Restaurants,Restaurants,American Restaurants,Italian Restaurants,pizza place,American Restaurant'),
(126, 'Bosses Pizza - Keller', 'Pizza Place'),
(127, 'Brando\'s Pizza', 'Pizza Place'),
(128, 'Woolworth Tower Kitchen', 'Restaurant,New York City'),
(129, 'Ralph\'s Grocery Deli', 'Food Products,Grocery Stores,Supermarkets and Super Stores,Delicatessens,Grocery Stores & Supermarkets,Sandwich Place,Grocery Store'),
(130, 'John\'s of 12th Street', 'Restaurant,Italian Restaurant,Italian Restaurant East Village'),
(131, 'Kingston Pizza', 'Restaurant'),
(132, 'Doubledave\'s Pizzaworks', 'Pizza Place,cellular phone companies'),
(133, 'Maggiano\'s Little Italy', 'Italian Restaurant,American Restaurant,Dessert Shop'),
(134, 'Bearno\'s Pizza', 'Restaurant,Restaurants,Italian Restaurants,Pizza,Pizza Place'),
(135, 'Piero\'s Pizza Vino', 'italian restaurant'),
(136, 'That 70s Dough', 'Pizza Place'),
(137, 'Sanderlings - Seascape Resort', 'Restaurant'),
(138, 'Ace\'s Pizza', 'Pizza Place'),
(139, 'California Pizza Kitchen', 'Pizza Place,Restaurants,Pizza,American Restaurants,Italian Restaurants,Take Out Restaurants'),
(140, 'Papa John\'s Pizza', 'pizza place'),
(141, 'Tailgators Sports Grill', 'American Restaurant,Bar,American Restaurant and Bar'),
(142, 'Medway Village Pizza', 'Pizza Place,Restaurants,Pizza'),
(143, 'Casey\'s General Store', 'Grocery Stores,Convenience Stores,Restaurants,Sandwich Shops,Gas Stations,Gas Station,Gas Station, Pizza Place, and Grocery Store,Grocery Store,Pizza Place'),
(144, 'Pizza Chef', 'Florence Restaurants,Pizza Place,Restaurants,Pizza'),
(145, 'Papa Joe\'s Pizza', 'Pizza,Pizza Place,latin american restaurant'),
(146, 'Bagelface Bakery', 'Bagel Shop,Bagel Shop Historic Edgefield,Restaurant'),
(147, 'Old Mill Brewpub', 'Brewery,Pub,Ice Cream & Frozen Desserts,Dessert Restaurants'),
(148, 'Cruise Shop', 'Pizza Place,Grapevine Restaurants'),
(149, 'Suds & Suds', 'Bars Pubs,Bars Clubs,Taverns,Restaurants,Bars & Clubs,Bars & Pubs'),
(150, 'Philtower Building', 'Office and Building Downtown Tulsa,Office and Building'),
(151, 'Ciao Bella', 'Restaurant'),
(152, 'Bay Ridge Eatery', 'Restaurant,Breakfast & Brunch,American Restaurant'),
(153, 'Don Giovanni Ristorante Italiano and Wine Bar', 'Take Out Restaurants,Mediterranean Restaurants,Italian Restaurant Downtown Auburn,Restaurant,Restaurants,Italian Restaurant,Italian Restaurants'),
(154, 'Oscar\'s Woodmont Kitchen', 'Restaurant'),
(155, 'District - San Francisco', 'Restaurant'),
(156, 'Interurban', 'American Restaurant'),
(157, 'Waterfront Restaurant', 'Seafood Restaurant,American Restaurant,Food and Beverage'),
(158, 'Pizza Pizazz', 'Food and Beverage,Federal Way Restaurants,Pizza Place,Pizza,Caterers,Restaurants'),
(159, 'Tomo Steak and Sushi', 'Restaurant'),
(160, 'Victoria\'s Secret Pink', 'Lingerie Store and Women\'s Store'),
(161, 'Baba Louie\'s', 'Pizza Place'),
(162, 'Ayhan\'s Shish Kebab', 'Greek Restaurant,Mediterranean Restaurant,Greek Restaurant and Mediterranean Restaurant'),
(163, 'Bella Via', 'Italian Restaurant,Pizza Place'),
(164, 'Dennisport House of Pizza', 'Restaurant,Restaurants,Italian Restaurants,Pizza,Pizza Place'),
(165, 'Custom Pie', 'Pizza Place,Caterers,Pizza,Restaurants'),
(166, 'Patrizio', 'Italian Restaurant,Italian'),
(167, 'Gluten Free Creations', 'Gluten-free Restaurant and Bakery,Bakeries'),
(168, 'Labella Pizza and Pasta', 'Restaurant,Pizza,Italian Restaurants,Caterers,Take Out Restaurants,Restaurants'),
(169, 'Captains Point', 'American Restaurant'),
(170, 'The Perfect Pizza Company', 'Restaurant,Pizza Place'),
(171, '7 Day 24 Hours Emergency Locks', 'Locks & Locksmiths'),
(172, 'Pancho Mc Gillicuddy\'s Mexican', 'Latin American Restaurants,Restaurants,Mexican Restaurants'),
(173, 'Doughboys', 'Motion Picture Producers & Studios'),
(174, 'Green Garden', 'Korean Restaurants,Korean Restaurant'),
(175, 'Pizza Hut', 'Pizza Place'),
(176, 'Breakside Brewery', 'Brew Pubs,Beer and Ale,Bars,Night Clubs,Restaurants,Liquor Stores,Brewery'),
(177, 'Spinelli\'s Pizza', 'Pizza Place'),
(178, 'Franklin Giant Grinder Shop', 'Sandwich Place,wich Place'),
(179, 'Takka Grill', 'Pizza Place Juniata Park - Feltonville,Pizza Place'),
(180, 'Mamma Lucia', 'Italian Restaurants,Caterers,Pizza,Restaurants,Italian Restaurant'),
(181, 'Il Primo Pizza Wings', 'Take Out Restaurants,Restaurants,Wings Joint,Pizza Place,Pizza,Food and Beverage'),
(182, 'Campania Pizza', 'Pizza Place,Italian Restaurant,Pizza Place and Italian Restaurant'),
(183, 'You-be\'s U-bake Pizza', 'Pizza,Restaurants,Pizza Place'),
(184, 'Solamor Hospice | Denver, Co', 'Hospices'),
(185, 'Pizza Chalet', 'Pizza Place,Buffet,Wings Joint'),
(186, 'Calderone Club', 'Italian Restaurant'),
(187, 'Franky\'s', 'Hot Dog Joint'),
(188, 'Izakaya Bincho', 'Japanese Restaurant South Redondo Beach,Japanese Restaurant'),
(189, 'Giovanni\'s Pizzeria', 'Pizza Place'),
(190, 'Rico\'s Pizza', 'Pizza Place,Restaurant'),
(191, 'Mediterranean Harbour Bar & Grill', 'Mediterranean Restaurant,Seafood Restaurants,Mediterranean Restaurants,Bars,Greek Restaurants,Night Clubs,Taverns,Caterers,Restaurants'),
(192, 'Lucero\'s Pizza', 'Pizza Place,Restaurant,Caterers,Restaurants,Pizza'),
(193, 'Pasta Faire', 'Italian Restaurant'),
(194, 'Roosevelt\'s American Homestyle Deli', 'American Restaurant,wich Place,Diner,Sandwich Place'),
(195, 'Buca Di Beppo', 'Restaurants,Banquet Halls & Reception Facilities,Italian Restaurants,Family Style Restaurants,Pizza'),
(196, 'Olivas\' Mexican Food', 'Restaurant,Take Out Restaurants,Food and Beverage,Restaurants,Mexican Restaurants'),
(197, 'Village Roast Beef & Seafood', 'Sandwich Place'),
(198, 'Stella Notte', 'Banquet Halls & Reception Facilities,Italian Restaurants,Pizza,Caterers,Restaurants'),
(199, 'The Veranda At The Kahala Resort', 'Restaurant'),
(200, 'Nobody\'s Sports Grill and Bbq', 'American Restaurants,Barbecue Restaurants,Bar & Grills,Sports Bars,Take Out Restaurants,Caterers,Restaurants');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(10, 'sneha', 'sneha', 'manohar', 'snehamanohar@gmail.com', '9876543210', '146590c4627abbe4743451e65f78bbaa', 'address', 1, '2024-04-18 03:28:41');

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_orders`
--

INSERT INTO `users_orders` (`o_id`, `u_id`, `title`, `quantity`, `price`, `status`, `date`) VALUES
(29, 10, 'Bianca Pizza', 1, '15.50', 'rejected', '2024-04-18 18:38:58'),
(30, 10, 'Pizza Dough Balls', 1, '7.99', 'closed', '2024-04-19 18:03:07'),
(31, 10, '1 Item Pizza', 1, '7.30', NULL, '2024-04-18 20:22:28');

-- --------------------------------------------------------

--
-- Structure for view `restaurantcustomerinfo`
--
DROP TABLE IF EXISTS `restaurantcustomerinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `restaurantcustomerinfo`  AS SELECT `u`.`PHONE` AS `customer_id`, concat(`u`.`CONTACTFIRSTNAME`,' ',`u`.`CONTACTLASTNAME`) AS `customer_name`, `u`.`PHONE` AS `customer_phone`, `u`.`ADDRESSLINE1` AS `customer_address`, `u`.`CITY` AS `customer_city`, `u`.`STATE` AS `customer_state`, `u`.`POSTALCODE` AS `customer_postalcode`, `r`.`id` AS `restaurant_id`, `r`.`tag` AS `restaurant_tag`, `r`.`categories` AS `restaurant_categories`, `l`.`address` AS `restaurant_address`, `l`.`city` AS `restaurant_city`, `l`.`latitude` AS `restaurant_latitude`, `l`.`longitude` AS `restaurant_longitude`, `l`.`postalCode` AS `restaurant_postalcode` FROM ((`unique_customers` `u` join `restaurants` `r`) join `locations` `l` on((`r`.`id` = `l`.`id`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `LOCATIONS`
--
ALTER TABLE `LOCATIONS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `MENUS`
--
ALTER TABLE `MENUS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `RESTAURANTS`
--
ALTER TABLE `RESTAURANTS`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `LOCATIONS`
--
ALTER TABLE `LOCATIONS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `MENUS`
--
ALTER TABLE `MENUS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `RESTAURANTS`
--
ALTER TABLE `RESTAURANTS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `LOCATIONS`
--
ALTER TABLE `LOCATIONS`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `RESTAURANTS` (`id`);

--
-- Constraints for table `MENUS`
--
ALTER TABLE `MENUS`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `RESTAURANTS` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
