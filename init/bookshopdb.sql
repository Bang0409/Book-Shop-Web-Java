CREATE DATABASE  IF NOT EXISTS `bookshopdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookshopdb`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookshopdb
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cart_user` (`userId`),
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,4,'2021-12-30 15:39:19',NULL),(2,5,'2021-12-18 20:35:59',NULL),(11,13,'2025-05-31 18:32:40',NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cartId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `quantity` smallint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cartId_productId` (`cartId`,`productId`),
  KEY `idx_cart_item_cart` (`cartId`),
  KEY `idx_cart_item_product` (`productId`),
  CONSTRAINT `fk_cart_item_cart` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_item_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `imageName` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Sách giáo khoa',NULL,'img-704920945265990681.jpg'),(2,'Sách khoa học',NULL,'img-5123100454264636507.jpg'),(3,'Truyện tranh',NULL,'img-11666011691329895901.jpg'),(4,'Tiểu thuyết',NULL,'img-974170892321451528.jpg'),(7,'Sách giáo trình',NULL,'img-4182422781693146081.jpg'),(11,'Sách nấu ăn',NULL,'img-8174715805536005482.jpg'),(14,'Sách thiếu nhi',NULL,'img-1682987619963774237.jpg'),(15,'Sách kỹ năng sống','Để rèn luyện tâm hồn trong những việc lớn lao, cho chính những người tạo ra những việc lớn lao.','img-14185932799109416685.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `quantity` smallint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_item_orders` (`orderId`),
  KEY `idx_order_item_product` (`productId`),
  CONSTRAINT `fk_order_item_orders` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_item_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (67,31,102,65000,10,6,'2025-05-31 01:52:49',NULL),(68,32,123,72000,10,4,'2025-05-31 01:59:52',NULL),(69,33,108,255000,10,2,'2025-05-31 17:56:13',NULL),(70,34,103,50000,15,1,'2025-05-31 18:37:32',NULL),(71,34,127,115000,0,2,'2025-05-31 18:37:32',NULL);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `status` tinyint NOT NULL,
  `deliveryMethod` tinyint NOT NULL,
  `deliveryPrice` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_orders_user` (`userId`),
  CONSTRAINT `fk_orders_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (31,13,2,1,15000,'2025-05-31 01:52:49','2025-05-31 01:53:08'),(32,18,2,1,15000,'2025-05-31 01:59:52','2025-05-31 02:00:02'),(33,13,2,2,50000,'2025-05-31 17:56:13','2025-05-31 17:56:32'),(34,19,2,1,15000,'2025-05-31 18:37:32','2025-05-31 18:37:57');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `quantity` smallint NOT NULL,
  `totalBuy` smallint NOT NULL,
  `author` varchar(50) NOT NULL,
  `pages` smallint NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `yearPublishing` year NOT NULL,
  `description` text,
  `imageName` varchar(35) DEFAULT NULL,
  `shop` bit(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `startsAt` datetime DEFAULT NULL,
  `endsAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (101,'Phép mầu tuổi thơ - Nếu tớ biến thành người lớn thì sao?',50000,20,19,3,'Châu Phạm',40,'Kim Đồng',2022,'Bộ sách Phép mầu tuổi thơ kể về sự khác biệt giữa thế giới của người lớn và trẻ con qua mắt nhìn thơ ngây và đầy hóm hỉnh của một em bé.\r\n\r\nMời bạn tìm đọc bộ sách:\r\n\r\nPhép Mầu Tuổi Thơ - Có Phải Người Lớn Từng Là Trẻ Con?\r\n\r\nPhép Mầu Tuổi Thơ - Nếu Tớ Biến Thành Người Lớn Thì Sao?','img-12750423401679770666.jpg',_binary '','2025-05-31 00:36:44',NULL,'2025-05-30 00:36:00','2025-06-15 00:36:00'),(102,'Mùa ong khoái',65000,10,555,48,'Lai Vĩnh Toàn',32,'Kim Đồng',2024,'Hòa mình vào không gian rừng U Minh kì vĩ.\r\n\r\nTham dự cuộc hành trình sống động tìm nguồn mật.\r\n\r\nGặp gỡ những bầy ong Khoái, loài ong khổng lồ đã tặng cho con người bao tàng mật ngọt thấm đượm hương rừng.','img-11892606227196802672.jpg',_binary '','2025-05-31 00:38:46',NULL,'2025-05-13 00:38:00','2025-05-11 00:38:00'),(103,'Thế giới của thỏ Peter - Trò chơi trốn tìm',50000,15,98,42,'Rachel Bright',32,'Kim Đồng',2025,'Bạn bè của Peter đang bị lão Cáo lén lút rình mò… Để giúp đỡ bạn, thỏ Peter đã có một ý tưởng tuyệt vời để qua mặt lão với một phát minh siêu tài tình. Liệu phát minh của Peter có giúp được nó và bạn bè? Hay trò chơi trốn-tìm sẽ trở thành đuổi-nhảy đây? Hãy cùng theo dõi câu chuyện thú vị này nhé!\r\n\r\n---\r\n\r\nBộ sách kể về 3 cuộc phiêu lưu mới toanh với những sáng kiến tài tình, những lần chạy thoát đầy táo bạo, cộng thêm đôi chút tinh quái của chú thỏ thông minh mà ai cũng yêu mến – thỏ Peter!\r\n\r\nĐược truyền cảm hứng từ những nhân vật trong bộ sách kinh điển “Thế giới của thỏ Peter” của Beatrix Potter, 3 cuốn sách tranh vừa được ra mắt do 2 tác giả Rachel Bright và Nicola Kinnear mang tới không khí vui nhộn, dễ thương và tươi mới dành riêng cho các bạn đọc lứa tuổi mẫu giáo.','img-11473983828728503628.jpg',_binary '','2025-05-31 00:40:12',NULL,'2025-05-23 00:40:00','2025-07-25 00:40:00'),(104,'Đại gia đình cá voi đêm bão',52000,0,181,17,'Benji Davies',32,'Kim Đồng',2022,'Bà của Nim ghé thăm bố con cậu vào đúng một ngày bão.\r\n\r\nNim không tài nào ngủ được nên bà bèn kể chuyện để dỗ cậu yên giấc.\r\n\r\nĐó là câu chuyện về một cô bé kết bạn với một chú cá voi. Tình bạn bền chặt của cả hai đã tiếp nối tới các thế hệ sau một cách kì diệu.\r\n\r\nBộ sách tranh “Cá voi đêm bão” đã trở lại với các bạn đọc bằng một cuộc phiêu lưu mới đáng nhớ!\r\n\r\n---\r\n\r\nBộ sách “Cá voi đêm bão” bao gồm các tác phẩm của tác giả Benji Davies đã giành được những giải thưởng văn chương thiếu nhi danh giá. Bộ sách gồm những câu chuyện cảm động và đầy ý nghĩa về tình cảm gia đình, tình yêu thiên nhiên… được thể hiện bằng màu sắc và đường nét tuyệt đẹp, có sức lay động mọi trẻ em trên toàn thế giới.\r\n\r\nỞ phiên bản mới này, boxset bổ sung cuốn sách mới “Đại gia đình cá voi đêm bão” và thay đổi hình thức bìa boxset và bìa cuốn truyện “Cá voi đêm bão” theo phiên bản đặc biệt kỉ niệm 10 năm phát hành tác phẩm này.','img-5410322262384536189.jpg',_binary '','2025-05-31 00:41:26',NULL,'2025-04-28 00:41:00','2025-06-21 00:41:00'),(105,'Tranh truyện lịch sử Việt Nam - Yết Kiêu - Dã Tượng',22000,7,45,12,'Hà Ân',35,'Kim Đồng',2025,'Yết Kiêu - Dã Tượng là câu chuyện của hai vị tướng giỏi đời Trần, dưới trướng của vị Quốc công Tiết chế tài ba, lỗi lạc. Một người giỏi bơi lặn, người kia giỏi thuần dưỡng voi rừng. Khi giặc Mông Nguyên tràn sang bờ cõi nước ta, hết lần này đến lần khác, họ đã dũng cảm xông vào hang ổ kẻ thù khiến chúng không chỉ thua đau mà còn phải nể phục người tài nước Việt...\r\n\r\nTủ sách \"Tranh truyện lịch sử Việt Nam\" dành cho lứa tuổi thiếu niên nhi đồng được NXB Kim Đồng xây dựng xuất phát từ mong muốn giúp các em nhỏ bước đầu làm quen với lịch sử, tiếp nhận một lượng kiến thức cơ bản về lịch sử nước nhà thông qua những câu chuyện về các danh nhân được thể hiện bằng các trang sách màu.\r\n\r\nMỗi nhân vật trong bộ truyện tranh lịch sử xuất hiện là một câu chuyện giàu tính văn học, mang hơi hướng dân gian nhẹ nhàng và gần gũi. Lời thoại trong truyện cũng rất đơn giản, không đặt nặng về tư liệu nhưng vẫn luôn tôn trọng tính xác thực của lịch sử, góp phần bồi đắp tình yêu của thiếu nhi với lịch sử, với dân tộc.','img-10558671922488323682.jpg',_binary '','2025-05-31 00:42:42',NULL,'2025-05-01 00:42:00','2025-06-08 00:42:00'),(106,'Tô điểm thiên nhiên - Sách tô màu và kiến thức khoa học - Rừng mưa nhiệt đới',40000,0,190,11,'Jenny Cooper',40,'Kim Đồng',2017,'Không chỉ là tô màu, các bạn sẽ thấy ngạc nhiên thú vị vô cùng với những kiến thức trong cuốn sách này đây!','img-6216466546783286055.jpg',_binary '','2025-05-31 00:44:25',NULL,'2025-05-08 00:44:00','2025-06-20 00:44:00'),(107,'Thế Hệ Lo Âu',164000,10,99,10,'Jonathan Haidt',439,'Công Thương',2025,'Thế Hệ Lo Âu\r\n\r\nNgành công nghệ không chỉ thay đổi cuộc sống của người lớn. Nó cũng bắt đầu thay đổi cuộc sống của trẻ em. Từ những năm 1950, thiếu nhi và thanh thiếu niên đã xem truyền hình rất nhiều, nhưng các công nghệ mới có tính di động, cá nhân hóa và thú vị hơn những thứ trước đây. Nhiều phụ huynh cảm thấy nhẹ nhõm khi thấy một chiếc điện thoại thông minh hoặc máy tính bảng có thể thu hút sự chú ý của bọn trẻ và khiến chúng yên lặng vài giờ. Nhưng điều này có an toàn không?\r\n\r\nSau hơn một thập kỷ ổn định hoặc cải thiện, sức khỏe tâm thần của thanh thiếu niên đã lao dốc vào đầu những năm 2010. Tỷ lệ trầm cảm, lo âu, tăng đột biến, thậm chí tăng gấp đôi so với thời gian gần đây. Tại sao?\r\n\r\nTrong cuốn sách này, nhà tâm lý học xã hội Jonathan Haidt lập luận rằng sự suy giảm các hoạt động chơi tự do trong thời thơ ấu và sự gia tăng việc sử dụng điện thoại thông minh ở thanh thiếu niên chính là hai nguyên nhân chính gây ra căng thẳng tâm lý ngày càng tăng ở giới trẻ, đặc biệt ảnh hưởng đến Thế hệ Z (những người sinh năm 1995 trở về sau).\r\n','img-13834891648928742715.jpg',_binary '','2025-05-31 00:47:26','2025-05-31 01:43:22','2025-04-03 00:46:00','2025-08-08 00:46:00'),(108,'Luật Tâm Thức - Vũ Trụ Nhất Nguyên Luận',255000,10,2150,555,'Ngô Sa Thạch',480,'Lao Động',2024,'Luật Tâm Thức - Vũ Trụ Nhất Nguyên Luận\r\n\r\nHãy hiểu luật tâm thức để thực sự thức tỉnh trong “thời đại tỉnh thức”.\r\n\r\nCon người, dù là theo phái duy vật hay duy tâm, ăn chay hay ăn mặn, có tìm hiểu tâm linh hay không,... thì điều cuối cùng chúng ta hướng đến vẫn giống nhau - hạnh phúc, viên mãn, không đói khổ. Vậy nên có thể nói cuộc sống là một cuộc truy cầu hạnh phúc. Nhưng không phải ai cũng có một hành trình thuận lợi, có thể đến đích an toàn, thậm chí rất nhiều người đã gục ngã thê thảm, vì đa phần không vượt qua được những trở ngại tâm thức, cũng là bài học lớn nhất trong cuộc đời.\r\n\r\nTiếp nối những kiến thức từ cuốn sách đầu tiên, tác giả Ngô Sa Thạch mang đến “Luật Tâm Thức - Vũ trụ nhất nguyên luận”, bản nâng cấp với nhiều kiến giải sâu sắc hơn về quy luật vũ trụ và số mệnh con người:\r\n\r\n- Nguồn gốc của vũ trụ, những quy luật tự nhiên chi phối sự hình thành của mọi vật, từ đó cho thấy sự tương đồng kỳ diệu giữa vạn vật trong vũ trụ.\r\n\r\n- Giải thích những hiện tượng tâm linh như quy hồi tiền kiếp, tiên đoán sự kiện, du hành thời gian,... dưới góc nhìn năng lượng.','img-2888019092436077804.jpg',_binary '','2025-05-31 00:50:17',NULL,'2025-05-09 00:49:00','2025-08-07 00:49:00'),(109,'Món Quà Của Linh Hồn - Sức Mạnh Chữa Lành Của Những Thử Thách Trong Cuộc Sống',231000,0,199,54,'Robert Schwartz',728,'NXB Hà Nội',2021,'Dù con đường của bạn có bằng phẳng hay gập ghềnh, dù cuộc đời của bạn có êm ả hay thăng trầm, thì có thể bạn đã biết chắc điều này: bạn là một trong những linh hồn can đảm nhất trong Vũ trụ. Nếu không thì bây giờ bạn đã không ở đây. Bạn quyết định đầu thai, bạn sẵn sàng đồng ý thực hiện một chuyến đi mà linh hồn đã lên kế hoạch, đó chính là một hành động vô cùng dũng cảm. Bạn tìm kiếm ý nghĩa sâu xa của hành trình này, đó là một hành động vô cùng dũng cảm khác. Và quyết định chữa lành lại là một hành động dũng cảm khác nữa. Bạn được vinh danh và được tôn kính.\r\nBạn cũng có thể chắc chắn về điều này: bạn đang chữa lành. Bạn chữa lành khi hiểu ra rằng có một ý nghĩa sâu xa trong những trải nghiệm của mình. Khi bạn nhận ra nó, bạn giải phóng mình thoát khỏi xu hướng coi mình là nạn nhân và bạn nhận ra mình là một đấng sáng tạo quyền năng cho cuộc sống của mình. Bạn buông bỏ những thói quen phán xét đã nhiễm phải; thay vào đó, bạn tin tưởng vào trực giác của mình. Trực giác của bạn nói rằng tất cả đều yên ổn và trong trật tự thiêng liêng, cho dù tâm trí logic của bạn có thể không đồng tình. Bạn thôi không lo lắng về những xao lãng và lệch lạc của tâm trí; thay vào đó bạn nghiêng về trái tim và dựa vào trí tuệ của trái tim để định ra con đường của mình.\r\n\r\nBạn nhận ra bạn không phải là những suy nghĩ hay cảm nhận của mình; bạn cho phép những suy nghĩ và cảm nhận tiêu cực trôi nổi nhẹ nhàng qua ý thức, giống như những đám mây trôi trên bầu trời. Bạn không còn coi bản thân là nỗi sợ và lo âu của mình nữa; thay vào đó, bạn xem chúng như là những trẻ nhỏ cần tình yêu thương của bạn. Và hãy yêu chúng như bạn đã làm.','img-4354335497739384583.jpg',_binary '','2025-05-31 00:52:18',NULL,'2025-05-30 00:52:00','2025-08-15 00:52:00'),(110,'Phân Tâm Học Nhập Môn',230000,10,4447,215,'Sigmund Freud - Nguyễn Xuân Hiếu - dịch',402,'NXB Văn Học',2019,'Phân tâm học nhập môn','img-622428753571517741.jpg',_binary '','2025-05-31 00:53:48',NULL,'2025-05-01 00:53:00','2025-06-28 00:53:00'),(111,'Nấu Ăn Gia Đình - 30 Thực Đơn Ngày Thường + 52 Thực Đơn Ngày Chủ Nhật',65000,20,475,76,'Triệu Thị Chơi',212,'Hồng Đức',2024,'Nấu Ăn Gia Đình - 30 Thực Đơn Ngày Thường + 52 Thực Đơn Ngày Chủ Nhật\r\n\r\nMỗi dân tộc ở mỗi vùng lãnh thổ khác nhau trên thê giới đều có tập quán ăn uống và món ăn riêng. Song, dân tộc nào cũng có các loại thức ăn thường ngày trong gia đình, các bữa ăn tươi, các bữa cỗ, bữa tiệc,...\r\n\r\nDù là bữa ăn được tổ chức dưới bất cứ hình thức nào, mọi người cũng đều ưa thích được thưởng thức một bữa ăn ngon. Nhưng, một bữa ăn ngon thật sự là gì? Chúng phải có sự phong phú và ngon miệng, tạo được sự thích thú, và trên hết tất cả phải có đủ chất dinh dưỡng.','img-13437447572618593346.jpg',_binary '','2025-05-31 00:58:17',NULL,'2025-04-30 00:58:00','2025-07-02 00:58:00'),(112,'Cơm Chay Nhà Mình Có Gì?',126000,5,77,19,'Dzoãn Vân',152,'Dân Trí',2025,'Cơm Chay Nhà Mình Có Gì?\r\n\r\nKhông cao lương mỹ vị nào sánh bằng một bữa cơm nhà ấm áp. Đôi khi, ta tìm đến hàng quán để đổi vị, để thưởng thức những món ăn lạ miệng. Nhưng rồi, sau bao lần rong ruổi giữa phố xá đông đúc, lòng lại chợt thèm da diết hương vị quen thuộc của mâm cơm gia đình. Chuẩn bị một mâm cơm chay chẳng cần cầu kỳ, chỉ cần đĩa rau luộc, bát canh thanh ngọt, chén đậu kho đậm đà và chút nước tương dầm ớt cay nồng. Đơn giản thế thôi, nhưng trong từng món ăn là cả tấm lòng, là sự chăm chút, là tình yêu của người nấu dành cho các thành viên gia đình.\r\n\r\nCuốn sách “Cơm chay nhà mình có gì?” của tác giả Dzoãn Vân ra đời từ chính những giá trị bình dị ấy. Nhắc đến ẩm thực chay Việt Nam, nhiều người sẽ nghĩ ngay đến nghệ nhân Nguyễn Dzoãn Cẩm Vân – một người thầy tận tâm, một đầu bếp tài hoa, và cũng là người đã truyền cảm hứng cho rất nhiều người Việt qua những câu chuyện món chay mộc mạc nhưng đầy tinh tế.\r\n\r\nVới mong muốn đưa đến những mâm cơm chay thanh đạm mà vẫn giữ được hương vị đậm đà, tác giả Dzoãn Vân sẽ đưa bạn khám phá sự phong phú của ẩm thực chay qua 30 công thức món kho, nướng, hấp, chiên, thố, xào, canh… Mỗi món ăn đều được hướng dẫn tỉ mỉ, dễ hiểu, đi kèm những mẹo nhỏ để ai cũng có thể dễ dàng thực hiện và biến tấu theo khẩu vị gia đình. Nguyên liệu trong các công thức đều là những thực phẩm quen thuộc với người Việt như rau củ, đậu hũ, nấm, tiêu xanh, sả, ớt… Không cầu kỳ, không xa lạ, chỉ với những nguyên liệu bình dị ấy, bạn vẫn có thể chuẩn bị một mâm cơm chay thơm ngon, tròn đầy dưỡng chất.','img-15594739435914223170.jpg',_binary '','2025-05-31 01:00:01','2025-05-31 01:43:52','2025-04-29 00:59:00','2025-07-03 00:59:00'),(113,'Các Món Ăn Thông Dụng',25000,0,49,27,'Triệu Thị Chơi',176,'Văn Hóa Thông Tin',2013,'Bộ sách \"Kỹ Thuật Nấu Ăn Ngon\" (gồm 3 tập) giới thiệu cùng các bạn cách chế biến các món ăn hợp khẩu vị của từng vùng, miền trong cả nước. Từ việc chuẩn bị nguyên liệu cần thiết đến cách sử dụng nguyên liệu qua các khâu sơ chế, chế biến, trình bày...\r\n\r\nTập 1: Các Món Ăn Thông Dụng giới thiệu các món ăn thông dụng, phổ biến trong thực đơn nấu ăn gia đình.\r\n\r\nTập 2: Món Ăn Đãi Khách giới thiệu các món ăn ngon đòi hỏi sự chọn lựa thực phẩm kỹ hơn và đặc biệt là cách chế biến cầu kỳ hơn. Các món ăn này thường dùng để đãi khách hoặc dùng trong ngày lễ, ngày nghỉ cuối tuần.\r\n\r\nTập 3: Các Món Thủy Đặc Sản giới thiệu các món ăn đặc biệt được chế biến từ thủy sản như tôm, cua, nghêu, sò... là các món khoái khẩu của thực khách ở các nhà hàng đặc sản.\r\n\r\nXin giới thiệu Tập 1: Các Món Ăn Thông Dụng cùng bạn.','img-18152642982856614880.jpg',_binary '','2025-05-31 01:01:59',NULL,'2025-05-14 01:01:00','2025-06-19 01:01:00'),(114,'Kinh Tế Học Vĩ Mô',250000,10,56,22,'N. Gregory Mankiw',596,'Hồng Đức',2024,'Kinh Tế Học Vi Mô\r\n\r\n“Kinh tế Vi Mô” và “Kinh tế Vĩ Mô” của NXB Cengage\r\n\r\nNXB Cengage Learning là một trong những Nhà xuất bản lớn hàng đầu trên thế giới có trụ sở chính tại Mỹ và tại khu vực Châu Á có 11 trụ sở tại các nước khác nhau, cung cấp các thể loại sách phục vụ cho việc học tập, giảng dạy và nghiên cứu cho các cá nhân, các trường đại học, cao đẳng, viện nghiên cứu, các doanh nghiệp và thư viện trên toàn thế giới.\r\n\r\nTheo xu hướng đổi mới cơ bản và toàn diện giáo dục Đại học Việt Nam hiện nay và phục vụ cho đề án quốc tế hóa các chương trình đào tạo kinh tế sang hướng tiên tiến để nhanh chóng ngang bằng trình độ khu vực và tiệm cận với giáo dục đại học trên thế giới, một trong những đổi mới để phù hợp với xu thế này là lựa chọn các giáo trình tốt nhất của các NXB nổi tiếng trên thế giới để chuyển ngữ sang tiếng Việt nhằm phục vụ cho việc học của sinh viên được dể dàng hơn, Công ty Cổ phần phát hành sách Tp.HCM – FAHASA đã phối hợp với NXB NXB Cengage Learning và đội ngũ giảng viên khoa Kinh tế Trường Đại học Kinh tế TP.HCM – một trong 16 trường trọng điểm của Bộ Giáo dục và Đào tạo - tổ chức dịch quyển Kinh tế học của Tác giả N.Gregory Mankiw cho hai phiên bản Kinh tế học vi mô và Kinh tế học vĩ mô ra Tiếng Việt để phục vụ cho việc học tập và nghiên cứu của giảng viên và sinh viên khoa Kinh tế của các Trường Đại học trên cả nước. Sau khi được biên dịch bởi đội ngủ giảng viên Trường ĐH Kinh tế Tp.HCM, NXB Cengage đã tổ chức biên tập và in ấn tại Singapore, bản quyền của 2 quyển sách này thuộc NXB Cengage Learning sách do Công ty FAHASA nhập khẩu và phân phối độc quyền tại Việt Nam.','img-15931119177362071628.jpg',_binary '','2025-05-31 01:04:15',NULL,'2025-05-17 01:04:00','2025-06-19 01:04:00'),(115,'Giáo Trình Triết Học Mác-Lenin (Dành Cho Bậc Đại Học Hệ Chuyên Lý Luận Chính Trị)',95000,10,78,27,'Bộ Giáo Dục và Đào Tạo',560,'Chính Trị Quốc Gia Sự Thật',2024,'Mô tả sản phẩm\r\nGiáo Trình Triết Học Mác-Lenin (Dành Cho Bậc Đại Học Hệ Chuyên Lý Luận Chính Trị)\r\n\r\nGiáo trình do Ban biên soạn gồm các tác giả là nhà nghiên cứu, nhà giáo dục thuộc Viện Triết học – Học viện Chính trị quốc gia Hồ Chí Minh, các học viện, trường đại học, Viện Triết học – Viện Hàn lâm Khoa học xã hội Việt Nam,… tổ chức biên soạn trên cơ sở kế thừa những kết quả nghiên cứu trước đây, đồng thời bổ sung nhiều nội dung, kiến thức, kết quả nghiên cứu mới, gắn với công cuộc đổi mới ở Việt Nam, nhất là những thành tựu trong 35 năm đổi mới đất nước.','img-5311879758078852500.jpg',_binary '','2025-05-31 01:05:38',NULL,'2025-05-02 01:05:00','2025-06-13 01:05:00'),(116,'Bài Giảng Sinh Học',220000,5,116,65,'GS NGND Nguyễn Lân Dũng',426,'Dân Trí',2023,'Bài Giảng Sinh Học\r\n\r\nTheo GS Nguyễn Lân Dũng, khi viết tài liệu này ông suy nghĩ nhiều đến sinh viên sinh học năm thứ nhất, khi mới bước đầu đến với thế giới sinh học. Tài liệu này giúp các em hiểu dễ dàng hơn về các khái niệm mới mẻ và thêm hứng thú tìm hiểu ngành khoa học nay. Tôi quan tâm nhiều hơn đến việc giúp các thầy cô giáo bậc phổ thông. Nếu các thầy cô biết 10 dạy 1 thì học sinh, sinh viên sẽ rất dễ hiểu, rất phong phú nội dung và làm học sinh dễ hiểu, nhớ lâu. Nếu các em định thi khối B hay thi vào Y mà ôm quyển Sinh học của Campbell thì vừa quá đắt vừa quá khó tiếp thu, đọc cuốn này là “bước đệm” đầu tiên giúp các em chinh phục những kiến thức khó hơn.\r\n\r\nGS Nguyễn Lân Dũng bộc bạch: “Sinh viên năm thứ nhất Khoa Sinh thường rất muốn hiểu về thế giới sinh học nhưng không biết làm gì để có kiến thức cơ bản khi tiếp nhận các giáo trình mới mẻ ở bậc Đại học. Có kiến thức cơ bản thì việc tiếp thu các giáo trình chuyên ngành về Động vật, Thực vật hay về Cơ thể người mới thuận lợi. Đây là bước chuẩn bị cho việc tiếp thu các kiến thức sâu hơn về thế giới sinh vật.”\r\n\r\nSách dành cho sinh viên, giáo viên các trường phổ thông và học sinh phân ban Sinh học được biên soạn bởi NGND, Tiến sĩ Sinh học Nguyễn Lân Dũng.','img-3604762537615826663.jpg',_binary '','2025-05-31 01:07:20',NULL,'2025-05-06 01:12:00','2025-07-05 01:07:00'),(117,'Học Thông Minh - Study Smart',60000,0,157,78,'Karen Tui Boyes',166,'Hồng Đức',2022,'Học Thông Minh - Study Smart\r\n\r\nCuốn sách HỌC THÔNG MINH (STUDY SMART) của tác giả Karen Tui Boyes đem đến cho người học bí quyết rèn trí nhớ, luyện tư duy và chinh phục điểm cao trong các kỳ thi.\r\n\r\nThi cử luôn là nỗi lo lớn nhất đối với mỗi học sinh, sinh viên. Tuy nhiên, nếu nắm được những cách học thong minh để vừa tiết kiệm thời gian và công sức, vừa nắm chắc và nhớ kiến thức lâu, bạn hoàn toàn có thể vượt qua và đạt thành tích cao trong một kỳ thi.\r\n\r\nHỌC THÔNG MINH là cuốn cẩm nang dành cho HS, SV và bất kỳ ai theo đuổi mục tiêu học tập suốt đời. Những chiến lược cụ thể sẽ giúp bạn cải thiện khả năng tư duy và ghi nhớ. Kèm theo những “mẹo” hoc tập đơn giản mà hiệu qủa, cuốn sách này sẽ là người bạn đồng hành đáng tin cậy của bạn trong hành trình chinh phục kiến thức.\r\n\r\nVì theo Ken và Rita Dunn: “Mỗi người có một cách học riêng và những thế mạnh riêng”','img-85741047980277085.jpg',_binary '','2025-05-31 01:09:07',NULL,'2025-05-01 01:09:00','2025-06-13 01:09:00'),(118,'Con Đường Chẳng Mấy Ai Đi - The Road Less Traveled',165000,10,222,124,'M. Scott Peck',344,'Dân Trí',2024,'Con Đường Chẳng Mấy Ai Đi\r\n\r\nCó lẽ không quyển sách nào trong thế kỷ này có tác động sâu sắc đến đời sống trí tuệ và tinh thần của chúng ta hơn Con Đường Chẳng Mấy Ai Đi. Với doanh số trên 10 triệu bản in trên toàn thế giới và được dịch sang hơn 25 ngôn ngữ, đây là một hiện tượng trong ngành xuất bản, với hơn mười năm nằm trong danh sách Best-sellers của New York Times.\r\n\r\nVới cách hành văn kinh điển và thông điệp đầy thấu hiểu, quyển sách Con Đường Chẳng Mấy Ai Đi giúp chúng ta khám phá bản chất của các mối quan hệ và của một tinh thần trưởng thành. Quyển sách giúp chúng ta học cách phân biệt sự lệ thuộc với tình yêu; làm thế nào để trở thành những bậc phụ huynh tinh tế và nhạy cảm; và cuối cùng là làm thế nào để sống chân thật với chính mình.\r\n\r\nVới dòng mở đầu bất hủ của quyển sách, \"Cuộc đời này rất khó sống\", thể hiện quan điểm hành trình phát triển tinh thần là một chặng đường dài và gian nan, Tiến sĩ Peck thể hiện sự đồng cảm, nhẹ nhàng dẫn dắt độc giả vượt qua quá trình khó khăn đó, để thay đổi hướng tới tầm mức thấu hiểu bản thân sâu sắc hơn.','img-3345184246243824544.jpg',_binary '','2025-05-31 01:11:23',NULL,'2025-05-01 01:11:00','2025-08-01 01:11:00'),(119,'Được Học (Tái Bản 2022)',182000,10,5000,1300,'Tara Westover',320,'Phụ Nữ Việt Nam',2022,'Được Học\r\n\r\nBạn đọc sẽ biết ngay từ đầu rằng Tara Westover đang kể một câu chuyện có thực, hơn hết lại là câu chuyện cuộc đời cô, nhưng dù ít hay nhiều chúng ta vẫn cảm thấy sao mà nó “như tiểu thuyết”!\r\n\r\nCô bé Tara sống trên núi, đã vậy còn chưa bao giờ được đi học bởi vì bố của Tara – một người quyết liệt bài bác trường công cũng như bất cứ khía cạnh văn minh nào “phản tự nhiên”, phản lại ý Chúa – muốn như thế. Thậm chí cô bé này không có cả giấy khai sinh, nghĩa là trong hệ thống xã hội cô không tồn tại. Tara tồn tại theo “luật” của bố: cô được định nghĩa qua những công việc nhằm sửa soạn cho ngày Tận thế, những lao động khổ ải ở bãi phế liệu, và trên hết là nề nếp khắc kỷ tuyệt đối thể hiện lòng sùng kính Chúa.\r\n\r\nCô gái ấy lớn lên hầu như chỉ trong cảm giác vi phạm và tội lỗi – đi học là tội lỗi, rung động với bạn khác giới là tội lỗi, mặc váy và áo thun ôm sát là tay sai của quỷ Sa-tăng. Bố Tara đã nuôi dạy cô (cũng như các anh chị em khác) ở một “thành trì” kiên cố đến mức cô hầu như không thể quen với những lời khen, với tình cảm ân cần, ưu ái. Tara Westover không hề hư cấu chuỗi kịch tính trong đời mình (đọc tự truyện, chúng ta sẽ thấy tác giả luôn lo ngại việc kể sai, kể sót): từ chuỗi vận nạn của chính cô đến những tai nạn lần lượt xảy ra với các thành viên gia đình, mà hầu như tất cả đều bắt nguồn nơi tính cách, lối sống kì dị của ông bố. Song càng lật mở những trang sách thì tim chúng ta càng thắt lại với câu hỏi: Sao kia, chuyện này làcó thật?\r\n\r\nTara Westover đã vượt qua cái có thật ấy, dĩ nhiên chẳng hề theo cách thẳng băng, dễ dàng, để được đi học; và mãi về sau, khi trở thành Tiến sỹ tại Đại học Cambridge lừng danh, cô đã buộc phải chấp nhận tình cảnh đứt lìa mối quan hệ với hầu hết người ruột thịt.\r\n\r\nĐược học, được giáo dục là niềm vui, niềm hạnh phúc, với một số người đó còn là cứu rỗi. Như Tara. Dẫu giá phải trả cực kỳ đắt đỏ, dai dẳng, thấu xương. Nhưng cô đã chọn để được tự do, để trở nên tốt đẹp hơn, dù bao đơn độc.','img-5713957565784491541.jpg',_binary '','2025-05-31 01:12:40',NULL,'2025-04-25 01:12:00','2025-06-28 01:12:00'),(120,'Con Đường Chẳng Mấy Ai Đi - The Road Less Traveled',260000,10,554,258,'TS M. Scott Peck',352,'Dân Trí',2025,'Con Đường Chẳng Mấy Ai Đi\r\n\r\nCó lẽ không quyển sách nào trong thế kỷ này có tác động sâu sắc đến đời sống trí tuệ và tinh thần của chúng ta hơn Con Đường Chẳng Mấy Ai Đi. Với doanh số trên 10 triệu bản in trên toàn thế giới và được dịch sang hơn 25 ngôn ngữ, đây là một hiện tượng trong ngành xuất bản, với hơn mười năm nằm trong danh sách Best-sellers của New York Times.\r\n\r\nVới cách hành văn kinh điển và thông điệp đầy thấu hiểu, quyển sách Con Đường Chẳng Mấy Ai Đi giúp chúng ta khám phá bản chất của các mối quan hệ và của một tinh thần trưởng thành. Quyển sách giúp chúng ta học cách phân biệt sự lệ thuộc với tình yêu; làm thế nào để trở thành những bậc phụ huynh tinh tế và nhạy cảm; và cuối cùng là làm thế nào để sống chân thật với chính mình.\r\n\r\nVới dòng mở đầu bất hủ của quyển sách, \"Cuộc đời này rất khó sống\", thể hiện quan điểm hành trình phát triển tinh thần là một chặng đường dài và gian nan, Tiến sĩ Peck thể hiện sự đồng cảm, nhẹ nhàng dẫn dắt độc giả vượt qua quá trình khó khăn đó, để thay đổi hướng tới tầm mức thấu hiểu bản thân sâu sắc hơn.','img-4646904986358819674.jpg',_binary '','2025-05-31 01:14:02',NULL,'2025-05-09 01:13:00','2025-07-04 01:14:00'),(121,'Khéo Ăn Nói Sẽ Có Được Thiên Hạ',130000,20,89,12,'Trác Nhã',404,'Văn Học',2022,'Khéo Ăn Nói Sẽ Có Được Thiên Hạ (Tái Bản 2022)\r\n\r\nTrong xã hội thông tin hiện đại, sự im lặng không còn là vàng nữa, nếu không biết cách giao tiếp thì dù là vàng cũng sẽ bị chôn vùi. Trong cuộc đời một con người, từ xin việc đến thăng tiến, từ tình yêu đến hôn nhân, từ tiếp thị cho đến đàm phán, từ xã giao đến làm việc… không thể không cần đến kĩ năng và khả năng giao tiếp. Khéo ăn khéo nói thì đi đâu, làm gì cũng gặp thuận lợi. Không khéo ăn nói, bốn bề đều là trở ngại khó khăn.\r\n\r\nĐã bao giờ đánh mất một công việc, bạn bỏ lỡ một mối quan hệ tuyệt vời, hay đơn giản là bạn cảm thấy khó nói chuyện với mọi người. Bạn có bao giờ nghĩ là do kĩ năng nói chuyện của mình chưa tốt, chưa thuyết phục được mọi người. Bạn đổ lỗi cho số phận và vận may của mình chưa đến. Hãy dừng việc than thân trách phận và hành động để thay đòi chính mình.\r\n\r\nVậy làm thế nào để cải thiện và tránh gặp phải những tình huống như trên? Làm thế nào để ăn nói khéo léo? Có phương pháp và quy luật nào được áp dụng khi giao tiếp không? Có nguyên tắc và bí quyết nào cho các cuộc nói chuyện không? Trong những tình huống khác nhau, với những người khác nhau thì phải nói chuyện như thế nào, và làm sao để trình bày những điều khó nói?\r\n\r\nCuốn sách Khéo ăn nói sẽ có được thiên hạ của Trác Nhã sẽ giải đáp cho bạn đọc những câu hỏi đó. Cuốn sách với ngôn từ rõ ràng, gần gũi với cuộc sống sẽ mang đến những kĩ năng và phương pháp giao tiếp thực dụng, chắc chắn sẽ giúp ích được cho bạn đọc.','img-12474776282016946267.jpg',_binary '','2025-05-31 01:15:09',NULL,'2025-05-08 01:15:00','2025-06-21 01:15:00'),(122,'Yêu Những Điều Không Hoàn Hảo',169000,10,48,22,'Hae Min',300,'Thế Giới',2025,'Yêu Những Điều Không Hoàn Hảo\r\n\r\n“Ngẫm lại cuộc sống của chính mình, ta sẽ nhận thấy rất nhiều điều không hoàn hảo. Trước hết, chỉ nhìn vào bản thân mình thôi ta đã cảm nhận được nhiều thiếu sót rồi: lời nói và hành động mâu thuẫn với nhau, vụng về trong những mối quan hệ xã hội, chuyện học hành, công việc không suôn sẻ như ý muốn. Chưa kể đôi khi ta còn khiến người khác tổn thương, thậm chí còn làm những việc khiến bản thân cảm thấy tội lỗi và hối hận. Và khi nhìn vào những người thân trong gia đình, bạn bè, đồng nghiệp, ta cũng nhận thấy những điều không-hoàn-hảo tương tự như vậy.\r\n\r\nNhưng dù đang sống giữa thế gian đầy rẫy những điều không hoàn hảo, ta vẫn không thể ngừng yêu thương chính những điều không hoàn hảo ấy. Cuộc sống rất đáng để trân trọng, ta không thể phí hoài cuộc sống vào việc mỉa mai hay căm ghét thứ gì đó chỉ vì không thể hiểu được nó hoặc nó không vừa ý ta.','img-8518680677700021504.jpg',_binary '','2025-05-31 01:17:22',NULL,'2025-05-06 01:17:00','2025-06-28 01:17:00'),(123,'Búp Sen Xanh, Bông Sen Vàng',72000,10,448,256,'Sơn Tùng',380,'Kim Đồng',2020,'BÚP SEN XANH - TUỔI THƠ CỦA MỘT LÃNH TỤ, HÀNH TRÌNH CỦA MỘT DÂN TỘC\r\nHành trình của một cậu bé xứ Nghệ mang trong mình khát vọng lớn lao.\r\n\r\nLấy cảm hứng từ tuổi thơ của Chủ tịch Hồ Chí Minh, “Búp Sen Xanh” tái hiện một cách sinh động những năm tháng đầu đời của Người - từ mái nhà đơn sơ nơi làng Sen, những bài học sâu sắc từ cha mẹ, đến những trăn trở trước vận mệnh đất nước. Mỗi trang sách là một mảnh ghép về hành trình hình thành tư tưởng, hun đúc ý chí, để rồi từ đó, một con người vĩ đại đã ra đi tìm đường cứu nước.','img-4185605344376066869.jpg',_binary '','2025-05-31 01:21:34',NULL,'2025-05-25 01:21:00','2025-06-20 01:21:00'),(124,'iểu Sử Các Quốc Gia Qua Góc Nhìn Lầy Lội',215000,10,991,201,'Sai Lei',280,'Dân Trí',2021,'Iceland dân số ít ỏi mà dám đọ sức với Anh? Na Uy in hình con cá ướp muối lên tờ tiền? Anh có thật là đế quốc mặt trời không bao giờ lặn? Đan Mạch là vương quốc mộng ảo còn Hà Lan là đất nước của tự do thực sự? Bỉ từng được giải cứu nhờ bãi nước tiểu của một cậu bé? Thụy Sĩ siêu giàu có nhờ trung lập, Ý chỉ quan tâm tận hưởng cuộc sống? Ai Cập thích xây kim tự tháp, Nam Phi nằm ở châu Phi nhưng lại từng kỳ thị người da đen, Argentina mê bóng đá hơn kiếm tiền…?\r\n\r\nNhân cách hóa, bỏ qua những chi tiết rườm rà, sử dụng ngôn ngữ hài hước dí dỏm cô đọng lại con đường phát triển của các quốc gia, Sai Lei qua góc nhìn có phần “lầy lội” của mình sẽ đem đến cho bạn đọc cách tiếp cận lịch sử thế giới hết sức mới mẻ, gần gũi và dễ hiểu.','img-9644317724675735656.jpg',_binary '','2025-05-31 01:23:02',NULL,'2025-05-16 01:22:00','2025-06-20 01:22:00'),(125,'Những Truyện Hay Viết Cho Thiếu Nhi - Tô Hoài',80000,10,456,48,'Tô Hoài',304,'Kim Đồng',2022,'Tập truyện tuyển chọn những truyện hay viết cho thiếu nhi của nhà văn Tô Hoài: Đám cưới chuột, Võ sĩ Bọ Ngựa, Dê và Lợn, Hai con ngỗng, Bàn Quý và Ngựa Con, Mùa xuân đã về đấy…\r\n\r\n“Bạn đọc nhỏ tuổi hay người lớn đọc đồng thoại? Những tác phẩm viết cho lứa tuổi thơ nổi tiếng trong nước và thế giới đã trả lời câu hỏi ấy. Một sáng tác hay cho các em cũng làm cho cả người lớn thấy hay. Các em và người lớn đều thu nhận được ở tác phẩm ấy những thông cảm cho mỗi lứa tuổi khác nhau, mà người lớn không cần phải giả làm trẻ em mới hiểu được. Người lớn vốn đã thích thú đọc rất hào hứng những tác phẩm tưởng tượng còn “hoang đường” hơn truyện đồng thoại kia mà.” - Nhà văn Tô Hoài -','img-1321224249439808007.jpg',_binary '','2025-05-31 01:25:34',NULL,'2025-04-30 01:25:00','2025-07-05 01:25:00'),(126,'Gieo Mầm Tính Cách - Tự Tin',35000,5,489,226,'Hà Yên',84,'Trẻ',2019,'Tính cách của trẻ được hình thành từ rất sớm, thông qua sự giáo dục trong gia đình, qua những việc làm, lời nói, cách ứng xử của những người xung quanh. Nhưng ở độ tuổi nhỏ, không thể ép trẻ phát triển tính cách theo ý muốn của cha mẹ bằng lời dạy dỗ suông, bằng những bài học đạo đức khô khan, mà những tấm gương đẹp về tính cách đó phải được gieo vào trẻ từ từ bằng những câu chuyện sinh động, hấp dẫn.\r\n\r\nBộ sách Gieo mầm tính cách (12 tập) là tập hợp những câu chuyện như vậy. Mỗi tập là một hạt giống tính cách gieo vào trẻ những bài học Tử tế, Tha thứ, Kiên trì, Thật thà, Quan tâm, Yêu thương, Mạnh mẽ, Tự tin, Ước mơ, Lịch sự, Hiếu thảo, Công bằng bằng những câu chuyện cảm động, đầy ý nghĩa đáng để suy ngẫm.\r\n\r\nMỗi câu chuyện được trình bày kèm với một câu tục ngữ, thành ngữ, ca dao, danh ngôn nhằm nhấn mạnh thêm thông điệp mà người tuyển chọn muốn gửi gắm. Không chỉ vậy, những bài học sau mỗi câu chuyện được xây dựng gần gũi, nhiều gợi mở cho người đọc triển khai thêm nhiều suy nghĩ sau khi đọc truyện, so sánh, áp dụng thực tế và tự xét bản thân.\r\n\r\nTruyện được minh họa hai màu sinh động.\r\n\r\n','img-4513807294254842351.jpg',_binary '','2025-05-31 01:27:51',NULL,'2025-05-16 01:27:00','2025-06-21 01:27:00'),(127,'Gi Gỉ Gì Gi, Cái Gì Cũng Biết - 130 Bí Mật Vui Nhất Cho Tuổi Tiểu Học',115000,0,57,10,'Hanazono Makoto',160,'Thế Giới',2020,'Vui thú biết bao khi được khám phá mọi thứ xung quanh!\r\n\r\nCó vô số câu hỏi “vì sao” quanh ta mỗi phút giây. Mỗi ngày giải đáp được một câu trong số ấy thì thú vị biết mấy, kiến thức cùng lòng ham học hỏi trong ta sẽ lớn lên dần. Cuốn sách này là người bạn đắc lực đem đến những điều ngộ nghĩnh ta thường bắt gặp buổi sáng, buổi trưa, buổi tối và các ngày nghỉ.\r\nCùng tìm hiểu hơn 100 bí mật về Cơ thể con người, Thế giới tự nhiên, Cuộc sống quanh ta, Đồ ăn thức uống, Những thứ phục vụ cuộc sống của con người!\r\n\r\nTác giả: Hanazono Makoto (Giảng viên Khoa Giáo dục trẻ em Đại học Teikyo)\r\nTốt nghiệp tiến sĩ khoa Nông nghiệp Đại học Nagoya, học thêm khoa y Đại học Teikyo, hiện đang giảng dạy tại Đại học Teikyo. Tham gia thành lập khoa Khoa học về động vật, hiện là trưởng khoa Giáo dục nhi đồng, đảm nhiệm vị trí quản lý kết nối với các địa phương, viết ra nhiều cuốn sách về trẻ em và động vật. Tác giả sáng tạo ra phương pháp dạy dùng “Phòng chơi với động vật” ứng dụng tốt cho trẻ em mẫu giáo và tiểu học.','img-7197784268319019379.jpg',_binary '','2025-05-31 01:30:34',NULL,'2025-05-08 01:30:00','2025-06-15 01:30:00'),(128,'Giáo Dục Giới Tính Và Nhân Cách Dành Cho Bé Trai - Mọi Điều Bé Trai Cần Phải Biết',35000,0,478,128,'Thùy Dương, Cá, Kim Nhi Lê',32,'Hà Nội',2022,'Giáo dục giới tính và nhân cách dành cho bé trai là bộ sách rất bổ ích, giúp các bé trai có hành vi, ngôn ngữ, cử chỉ đúng mực; biết đoàn kết, yêu thương, chia sẻ, sống có trách nhiệm với mọi người. Đặc biệt, thông qua bộ sách này, các bé trai còn học được cách sống tự lập, luôn tỏa sáng và tự tin vào bản thân; đồng thời cũng học được cách nhận biết, thấu hiểu và bảo vệ các bộ phận trên cơ thể mình.\r\n\r\nBộ sách là món quà nhỏ tuyệt vời mà các bố mẹ và thầy cô gửi tặng các con, giúp các con cư xử đúng mực, thông minh trong mọi tình huống, mọi hoàn cảnh.','img-10160513744354255307.jpg',_binary '','2025-05-31 01:32:13','2025-05-31 01:32:57','2025-05-09 01:31:00','2025-06-15 01:32:00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `productId` bigint NOT NULL,
  `categoryId` bigint NOT NULL,
  PRIMARY KEY (`productId`,`categoryId`),
  KEY `idx_product_category_product` (`productId`),
  KEY `idx_product_category_category` (`categoryId`),
  CONSTRAINT `fk_product_category_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_category_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (101,3),(102,3),(103,3),(104,3),(105,3),(106,2),(107,2),(108,2),(109,2),(110,2),(111,11),(112,11),(113,11),(114,7),(115,7),(116,7),(117,7),(118,15),(119,15),(120,15),(121,15),(122,15),(123,14),(124,14),(125,14),(126,14),(127,14),(128,14);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `ratingScore` tinyint NOT NULL,
  `content` text NOT NULL,
  `isShow` bit(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_review_user` (`userId`),
  KEY `idx_product_review_product` (`productId`),
  CONSTRAINT `fk_product_review_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_product_review_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
INSERT INTO `product_review` VALUES (1,13,127,5,'Cuốn sách này đã mở ra cho tôi một góc nhìn hoàn toàn mới về cuộc sống',_binary '','2025-05-31 01:57:41',NULL),(2,13,127,4,'Một tác phẩm sâu sắc, giàu cảm xúc và đáng suy ngẫm',_binary '','2025-05-31 01:57:48',NULL),(3,13,127,5,'Mỗi trang sách đều khiến tôi muốn đọc thêm – đó là dấu hiệu của một cuốn sách hay',_binary '','2025-05-31 01:57:58',NULL),(4,13,123,3,'Cuốn sách mang đến nhiều ý tưởng thú vị, dù cách triển khai đôi lúc còn chậm',_binary '','2025-05-31 01:58:10',NULL),(5,13,123,4,'Mặc dù phần đầu hơi lê thê, nhưng về sau lại cuốn hút bất ngờ',_binary '','2025-05-31 01:58:16',NULL),(6,13,123,5,'Tác phẩm đã chạm đến trái tim tôi theo một cách rất đặc biệt.',_binary '','2025-05-31 01:58:23',NULL),(7,19,103,5,'Sản phẩm này rất hành, phù hợp cho các em nhỏ thiếu nhi',_binary '','2025-05-31 18:38:22',NULL);
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(11) NOT NULL,
  `gender` bit(1) NOT NULL,
  `address` varchar(200) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_username` (`username`),
  UNIQUE KEY `uq_email` (`email`),
  UNIQUE KEY `uq_phoneNumber` (`phoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','202CB962AC59075B964B07152D234B70','VKU','bangdc.23it@vku.udn.vn','0332823108',_binary '\0','2 Nguyễn Dữ','ADMIN'),(2,'user2','202CB962AC59075B964B07152D234B70','Foreman Carter','foremancarter@recrisys.com','0993194154',_binary '\0','28 Richardson Street, Layhill, Netherlands','EMPLOYEE'),(3,'user3','202CB962AC59075B964B07152D234B70','Felecia Cabrera','feleciacabrera@recrisys.com','0930174351',_binary '','41 Linden Street, Slovan, S. Georgia and S. Sandwich Isls.','EMPLOYEE'),(4,'user4','202CB962AC59075B964B07152D234B70','Juliette Mcdowell','juliettemcdowell@recrisys.com','0911925643',_binary '','5 Schenck Court, Dana, Cyprus','CUSTOMER'),(5,'user5','202CB962AC59075B964B07152D234B70','Vilma Spencer','vilmaspencer@recrisys.com','0987509391',_binary '','5 Pooles Lane, Allentown, Zambia','CUSTOMER'),(6,'admin','827ccb0eea8a706c4c34a16891f84e7b','Bang','bang@gmail.com','0325541999',_binary '\0','2 Nguyen Du','ADMIN'),(11,'admin3','e10adc3949ba59abbe56e057f20f883e','Bang','bang4@gmail.com','0325541991',_binary '\0','2 Nguyen Du','ADMIN'),(12,'admin1','0192023a7bbd73250516f069df18b500','Admin Bang','admin1@example.com','0911222333',_binary '','1 Nguyen Du','ADMIN'),(13,'bang','202CB962AC59075B964B07152D234B70','bằng','bangdc.23it@gmail.com','0154879425',_binary '\0','avsas','CUSTOMER'),(18,'bang1111','202CB962AC59075B964B07152D234B70','Đặng Công Bằng','dangcongbang9718@gmail.com','0332823111',_binary '\0','2 nguyen du','CUSTOMER'),(19,'VKU113','E10ADC3949BA59ABBE56E057F20F883E','VKU','vku@gmail.com','0976485110',_binary '\0','Đà Nẵng','CUSTOMER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_userId_productId` (`userId`,`productId`),
  KEY `idx_wishlist_item_user` (`userId`),
  KEY `idx_wishlist_item_product` (`productId`),
  CONSTRAINT `fk_wishlist_item_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_wishlist_item_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item`
--

LOCK TABLES `wishlist_item` WRITE;
/*!40000 ALTER TABLE `wishlist_item` DISABLE KEYS */;
INSERT INTO `wishlist_item` VALUES (32,19,127,'2025-05-31 18:37:05');
/*!40000 ALTER TABLE `wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01 20:54:02
