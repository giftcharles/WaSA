-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 04:28 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wasa db`
--

-- --------------------------------------------------------

--
-- Table structure for table `metadata`
--

CREATE TABLE IF NOT EXISTS `metadata` (
  `title` text NOT NULL,
  `visits` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `questions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
`qid` int(11) NOT NULL,
  `question` text NOT NULL,
  `Exercise` int(11) NOT NULL DEFAULT '4',
  `option_1` text NOT NULL,
  `option_2` text NOT NULL,
  `option_3` text NOT NULL,
  `option_4` text,
  `answer` text NOT NULL,
  `grade` varchar(45) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`qid`, `question`, `Exercise`, `option_1`, `option_2`, `option_3`, `option_4`, `answer`, `grade`) VALUES
(6, '<p>When `a != 0`, there are two solutions to `ax^2 + bx + c = 0` and\nthey are</p>', 4, '`x = (-b +- sqrt(b^2-4ac))/(2a) .`', '`x = (-b +- sqrt(b^2-4c))/(2a) .`', '`x = (-b + sqrt(b^2-4ac))/(2a) .`', '`x = (-b +- sqrt(b^2-4a))/(2a) .`', '`x = (-b +- sqrt(b^2-4ac))/(2a) .`', 'seven'),
(14, '`3472+947+34`', 3, '4567', '2342', '4453', '4454', '4453', 'three'),
(15, '`97765-69527`', 4, '28288', '28238', '23436', '55674', '28238', 'two'),
(16, '`654xx43`', 4, '43452', '696', '12312', '28122', '28122', 'three'),
(17, '`240\\divide48`', 1, '2', '24', '5', '8', '5', 'three'),
(18, '`5\\frac{1}{2}-1\\frac{1}{3}`', 2, '`3\\frac{2}{3}`', '`6\\frac{1}{8}`', '`4\\frac{1}{4}`', '`4\\frac{1}{6}`', '`4\\frac{1}{6}`', 'three'),
(19, '`1\\frac{3}{4}+2\\frac{1}{3}`', 3, '`4\\frac{1}{12}`', '`4\\frac{1}{6}`', '`8\\frac{2}{6}`', '`5\\frac{5}{12}`', '`4\\frac{1}{12}`', 'three'),
(20, '`3\\frac{1}{2} xx 1\\frac{1}{2}`', 1, '`4\\frac{1}{4}`', '`2\\frac{1}{8}`', '`5\\frac{1}{4}`', '`2\\frac{1}{6}`', '`5\\frac{1}{4}`', 'three'),
(21, '`3\\frac{3}{4} \\divide 1\\frac{1}{8}`', 3, '`5\\frac{1}{4}`', '`1\\frac{1}{7}`', '`3\\frac{1}{3}`', '`2\\frac{1}{3}`', '`3\\frac{1}{3}`', 'three'),
(22, '`(-10)-(-3)=`', 4, '-13', '-6', '13', '-7', '-7', 'four'),
(23, '`(-3)+(-3)`', 2, '6', '-6', '-9', '-33', '-6', 'four'),
(24, 'Find the square root of `625`', 4, '50', '15', '25', '20', '25', 'five'),
(25, 'Find the square number of `17`', 3, '38', '143', '157', '289', '289', 'four'),
(26, 'Write `1991` in Roman numerals', 4, '''MMXCI''', '''MMCXCI''', '''MCMXCI''', '''MCMCCI''', '''MCMXCI''', 'four'),
(27, 'What is the LCM of `9, 14 and 21`', 1, '25', '125', '37', '126', '126', 'five'),
(28, 'Change `3500\\ meters` into kilometers.', 4, '`7km`', '`3.5km`', '`8.5km`', '`35km`', '`3.5km`', 'four'),
(29, 'Change `2\\frac{1}{2}%` into decimal.', 2, '0.025', '25', '0.25', '0.0025', '0.025', 'four'),
(30, 'Find the missing number in the following series.\n<br>\n<p class="center-align">`1,4,9,16, ......`</p>', 1, '18', '36', '22', '19', '36', 'three'),
(31, 'Given that `6:7 = 18:x`, What is the value of `x`', 4, '`x=21`', '`x=12`', '`x=45`', '`x=34`', '`x=21`', 'five'),
(32, 'Find the value of `M` in the following equation.\n<br>\n\n`7\\frac{1}{4}m=56`', 2, '`m\\=\\28\\frac{1}{2}`', '`m\\=\\7\\frac{23}{27}`', '`m\\=\\4\\frac{2}{27}`', '`m\\=\\7\\frac{23}{29}`', '`m\\=\\7\\frac{23}{29}`', 'six'),
(33, '`1\\frac{1}{4} + 2\\frac{1}{4}`', 4, '`3\\frac{1}{2}`', '`23\\frac{1}{2}`', '`3\\frac{1}{5}`', '`3\\frac{1}{4}`', '`3\\frac{1}{2}`', 'three'),
(34, 'Given that `a=6, \\  b=2, \\ c=1`. Calculate  `(3b+c-1)/(2a)`', 2, '`1/4`', '`3/8`', '`1/2`', '`1/3`', '`1/2`', 'four'),
(35, '`1+1\\frac{1}{2}`', 4, '`2\\frac{1}{2}`', '`\\frac{1}{3}`', '`2\\frac{1}{5}`', '`1\\frac{1}{8}`', '`2\\frac{1}{2}`', 'three'),
(37, 'two numbers have a product of 4320 and a sum of 141.find the two numbers', 4, '45', '96', '', '', '', 'six'),
(38, '(234+123)/25 x36 -23 +12=', 1, '479.08', '473.08', '514.08', '503.08', '479.08', 'four'),
(39, 'one shelf can hold a stack of 50 books.In 2 minutes a man can carry only 5 books for transfer.If so,how many books are left after 6minutes?35', 4, '15', '', '', '', '', 'five'),
(40, '23456 x4567 = ', 4, '43345256', '107123553', '10885652', '88067452', '107123552', 'five'),
(41, '34504 - 456= ', 4, '34048', '', '', '', '', 'two'),
(42, 'A tray holds 34 eggs.12 eggs were sold to Mr.juju on sunday and 7 were eaten on thursday.How many eggs were left on friday?15', 2, '22', '43', '34', '19', '19', 'three'),
(43, 'An ass needs 56 litres of water each week.How many centilitres are needed in four weeks?22400', 1, '33.234', '2.8723', '2240', '2.24', '2.24', 'six'),
(44, '321 + 478= ', 4, '799', '', '', '', '', '0ne'),
(45, 'For a school of 984 students,how many pencils are needed in sum for each student to get 5 pencils?4920', 4, '196.8', '546', '5678', '192.8', '196.8', 'four'),
(46, 'A circle has a radius of x.A triangle of hypotunus y has a height of 4cm and a base of 3cm.If x is twice the value of y,find the area of the circle314', 2, '567', '567', '78.5', '67.8', '567', 'seven'),
(47, '566/2=', 4, '124', '285', '283', '322', '283', 'one'),
(48, '563 soldiers left their home country for a classified trip to Afghanistan.43 felt sick and were sent back home.300 soldiers later died on that mission and the rest returned home victorious.How many soldiers returned home?263', 2, '175', '220', '345', '560', '220', 'seven'),
(49, '678 x 459= ', 1, '311202', '', '', '', '', 'three'),
(50, 'Two bags of rice are produced in an hour,How many can be produced in a day?', 4, '65', '48', '72', '120', '48', 'two'),
(51, 'The cost of buying a tall building is one hundred twenty one million dollars. Write this number in standard form using digits.$121,000,000', 4, '$543,000', '$121,000', '$1,210,000', '$121,000,000,000', '$121,000', 'three'),
(53, 'When you subtract 1,995 from 4,008, the answer is equal to ', 3, '2013', '', '', '', '', 'two'),
(54, 'How many milliliters in one liter? ', 4, '0.1ml', '10dl', '100ml', '1000ml', '1000ml', 'four'),
(55, 'Round 312.92 to the nearest whole number.', 4, '313', '632', '312.9', '312', '313', 'three'),
(56, 'If you add 1,000 to 29,898, you obtain ', 3, '30898', '', '', '', '', 'one'),
(57, 'Convert 5/10 to decimal. ', 1, '0.5', '', '', '', '', 'three'),
(58, 'There are 61 boxes of pencils in a store. There are 14 pencils in each box. How many pencils are in the store?854', 4, '5678', '234', '244', '6344', '6344', 'two'),
(59, 'There are 24 hours in one day, and 3,600 seconds in one hour. How many seconds are in one day? 86400', 4, '456', '2352', '150', '24360', '150', 'three'),
(60, 'Julia read a book in 20 days. She read 16 pages every day for the first 15 days, and 18 pages everyday for the last 5 days. How many pages did Julia read?330', 3, '234', '324', '300', '680', '680', 'five '),
(61, '64 sweets are put in boxes that contain 8 sweets each. How many boxes are needed?8', 4, '6', '6', '4', '502', '6', 'one'),
(62, 'If 6 children share 145 sweets equally, how many sweets will remain?', 3, '1', '3', '24', '1.33', '1', 'one'),
(63, 'Which of these is the same as 8 x 9 ', 2, '2 x 6 x 9', '2 x 4 x 9', '4 x 4 x 9', '3 x 4 x 9', '2 x 4 x 9', 'two'),
(64, 'What is n if 9 x n = 108 ', 3, '12', '16', '35', '24', '12', 'five'),
(65, 'What is the value of (14 + 5) - (5 - 2) ', 4, '24', '22', '12', '16', '16', 'four'),
(66, '2 x (14 + 5) - 7 = ', 1, '31', '24', '24', '31', '31', 'four'),
(67, 'What is the value of 23 - (10 - a) if a = 5?', 3, '18', '', '', '', '', 'three'),
(68, 'If z + y = 20 and y = 5, what is z? ', 4, '15', '', '', '', '', 'one'),
(69, 'What is S if 6 x 4 = 3 x S?', 4, '8', '5', '72', '24', '8', 'two'),
(71, 'List all like terms included in the expression given, x / 5 + x / 7 + 7', 4, 'x/5', 'x/5', '', '', '', 'seven'),
(80, 'Expand (if needed) and simplify the expressions, 3 x + 5x ', 3, '8x', '', '', '', '', 'four'),
(84, 'Factor the expression 3 x + 3 ', 4, '(x +1) ', '3(x +1) ', '6(x +2) ', '(3x +1) ', '3(x +1) ', 'five'),
(85, 'Factor the expression 8 x + 4 ', 2, '4(2x +2)', '4(2x +1)', '2(3x +1)', '4(x +2) ', '4(2x +1) ', 'six'),
(86, 'Factor the expression ax + 3 a ', 3, 'a(2x + 6)', 'a(2x + 3)', 'a(x + 3)', 'a(x + 4)', 'a(x + 3) ', 'six'),
(87, 'Factor the expression (x +1) y + 4 (x + 1) ', 1, '(x +1)(y +4)', '(x +2)(y +7)', '3(x +2)2(y +7)', '(x +2)(y +8)', '(x +1)(y +4)', 'seven'),
(88, 'Factor the expression x + 2 + b x + 2 b ', 4, ' (x +6)(b +2) ', ' (x +3)(b +1) ', ' (x +2)(b +1) ', ' (x +5(b +2) ', ' (x +2)(b +1) ', 'seven'),
(89, 'Solve the given equation and check your answer. `x + 5 = 8` ', 4, '5', '6', '1/2', '3', '3', 'three'),
(90, 'Solve the given equation and check your answer. 2 x = 4 ', 2, '7', '3', '2', '3', '2', 'four'),
(91, 'Solve the given equation and check your answer. x / 3 = 2 ', 4, '6', '8', '5', '3', '6', 'five'),
(92, 'Solve the given equation and check your answer. 0.2 x = 1 ', 4, '7', '4', '5', '8', '5', 'six'),
(98, 'Two thirds of students in a class study math and the remaining eight students do not study math. What is the total number of students in this class?24', 4, '12', '12', '16', '18', '12', 'seven'),
(100, 'Evaluate the expression. 2^3 + 3^2 ', 4, '17', '17', '12', '72', '17', 'six'),
(101, 'Evaluate the expression. 0.1^3 ', 3, '0.001', '0.001', '0.0001', '0.3', '0.001', 'seven'),
(102, 'Evaluate the expression. 6 ? (2 / 3)', 1, '4', '4', '12', '24', '4', 'five'),
(104, 'Solve the proportion : a / 3 = 5 / 18 ', 3, 'a=5/6', 'a=5/6', 'a=6/5', 'a=240', 'a=5/6', 'six'),
(105, 'Which of the following ordered pairs is a solution to the equation 2 x + 3y = 8? (4 , 0)', 1, '(4 , 1)', '(3 , 3)', '(1 , 3)', '(0 , 0) ', '(4 , 1)', 'four'),
(109, 'Find the greatest common factor of 6 and 3 ', 4, '13', '63', '6', '3', '3', 'four'),
(110, 'Find the greatest common factor of 18 and 24 ', 2, '12', '13', '6', '48', '6', 'four'),
(111, 'Find the greatest common factor of 50 and 60 ', 2, '23', '122', '3000', '10', '10', 'four'),
(112, 'Write the number " Six hundred seventy-two million two hundred fifty-nine using digits. ', 4, '234236', '2353473', '672259', '67200259', '672000259', 'four'),
(114, 'Find the lowest common multiple of 2 and 3 ', 3, '2', '4', '6', '3', '6', 'five'),
(115, 'Find the lowest common multiple of7 and 14 ', 4, '62', '21', '14', '7', '14', 'five'),
(116, 'Find the lowest common multiple of25 and 15 ', 4, '323', '12', '75', '15', '75', 'five'),
(117, 'Add and / or subtract and simplify, 1 / 3 + 2 / 3 ', 2, '1', '', '', '', '', 'six'),
(118, 'Add and / or subtract and simplify, 2/5 - 1 / 7 ', 4, '9/35', '', '', '', '', 'seven'),
(119, 'What is 2 / 3 of 21? ', 4, '14', '16', '7', '63', '14', 'three'),
(120, 'What is 40% of 1 / 4? ', 1, '1/10', '1/15', '10', '100', '1/10', 'six'),
(121, 'What is 20% of 50%? ', 4, '1/12', '1/10', '0.001', '1000', '1/10', 'seven'),
(122, 'How many seconds are there in one hour?', 2, '6542', '3600', '60', '360', '3600', 'three'),
(123, 'How many minutes are there in the month of January? ', 3, '76642', '44640', '74400', '18600', '44640', 'five'),
(124, '222-2', 2, '234', '220', '123', '56', '220', 'two'),
(127, 'kklmfsd', 4, 'sdfsd', '', '', '', 'NaN', ''),
(128, '`567+281=`', 4, '848', '433', '532', '76', '848', 'six');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`sid` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `class` varchar(45) NOT NULL,
  `password` text NOT NULL,
  `username` varchar(45) NOT NULL,
  `birthdate` date NOT NULL,
  `group` varchar(11) NOT NULL DEFAULT 'student',
  `joinDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `score` int(11) NOT NULL,
  `wrongs` int(11) NOT NULL,
  `corrects` int(11) NOT NULL,
  `answered` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=109 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sid`, `firstName`, `surname`, `class`, `password`, `username`, `birthdate`, `group`, `joinDate`, `score`, `wrongs`, `corrects`, `answered`) VALUES
(5, 'gift', 'charles', 'seven', 'charles', 'gift', '1995-12-06', 'student', '2019-05-15 16:17:42', 700, 139, 140, 279),
(6, 'Faustin', 'Nazareno', '', 'mwalimu', 'Faustin43', '2019-05-13', 'teacher', '2019-05-15 16:17:42', 470, 47, 94, 141),
(8, 'musa', 'mtuli', '', '12345', 'mtulima', '2019-05-13', 'teacher', '2019-05-15 16:17:42', 0, 0, 0, 0),
(9, 'samsom', 'nathanael', '', '12345', 'punda32', '2019-05-12', 'teacher', '2019-05-15 16:17:42', 0, 0, 0, 0),
(10, 'costa', 'kalima mihogo', '', '12345', 'costa434', '2019-05-08', 'teacher', '2019-05-15 16:17:42', 0, 0, 0, 0),
(11, 'mary', 'mwiko', '', '12345', 'kijikoEdina', '2019-05-01', 'teacher', '2019-05-15 16:17:42', 0, 0, 0, 0),
(12, 'edinah', 'kijiko', '', '123445', 'kijikoedina', '1990-05-08', 'teacher', '2019-05-15 16:17:42', 0, 0, 0, 0),
(13, 'Bless', 'lilian', '', '12345', 'lilian465', '1998-08-05', 'teacher', '2019-05-15 16:17:42', 0, 0, 0, 0),
(14, 'Bless', 'Kayeke', 'three', '12345', 'Kayeke915', '1998-08-05', 'student', '2019-05-15 16:17:42', 833, 784, 1020, 198),
(15, 'hamisi', 'Mohammed', 'three', '12345', 'Mohammed534', '1998-08-05', 'student', '2019-05-15 16:17:42', 428, 567, 540, 261),
(16, 'Grace', 'Cecilia', 'five', '12345', 'Cecilia260', '1998-08-05', 'student', '2019-05-15 16:17:42', 476, 837, 611, 450),
(17, 'Ezena', 'Thomas', '', '12345', 'Thomas987', '1998-08-05', 'teacher', '2019-05-15 16:17:42', 0, 0, 0, 0),
(18, 'hamisi', 'Philip', 'two', '12345', 'Philip620', '1998-08-05', 'student', '2019-05-15 16:17:42', 669, 260, 1360, 290),
(19, 'Philip', 'Junior', 'three', '12345', 'Junior456', '1998-08-05', 'student', '2019-05-15 16:17:42', 152, 432, 1282, 426),
(20, 'Alvin', 'Ezena', 'five', '12345', 'Ezena840', '1998-08-05', 'student', '2019-05-15 16:17:42', 504, 163, 741, 372),
(21, 'Asimwe', 'Agustino', 'three', '12345', 'Agustino927', '1998-08-05', 'student', '2019-05-15 16:17:42', 584, 994, 1178, 230),
(22, 'Theodor', 'Mohammed', 'five', '12345', 'Mohammed920', '1998-08-05', 'student', '2019-05-15 16:17:42', 911, 482, 975, 39),
(23, 'Nkumuke', 'hamisi', '', '12345', 'hamisi849', '1998-08-05', 'teacher', '2019-05-15 16:17:42', 0, 0, 0, 0),
(24, 'hamisi', 'Mweusi', 'four', '12345', 'Mweusi860', '1998-08-05', 'student', '2019-05-15 16:17:42', 697, 534, 775, 177),
(25, 'Grace', 'Asimwe', 'one', '12345', 'Asimwe258', '1998-08-05', 'student', '2019-05-15 16:17:42', 645, 563, 1473, 68),
(26, 'hamisi', 'David', 'one', '12345', 'David484', '1998-08-05', 'student', '2019-05-15 16:17:42', 952, 130, 446, 284),
(27, 'Asimwe', 'Thomas', '', '12345', 'Thomas364', '1998-08-05', 'teacher', '2019-05-15 16:17:42', 0, 0, 0, 0),
(28, 'Bless', 'Fatuma', 'three', '12345', 'Fatuma179', '1998-08-05', 'student', '2019-05-15 16:17:42', 523, 855, 1161, 385),
(29, 'Philip', 'Agustino', 'five', '12345', 'Agustino221', '1998-08-05', 'student', '2019-05-15 16:17:42', 294, 516, 1285, 284),
(30, 'Nkumuke', 'Mary', 'one', '12345', 'Mary749', '1998-08-05', 'student', '2019-05-15 16:17:42', 592, 575, 1421, 275),
(31, 'Alvin', 'Halima', 'four', '12345', 'Halima847', '1998-08-05', 'student', '2019-05-15 16:17:42', 916, 997, 1096, 292),
(32, 'Asimwe', 'Madungu', '', '12345', 'Madungu145', '1998-08-05', 'teacher', '2019-05-15 16:17:42', 0, 0, 0, 0),
(33, 'Bless', 'Halima', 'four', '12345', 'Halima639', '1998-08-05', 'student', '2019-05-15 16:17:42', 234, 534, 1250, 165),
(34, 'Asimwe', 'Diana', 'three', '12345', 'Diana464', '1998-08-05', 'student', '2019-05-15 16:17:42', 599, 447, 1317, 320),
(35, 'Philip', 'lilian', 'one', '12345', 'lilian118', '1998-08-05', 'student', '2019-05-15 16:17:42', 505, 186, 867, 146),
(36, 'Asimwe', 'Elibariki', 'one', '12345', 'Elibariki192', '1998-08-05', 'student', '2019-05-15 16:17:42', 154, 498, 871, 258),
(37, 'hamisi', 'Alvin', 'one', '12345', 'Alvin126', '1998-08-05', 'student', '2019-05-15 16:17:42', 734, 352, 124, 204),
(38, 'Ezena', 'MwajumaSara', 'four', '12345', 'MwajumaSara773', '1998-08-05', 'student', '2019-05-15 16:17:42', 609, 325, 1274, 194),
(39, 'Ezena', 'Philip', 'two', '12345', 'Philip568', '1998-08-05', 'student', '2019-05-15 16:17:42', 932, 527, 459, 185),
(40, 'Halima', 'Philip', 'four', '12345', 'Philip835', '1998-08-05', 'student', '2019-05-15 16:17:42', 421, 979, 552, 153),
(41, 'Ezena', 'Chris', 'one', '12345', 'Chris591', '1998-08-05', 'student', '2019-05-15 16:17:42', 616, 481, 220, 491),
(42, 'samson', 'Philip', 'one', '12345', 'Philip324', '1998-08-05', 'student', '2019-05-15 16:17:42', 971, 202, 1055, 93),
(43, 'samson', 'Linda', 'five', '12345', 'Linda753', '1998-08-05', 'student', '2019-05-15 16:17:42', 533, 412, 230, 293),
(44, 'Chris', 'musa', 'five', '12345', 'musa642', '1998-08-05', 'student', '2019-05-15 16:17:42', 437, 188, 1475, 223),
(45, 'Ezena', 'Bless', 'two', '12345', 'Bless741', '1998-08-05', 'student', '2019-05-15 16:17:42', 168, 960, 1394, 425),
(46, 'hamisi', 'musa', 'two', '12345', 'musa924', '1998-08-05', 'student', '2019-05-15 16:17:42', 540, 879, 617, 238),
(47, 'Linda', 'Bless', 'four', '12345', 'Bless336', '1998-08-05', 'student', '2019-05-15 16:17:42', 141, 876, 428, 18),
(48, 'Chris', 'MwajumaSara', 'two', '12345', 'MwajumaSara981', '1998-08-05', 'student', '2019-05-15 16:17:42', 702, 790, 558, 81),
(49, 'samson', 'Elibariki', 'three', '12345', 'Elibariki491', '1998-08-05', 'student', '2019-05-15 16:17:42', 985, 105, 119, 408),
(50, 'Philip', 'Chris', 'six', '12345', 'Chris649', '1998-08-05', 'student', '2019-05-15 16:17:42', 962, 594, 1055, 160),
(51, 'Linda', 'Mohammed', 'three', '12345', 'Mohammed277', '1998-08-05', 'student', '2019-05-15 16:17:42', 381, 752, 911, 488),
(52, 'samson', 'Asimwe', 'three', '12345', 'Asimwe503', '1998-08-05', 'student', '2019-05-15 16:17:42', 363, 500, 658, 22),
(53, 'Bless', 'Junior', 'three', '12345', 'Junior109', '1998-08-05', 'student', '2019-05-15 16:17:42', 400, 652, 601, 142),
(54, 'Mary', 'Grace', 'one', '12345', 'Grace630', '1998-08-05', 'student', '2019-05-15 16:17:42', 985, 641, 597, 297),
(55, 'samson', 'Grace', 'six', '12345', 'Grace506', '1998-08-05', 'student', '2019-05-15 16:17:42', 739, 863, 1095, 25),
(56, 'Theodor', 'Junior', 'three', '12345', 'Junior864', '1998-08-05', 'student', '2019-05-15 16:17:42', 364, 172, 556, 207),
(57, 'Linda', 'Nolasco', 'one', '12345', 'Nolasco296', '1998-08-05', 'student', '2019-05-15 16:17:42', 221, 410, 1282, 127),
(58, 'Madungu', 'lilian', 'five', '12345', 'lilian809', '1998-08-05', 'student', '2019-05-15 16:17:42', 215, 440, 238, 241),
(59, 'Alvin', 'Diana', 'four', '12345', 'Diana541', '1998-08-05', 'student', '2019-05-15 16:17:42', 539, 424, 217, 54),
(60, 'Chris', 'Junior', 'three', '12345', 'Junior312', '1998-08-05', 'student', '2019-05-15 16:17:42', 613, 464, 324, 494),
(61, 'Nkumuke', 'Cecilia', 'six', '12345', 'Cecilia730', '1998-08-05', 'student', '2019-05-15 16:17:42', 991, 700, 833, 180),
(62, 'Asimwe', 'Theodor', 'three', '12345', 'Theodor780', '1998-08-05', 'student', '2019-05-15 16:17:42', 889, 709, 694, 292),
(63, 'Bless', 'Fatuma', 'five', '12345', 'Fatuma495', '1998-08-05', 'student', '2019-05-15 16:17:42', 923, 673, 316, 488),
(64, 'Chris', 'MwajumaSara', 'one', '12345', 'MwajumaSara247', '1998-08-05', 'student', '2019-05-15 16:17:42', 345, 163, 1229, 410),
(65, 'Ezena', 'MwajumaSara', 'six', '12345', 'MwajumaSara776', '1998-08-05', 'student', '2019-05-15 16:17:42', 969, 288, 810, 242),
(66, 'Philip', 'Junior', 'four', '12345', 'Junior350', '1998-08-05', 'student', '2019-05-15 16:17:42', 107, 368, 286, 288),
(67, 'Alvin', 'Diana', 'five', '12345', 'Diana613', '1998-08-05', 'student', '2019-05-15 16:17:42', 209, 482, 1076, 325),
(68, 'Bless', 'Fatuma', 'four', '12345', 'Fatuma125', '1998-08-05', 'student', '2019-05-15 16:17:42', 185, 606, 168, 224),
(69, 'hamisi', 'Philip', 'four', '12345', 'Philip700', '1998-08-05', 'student', '2019-05-15 16:17:42', 917, 730, 916, 16),
(70, 'hamisi', 'Philip', 'six', '12345', 'Philip156', '1998-08-05', 'student', '2019-05-15 16:17:42', 556, 817, 472, 116),
(71, 'Chris', 'Junior', 'six', '12345', 'Junior288', '1998-08-05', 'student', '2019-05-15 16:17:42', 592, 692, 1370, 470),
(72, 'Linda', 'Bless', 'five', '12345', 'Bless839', '1998-08-05', 'student', '2019-05-15 16:17:42', 550, 951, 440, 490),
(73, 'Chris', 'musa', 'five', '12345', 'musa263', '1998-08-05', 'student', '2019-05-15 16:17:42', 379, 536, 1059, 482),
(74, 'hamisi', 'David', 'two', '12345', 'David593', '1998-08-05', 'student', '2019-05-15 16:17:42', 127, 397, 1178, 454),
(75, 'Bless', 'Halima', 'six', '12345', 'Halima663', '1998-08-05', 'student', '2019-05-15 16:17:42', 346, 747, 462, 451),
(76, 'Linda', 'Mohammed', 'one', '12345', 'Mohammed283', '1998-08-05', 'student', '2019-05-15 16:17:42', 856, 485, 1200, 288),
(77, 'hamisi', 'musa', 'two', '12345', 'musa709', '1998-08-05', 'student', '2019-05-15 16:17:42', 791, 943, 672, 57),
(78, 'hamisi', 'musa', 'six', '12345', 'musa515', '1998-08-05', 'student', '2019-05-15 16:17:42', 292, 703, 761, 301),
(79, 'Bless', 'Kayeke', 'one', '12345', 'Kayeke793', '1998-08-05', 'student', '2019-05-15 16:17:42', 308, 579, 862, 78),
(80, 'hamisi', 'Alvin', 'six', '12345', 'Alvin179', '1998-08-05', 'student', '2019-05-15 16:17:42', 693, 126, 1385, 327),
(81, 'hamisi', 'Mohammed', 'five', '12345', 'Mohammed640', '1998-08-05', 'student', '2019-05-15 16:17:42', 811, 996, 329, 325),
(82, 'samson', 'Philip', 'six', '12345', 'Philip157', '1998-08-05', 'student', '2019-05-15 16:17:42', 387, 234, 1042, 427),
(83, 'Alvin', 'Halima', 'one', '12345', 'Halima937', '1998-08-05', 'student', '2019-05-15 16:17:42', 569, 722, 523, 203),
(84, 'Bless', 'Kayeke', 'three', '12345', 'Kayeke562', '1998-08-05', 'student', '2019-05-15 16:17:42', 802, 808, 328, 52),
(85, 'Ezena', 'Bless', 'four', '12345', 'Bless149', '1998-08-05', 'student', '2019-05-15 16:17:42', 162, 449, 449, 371),
(86, 'Philip', 'Agustino', 'six', '12345', 'Agustino151', '1998-08-05', 'student', '2019-05-15 16:17:42', 148, 503, 908, 175),
(87, 'Madungu', 'lilian', 'five', '12345', 'lilian205', '1998-08-05', 'student', '2019-05-15 16:17:42', 286, 589, 1428, 339),
(88, 'hamisi', 'David', 'four', '12345', 'David868', '1998-08-05', 'student', '2019-05-15 16:17:42', 100, 506, 144, 453),
(89, 'Bless', 'Halima', 'five', '12345', 'Halima433', '1998-08-05', 'student', '2019-05-15 16:17:42', 540, 139, 866, 241),
(90, 'Bless', 'lilian', 'three', '12345', 'lilian817', '1998-08-05', 'student', '2019-05-15 16:17:42', 667, 921, 151, 363),
(91, 'hamisi', 'Mweusi', 'five', '12345', 'Mweusi581', '1998-08-05', 'student', '2019-05-15 16:17:42', 619, 919, 712, 420),
(92, 'Philip', 'Chris', 'six', '12345', 'Chris646', '1998-08-05', 'student', '2019-05-15 16:17:42', 393, 908, 673, 351),
(93, 'hamisi', 'Mweusi', 'six', '12345', 'Mweusi303', '1998-08-05', 'student', '2019-05-15 16:17:42', 755, 758, 104, 190),
(94, 'Ezena', 'Philip', 'two', '12345', 'Philip581', '1998-08-05', 'student', '2019-05-15 16:17:42', 338, 153, 900, 446),
(95, 'samson', 'Elibariki', 'four', '12345', 'Elibariki466', '1998-08-05', 'student', '2019-05-15 16:17:42', 645, 132, 923, 355),
(96, 'Ezena', 'Chris', 'four', '12345', 'Chris734', '1998-08-05', 'student', '2019-05-15 16:17:42', 439, 804, 181, 471),
(97, 'Bless', 'lilian', 'four', '12345', 'lilian822', '1998-08-05', 'student', '2019-05-15 16:17:42', 389, 720, 552, 401),
(98, 'hamisi', 'Mohammed', 'five', '12345', 'Mohammed486', '1998-08-05', 'student', '2019-05-15 16:17:42', 381, 876, 225, 239),
(99, 'hamisi', 'Alvin', 'five', '12345', 'Alvin195', '1998-08-05', 'student', '2019-05-15 16:17:42', 654, 365, 147, 25),
(100, 'Ezena', 'Thomas', 'one', '12345', 'Thomas137', '1998-08-05', 'student', '2019-05-15 16:17:42', 525, 270, 656, 488),
(101, 'samson', 'Grace', 'six', '12345', 'Grace400', '1998-08-05', 'student', '2019-05-15 16:17:42', 233, 666, 165, 10),
(102, 'Alvin', 'Ezena', 'three', '12345', 'Ezena524', '1998-08-05', 'student', '2019-05-15 16:17:42', 831, 520, 395, 75),
(103, 'Philip', 'lilian', 'two', '12345', 'lilian894', '1998-08-05', 'student', '2019-05-15 16:17:42', 935, 713, 1015, 313),
(104, 'samson', 'Linda', 'one', '12345', 'Linda737', '1998-08-05', 'student', '2019-05-15 16:17:42', 470, 565, 973, 475),
(105, 'Bless', 'Junior', 'four', '12345', 'Junior353', '1998-08-05', 'student', '2019-05-15 16:17:42', 76, 421, 185, 471),
(106, 'Bless', 'Junior', 'six', '12345', 'Junior294', '1998-08-05', 'student', '2019-05-15 16:17:42', 94, 428, 1026, 135),
(107, 'Linda', 'Nolasco', 'two', '12345', 'Nolasco429', '1998-08-05', 'student', '2019-05-15 16:17:42', 171, 149, 812, 267),
(108, 'samson', 'Asimwe', 'six', '12345', 'Asimwe378', '1998-08-05', 'student', '2019-05-15 16:17:42', 276, 649, 992, 333);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
 ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=109;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
