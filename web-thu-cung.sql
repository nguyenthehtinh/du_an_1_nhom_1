-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th8 18, 2025 lúc 04:59 PM
-- Phiên bản máy phục vụ: 8.4.3
-- Phiên bản PHP: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web-thu-cung`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luans`
--

CREATE TABLE `binh_luans` (
  `id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `tai_khoan_id` int NOT NULL,
  `noi_dung` text NOT NULL,
  `ngay_dang` date NOT NULL,
  `trang_thai` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_don_hangs`
--

CREATE TABLE `chi_tiet_don_hangs` (
  `id` int NOT NULL,
  `don_hang_id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `don_gia` decimal(10,2) NOT NULL,
  `so_luong` int NOT NULL,
  `thanh_tien` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_don_hangs`
--

INSERT INTO `chi_tiet_don_hangs` (`id`, `don_hang_id`, `san_pham_id`, `don_gia`, `so_luong`, `thanh_tien`) VALUES
(23, 36, 4, 40000000.00, 1, 40000000.00),
(24, 37, 3, 1900000.00, 3, 5700000.00),
(25, 38, 4, 40000000.00, 2, 80000000.00),
(26, 41, 4, 40000000.00, 2, 80000000.00),
(27, 42, 15, 1600000.00, 3, 4800000.00),
(28, 43, 14, 11500000.00, 1, 11500000.00),
(29, 44, 13, 15000000.00, 1, 15000000.00),
(30, 45, 15, 1600000.00, 1, 1600000.00),
(31, 46, 15, 1600000.00, 1, 1600000.00),
(32, 47, 15, 1600000.00, 1, 1600000.00),
(33, 48, 15, 1600000.00, 1, 1600000.00),
(34, 49, 15, 1600000.00, 1, 1600000.00),
(35, 50, 16, 12000000.00, 1, 12000000.00),
(36, 50, 14, 11500000.00, 1, 11500000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_gio_hangs`
--

CREATE TABLE `chi_tiet_gio_hangs` (
  `id` int NOT NULL,
  `gio_hang_id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `so_luong` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_gio_hangs`
--

INSERT INTO `chi_tiet_gio_hangs` (`id`, `gio_hang_id`, `san_pham_id`, `so_luong`) VALUES
(10, 3, 4, 1),
(11, 3, 6, 1),
(12, 3, 8, 2),
(13, 3, 3, 3),
(14, 4, 6, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuc_vus`
--

CREATE TABLE `chuc_vus` (
  `id` int NOT NULL,
  `ten_chuc_vu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_mucs`
--

CREATE TABLE `danh_mucs` (
  `id` int NOT NULL,
  `ten_danh_muc` varchar(255) NOT NULL,
  `mo_ta` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_mucs`
--

INSERT INTO `danh_mucs` (`id`, `ten_danh_muc`, `mo_ta`) VALUES
(5, 'Mèo Anh Lông Dài - Ngắn', ''),
(6, 'Mèo Chân Ngắn', ''),
(7, 'Mèo Tai Cụp', ''),
(8, 'Chó Phốc Sóc', ''),
(9, 'Chó Shiba', ''),
(10, 'Chó Pug Mặt Xệ', ''),
(11, 'Chó Đốm', ''),
(12, 'Chó Husky', ''),
(13, 'Mèo Ba Tư', ''),
(14, 'Mèo Golden', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hangs`
--

CREATE TABLE `don_hangs` (
  `id` int NOT NULL,
  `ma_don_hang` varchar(50) NOT NULL,
  `tai_khoan_id` int NOT NULL,
  `ten_nguoi_nhan` varchar(255) NOT NULL,
  `email_nguoi_nhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sdt_nguoi_nhan` varchar(15) NOT NULL,
  `dia_chi_nguoi_nhan` text NOT NULL,
  `ngay_dat` date NOT NULL,
  `tong_tien` decimal(12,2) NOT NULL,
  `ghi_chu` text,
  `phuong_thuc_thanh_toan_id` int NOT NULL,
  `trang_thai_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `don_hangs`
--

INSERT INTO `don_hangs` (`id`, `ma_don_hang`, `tai_khoan_id`, `ten_nguoi_nhan`, `email_nguoi_nhan`, `sdt_nguoi_nhan`, `dia_chi_nguoi_nhan`, `ngay_dat`, `tong_tien`, `ghi_chu`, `phuong_thuc_thanh_toan_id`, `trang_thai_id`) VALUES
(46, 'DH-46743', 8, 'Tuan Anh', 'hiendzml2301@gmail.com', '1234567890', 'Hà nội', '2025-08-15', 1640000.00, 'a', 1, 10),
(47, 'DH-501673', 8, 'Tuan Anh', 'hiendzml2301@gmail.com', '1234567890', 'Hà nội', '2025-08-15', 1640000.00, '', 1, 9),
(48, 'DH-394094', 8, 'Tuan Anh', 'hiendzml2301@gmail.com', '1234567890', 'Hà nội', '2025-08-15', 1640000.00, '123', 1, 5),
(49, 'DH-663125', 8, 'Tuan Anh', 'hiendzml2301@gmail.com', '1234567890', 'Hà nội', '2025-08-15', 1640000.00, 'a', 1, 11),
(50, 'DH-433571', 8, 'Tuan Anh', 'hiendzml2301@gmail.com', '1234567890', 'Hà nội', '2025-08-18', 23540000.00, 'a', 1, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hangs`
--

CREATE TABLE `gio_hangs` (
  `id` int NOT NULL,
  `tai_khoan_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `gio_hangs`
--

INSERT INTO `gio_hangs` (`id`, `tai_khoan_id`) VALUES
(4, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinh_anh_san_phams`
--

CREATE TABLE `hinh_anh_san_phams` (
  `id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `link_hinh_anh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `hinh_anh_san_phams`
--

INSERT INTO `hinh_anh_san_phams` (`id`, `san_pham_id`, `link_hinh_anh`) VALUES
(9, 3, './uploads/1754976814tay-ban-nha-vs-anh-chung-ket-euro-2024-9964jpg-17207537992602102455780.webp'),
(10, 3, './uploads/1754976814mbappe-real-madrid-1737327071993264331824.webp'),
(11, 6, './uploads/1727877219C2562-C13098-5.jpg'),
(12, 6, './uploads/1727877219C2562-C13098-2.jpg'),
(13, 6, './uploads/1727877219C2562-C13098-3.jpg'),
(14, 6, './uploads/1727877219C2562-C13098-4.jpg'),
(15, 4, './uploads/1727877189inr5f4qalj068szn2bs34qmv28r2_phoi-giong-meo-munchkin.webp'),
(16, 4, './uploads/1727877189meo-aln-ma-1227.jpg'),
(25, 14, './uploads/1755154807cho-phoc-soc-mau-vang-cam-ma-PS3229.jpg'),
(26, 15, './uploads/1755155214cho-shiba-Inu-ma-1938-1510x1133.jpg'),
(27, 15, './uploads/1755155214cho-shiba-Inu-mau-vang-trang-ma-1938-1510x1133.jpg'),
(28, 15, './uploads/1755155214cho-shiba-Inu-sieu-beo-ma-1938-1510x1133.jpg'),
(29, 16, './uploads/1755531549cho-alaska-ma-ALK2984.jpg'),
(30, 16, './uploads/1755531549cho-alaska-truong-thanh-mau-nau-do-ma-ALK2984.jpg'),
(31, 16, './uploads/1755531549cho-alska-mau-nau-do-ma-ALK2984.jpg'),
(32, 16, './uploads/1755531549cho-alska-truong-thanh-ma-ALK2984.jpg'),
(33, 17, './uploads/17555318211-lak-1615-1510x1883.jpg'),
(34, 17, './uploads/17555318212-lak-1615-1510x2013.jpg'),
(35, 17, './uploads/17555318213-lak-1615-1510x1819.jpg'),
(36, 18, './uploads/17555319841-shiba-ma-1240-1510x2265.jpg'),
(37, 18, './uploads/17555319842-shiba-ma-1240-1510x2265.jpg'),
(38, 18, './uploads/17555319843-shiba-ma-1240-1510x2265.jpg'),
(39, 19, './uploads/1755532113anh-cho-shiba-0020200303.jpg'),
(40, 19, './uploads/1755532113anh-cho-shiba-0020200303989987-1510x1090.jpg'),
(41, 20, './uploads/1755532302meo-anh-long-ngan-ma-ALN3281.jpg'),
(42, 20, './uploads/1755532302meo-anh-long-ngan-mau-bicolor-ma-ALN3281.jpg'),
(43, 21, './uploads/1755532500meo-anh-long-ngan-ma-ALN3278-1510x1733.jpg'),
(44, 21, './uploads/1755532500meo-anh-long-ngan-mau-lilac-ma-ALN3278-1510x2095.jpg'),
(45, 22, './uploads/1755532677anh-meo-ba-tu-292929.jpg'),
(46, 22, './uploads/1755532677anh-meo-ba-tu-29292988977.jpg'),
(47, 23, './uploads/1755532783meo-himalaya-90030303.jpg'),
(48, 24, './uploads/1755532956anh-meo-anh-long-ngan-023-1510x1660.jpg'),
(49, 24, './uploads/1755532956anh-meo-anh-long-ngan-10034-1510x1974.jpg'),
(50, 24, './uploads/1755532956anh-meo-anh-long-ngan-193003-1510x1703.jpg'),
(51, 24, './uploads/1755532956anh-meo-anh-long-ngan-0243556-1-1510x1240.jpg'),
(52, 25, './uploads/1755533108Meo-Golden-chan-ngan-tai-cup1809-1-1510x1581 (1).jpg'),
(53, 25, './uploads/1755533108Meo-Golden-chan-ngan-tai-cup1809-1-1510x1581.jpg'),
(54, 25, './uploads/1755533108Meo-Golden-chan-ngan-tai-cup1809-2-1510x1288.jpg'),
(55, 25, './uploads/1755533108Meo-Golden-chan-ngan-tai-cup1809-3-1510x1608.jpg'),
(56, 26, './uploads/1755533323meo-anh-long-dai-ma-ALD3206-1510x1820.jpg'),
(57, 26, './uploads/1755533323meo-anh-long-dai-mau-silver-ma-ALD3206-1510x1752.jpg'),
(58, 27, './uploads/1755533639meo-anh-long-dai-chan-lun-mau-golden-ma-ALD3242-1510x2013.jpg'),
(59, 27, './uploads/1755533639meo-anh-long-dai-ma-ALD3242-1510x2013.jpg'),
(60, 27, './uploads/1755533639meo-anh-long-dai-mau-golden-ma-ALD3242-1510x2013.jpg'),
(61, 28, './uploads/1755534197meo-himalaya-92002020208888.jpg'),
(62, 28, './uploads/1755534197meo-himalaya-9200202020878998.jpg'),
(63, 29, './uploads/1755534291meo-himalaya-9200202020.jpg'),
(64, 29, './uploads/1755534291meo-himalaya-9200202020990.jpg'),
(65, 30, './uploads/1755534648Cho-Dom-1805-duc-1.jpg'),
(66, 30, './uploads/1755534648Cho-Dom-1805-duc-2.jpg'),
(67, 30, './uploads/1755534648Cho-Dom-1805-duc-3.jpg'),
(68, 30, './uploads/1755534648Cho-Dom-1805-duc-4 (1).jpg'),
(69, 30, './uploads/1755534648Cho-Dom-1805-duc-4.jpg'),
(70, 31, './uploads/1755534761anh-cho-dom-0202020088824.jpg'),
(71, 31, './uploads/1755534761anh-cho-dom-0202020088899.jpg'),
(72, 32, './uploads/1755534881meo-himalaya-920020202000988.jpg'),
(73, 32, './uploads/1755534881meo-himalaya-92002020209000000-1510x2013.jpg'),
(74, 33, './uploads/1755534983anh-meo-ba-tu-3933030308899.jpg'),
(75, 33, './uploads/1755534983anh-meo-ba-tu-3933030309890.jpg'),
(76, 34, './uploads/1755535078anh-meo-ba-tu-9010-1510x1199.jpg'),
(77, 34, './uploads/1755535078anh-meo-ba-tu-929833-1510x1133.jpg'),
(78, 35, './uploads/1755535204meo-ba-tu-10300.jpg'),
(79, 36, './uploads/1755535371anh-meo-ba-tu-29292956.jpg'),
(80, 36, './uploads/1755535371anh-meo-ba-tu-2929299899.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuong_thuc_thanh_toans`
--

CREATE TABLE `phuong_thuc_thanh_toans` (
  `id` int NOT NULL,
  `ten_phuong_thuc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `phuong_thuc_thanh_toans`
--

INSERT INTO `phuong_thuc_thanh_toans` (`id`, `ten_phuong_thuc`) VALUES
(1, 'COD (Thanh Toán Khi Nhận Hàng)'),
(2, 'Thanh Toán VNPay');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_phams`
--

CREATE TABLE `san_phams` (
  `id` int NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `gia_san_pham` decimal(10,2) NOT NULL,
  `gia_khuyen_mai` decimal(10,2) DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `so_luong` int NOT NULL,
  `luot_xem` int DEFAULT '0',
  `ngay_nhap` date NOT NULL,
  `mo_ta` text,
  `danh_muc_id` int NOT NULL,
  `trang_thai` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `san_phams`
--

INSERT INTO `san_phams` (`id`, `ten_san_pham`, `gia_san_pham`, `gia_khuyen_mai`, `hinh_anh`, `so_luong`, `luot_xem`, `ngay_nhap`, `mo_ta`, `danh_muc_id`, `trang_thai`) VALUES
(3, 'Chó Phốc', 2000000.00, 1900000.00, './uploads/1754976822bat-ngo-voi-doi-ban-ve-dat-nhat-o-giai-ngoai-hang-anh-cropped-1753325834812.webp', 0, 0, '2024-09-28', 'Chó Phốc dễ thương', 1, 1),
(4, 'Mèo Munchkin', 12000000.00, 40000000.00, './uploads/175497889815-giong-cho-canh-dep-de-cham-soc-pho-bien-tai-viet-nam-202104121501444654.jpg', 14985, 0, '2024-09-29', 'Mèo chân ngắn dễ thương', 2, 1),
(6, 'Golden Retriever ', 21000000.00, 19000000.00, './uploads/1754978870z5795200891693-947e59216db90bc7b1ccc01ea0e735f5.webp', 50, 0, '2024-09-28', 'Golden Retriever là giống chó săn của Scotland có kích thước trung bình. Nó được đặc trưng bởi bản tính hiền lành và tình cảm cùng bộ lông vàng nổi bật.', 1, 1),
(14, 'Chó Phốc sóc màu vàng cam ', 12000000.00, 11500000.00, './uploads/1755154850cho-phoc-soc-ma-PS3229.jpg', 13, 0, '2025-08-11', 'Tháng tuổi:12 tháng tuổi\r\nGiới tính: Cái\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nTẩy giun: 1 lần\r\nĐặc điểm: Nhanh nhẹn', 8, 1),
(15, 'Chó Shiba Inu vàng trắng', 1600000.00, NULL, './uploads/1755155214cho-shiba-Inu-ma-1938-1510x1133.jpg', 24, 0, '2025-08-14', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Đực\r\nMàu: Vàng trắng\r\nTẩy giun: 1 lần\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nĐặc điểm: Lông ngắn, đáng yêu', 9, 1),
(16, 'Chó Husky trưởng thành màu nâu đỏ', 12000000.00, NULL, './uploads/1755531618cho-alska-truong-thanh-ma-ALK2984.jpg', 29, 0, '2025-08-16', 'Tháng tuổi: 10 tháng tuổi\r\nGiới tính: Đực\r\nMàu: Nâu Đỏ\r\nTẩy giun: 1 lần\r\n\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nĐặc điểm: Lông dày, năng động', 12, 1),
(17, 'Chó Shiba nâu đỏ ', 23000000.00, NULL, './uploads/17555318211-lak-1615-1510x1883.jpg', 18, 0, '2025-08-16', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Cái\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nĐặc điểm:Mặt bánh bao\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTiêm phòng: 1 mũi vacxin', 9, 1),
(18, 'Chó Shiba Inu blacktan', 25800000.00, NULL, './uploads/17555319841-shiba-ma-1240-1510x2265.jpg', 40, 0, '2025-08-16', 'Tháng tuổi: 3 tháng tuổ\r\nMàu: Blacktan\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTiêm phòng: 2 mũi vacxin\r\nĐặc điểm: Lông ngắn', 9, 1),
(19, 'Chó Shiba vàng trắng', 22000000.00, NULL, './uploads/1755532113anh-cho-shiba-0020200303989987-1510x1090.jpg', 14, 0, '2025-08-16', 'Tháng tuổi: 2 tháng tuổi\r\nMàu: Vàng trắng\r\nGiới tính: Đực\r\nTẩy giun: 2 lần\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nĐặc điểm: Lông dài', 9, 1),
(20, 'Mèo Anh Lông ngắn màu Bicolor', 6500000.00, NULL, './uploads/1755532302meo-anh-long-ngan-ma-ALN3281.jpg', 20, 0, '2025-08-17', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Cái\r\nMàu: Bicolor\r\nTẩy giun: 2 lần\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse	Đặc điểm: Mặt yêu\r\nTiêm phòng: 1 mũi vacxin', 5, 1),
(21, 'Mèo Anh lông ngắn màu lilac', 4500000.00, NULL, './uploads/1755532500meo-anh-long-ngan-mau-lilac-ma-ALN3278-1510x2095.jpg', 40, 0, '2025-08-17', 'Tháng tuổi: 2 tháng tuổ\r\nGiới tính: Đực\r\nMàu: Lilac\r\nTẩy giun: 1 lần\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse	Đặc điểm: Lông ngắn\r\n	Tiêm phòng: 1 mũi vacxin', 5, 1),
(22, 'Mèo Ba Tư Golden', 15000000.00, 14000000.00, './uploads/1755532677anh-meo-ba-tu-29292988977.jpg', 12, 0, '2025-08-16', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: ĐựcMàu: Golden	Sức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTẩy giun: 2 lần	Tiêm phòng: 1 mũi vacxin\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 13, 1),
(23, 'Mèo Ba Tư màu kem', 6000000.00, 5900000.00, './uploads/1755532783meo-himalaya-90030303.jpg', 34, 0, '2025-08-17', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Đực\r\nMàu: Kem	Sức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTẩy giun: 2 lần	Tiêm phòng: 1 mũi vacxin\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse	Đặc điểm: Lông dài', 13, 1),
(24, 'Mèo Anh lông ngắn Golden', 15000000.00, NULL, './uploads/1755532956anh-meo-anh-long-ngan-023-1510x1660.jpg', 23, 0, '2025-08-16', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Đực\r\nMàu: Golden\r\nTẩy giun: 2 lần\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nĐặc điểm: Lông ngắn\r\nTiêm phòng: 1 mũi vacxin', 14, 1),
(25, 'Mèo Golden chân lùn', 30000000.00, 28000000.00, './uploads/1755533108Meo-Golden-chan-ngan-tai-cup1809-3-1510x1608.jpg', 40, 0, '2025-08-15', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Cái\r\nMàu: Vàng\r\nTẩy giun: 1 lần\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTiêm phòng: 1 mũi vacxin\r\nĐặc điểm: Tai cụp, chân ngắn', 14, 1),
(26, 'Mèo Anh lông dài màu silver', 6000000.00, NULL, './uploads/1755533323meo-anh-long-dai-ma-ALD3206-1510x1820.jpg', 45, 0, '2025-08-16', 'Tháng tuổi: 3 tháng tuổi\r\nGiới tính: Cái\r\nMàu: Silver\r\nTẩy giun: 1 lần\r\nĐặc điểm: Lông dài\r\n	Tiêm phòng: 2 mũi vacxin\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 5, 1),
(27, 'Mèo Anh lông dài chân lùn màu golden', 26000000.00, 23000000.00, './uploads/1755533639meo-anh-long-dai-ma-ALD3242-1510x2013.jpg', 50, 0, '2025-08-15', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Đực\r\nMàu: Bicolor\r\nTẩy giun: 1 lần\r\n	Tiêm phòng: 1 mũi vacxin\r\nĐặc điểm: Hiền lành, chân lùn\r\nTẩy giun: 1 lần	Tiêm phòng: 1 mũi vacxin\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 6, 1),
(28, 'Mèo Himalaya Lilac', 25800000.00, NULL, './uploads/1755534197meo-himalaya-92002020208888.jpg', 35, 0, '2025-08-16', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Đực\r\nMàu: Lilac\r\nTẩy giun: 2 lần\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTiêm phòng: 1 mũi vacxin\r\nĐặc điểm: Lông dày\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 7, 1),
(29, 'Mèo Himalaya Lilac', 20000000.00, 18000000.00, './uploads/1755534291meo-himalaya-9200202020990.jpg', 20, 0, '2025-08-16', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Cái\r\nMàu: Lilac\r\nTẩy giun: 2 lần\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTiêm phòng: 1 mũi vacxin\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 7, 1),
(30, 'Chó Đốm đen trắng', 6000000.00, NULL, './uploads/1755534648Cho-Dom-1805-duc-3.jpg', 50, 0, '2025-08-15', 'Tháng tuổi: 3 tháng tuổi\r\nGiới tính: Đực\r\nMàu: Đen trắng\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTiêm phòng:1 mũi vacxin\r\nĐặc điểm: Lông ngắn, màu trắng đen\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 11, 1),
(31, 'Chó Đốm đen trắng', 5800000.00, 5000000.00, './uploads/1755534761anh-cho-dom-0202020088899.jpg', 67, 0, '2025-08-15', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Đực\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTiêm phòng:1 mũi vacxin\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 11, 1),
(32, 'Mèo Ba Tư vàng kem', 9000000.00, NULL, './uploads/1755534881meo-himalaya-92002020209000000-1510x2013.jpg', 49, 0, '2025-08-14', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Đực\r\nSức khỏe: Nhanh nhẹn, ăn uống tố\r\nMàu: Vàng kem\r\nTẩy giun: 2 lần\r\nĐặc điểm: Lông dài\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 13, 1),
(33, 'Mèo Ba Tư xám', 18600000.00, NULL, './uploads/1755534983anh-meo-ba-tu-3933030309890.jpg', 39, 0, '2025-08-15', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Cái\r\n	Sức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTẩy giun: 2 lần\r\nTiêm phòng: 1 mũi vacxin\r\nĐặc điểm: Lông dài\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 13, 1),
(34, 'Mèo Ba Tư vàng trắng', 9600000.00, NULL, './uploads/1755535078anh-meo-ba-tu-929833-1510x1133.jpg', 60, 0, '2025-08-14', 'Tháng tuổi: 2 tháng tuổi\r\nMàu: Vàng trắng\r\nGiới tính: Đực\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTiêm phòng: 1 mũi vacxin\r\nĐặc điểm: Lông dày\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 13, 1),
(35, 'Mèo Ba Tư màu đồi mồi', 6000000.00, NULL, './uploads/1755535204meo-ba-tu-10300.jpg', 10, 0, '2025-08-14', 'Tháng tuổi: 3 tháng tuổi\r\nGiới tính: Đực\r\nMàu: Đồi mồi\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\n	Tiêm phòng: 2 mũi vacxin\r\nTẩy giun: 2 lần\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 13, 1),
(36, 'Mèo Ba Tư trắng', 14500000.00, 13000000.00, './uploads/1755535371anh-meo-ba-tu-2929299899.jpg', 38, 0, '2025-08-15', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Đực\r\nMàu: Trắng\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt\r\nTẩy giun: 2 lần\r\nTiêm phòng: 1 mũi vacxin\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse', 13, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_khoans`
--

CREATE TABLE `tai_khoans` (
  `id` int NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gioi_tinh` tinyint(1) NOT NULL DEFAULT '1',
  `dia_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `chuc_vu_id` int DEFAULT NULL,
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tai_khoans`
--

INSERT INTO `tai_khoans` (`id`, `ho_ten`, `anh_dai_dien`, `ngay_sinh`, `email`, `so_dien_thoai`, `gioi_tinh`, `dia_chi`, `mat_khau`, `chuc_vu_id`, `trang_thai`) VALUES
(2, 'Gia hào', NULL, '2024-09-11', 'hao@gmail.com', '1234567890', 1, 'Số 1 thanh trì', '$2y$10$wmaREKm7ifjpbzRTFyXgmuumy/rve4mWN7r101KzSmGakPXc.h1di', 1, 1),
(4, 'Khách 1', NULL, '2015-09-15', 'user@gmail.com', '12345', 1, 'Số 123 tổ 321', '$2y$10$XiF9md54PLmD0wyYiB.rsenD/4lCyF60zzB7eZjlVyjkFjJqz0lPu', 2, 2),
(7, 'Administrator', NULL, NULL, 'admin@gmail.com', NULL, 1, NULL, '$2y$10$.57VOLNpOBqmbG82A0aUluYC3gcTWbIQ8qT6FRywbZvdL4a/2mOji', 1, 1),
(8, 'Tuan Anh', NULL, '2025-08-04', 'hiendzml2301@gmail.com', '1234567890', 1, 'Hà nội', '$2y$10$PA3.czEbODf.WLUM3SRMte1qRRtKmeXFcfdzEun9X9roIl13pTFPm', 2, 1),
(9, 'Tuan Anh', NULL, NULL, 'a@gmail.com', NULL, 1, NULL, '$2y$10$MUFxXx94gIzLHut7x1bDUelCEXCoi3CV1kPyOC7feO2FSityqTq6W', 2, 1),
(10, 'Khách 1', NULL, NULL, '1@gmail.com', NULL, 1, NULL, '$2y$10$McEpUVuUqiHxstVM9MlOjeNtDkGLtCrO0.79IS7QsJB3viiA8/rOO', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trang_thai_don_hangs`
--

CREATE TABLE `trang_thai_don_hangs` (
  `id` int NOT NULL,
  `ten_trang_thai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `trang_thai_don_hangs`
--

INSERT INTO `trang_thai_don_hangs` (`id`, `ten_trang_thai`) VALUES
(1, 'Chưa Xác Nhận'),
(2, 'Đã Xác Nhận'),
(3, 'Chưa Thanh Toán'),
(4, 'Đã Thanh Toán'),
(5, 'Đang Chuẩn Bị Hàng'),
(6, 'Đang Giao Hàng'),
(7, 'Đã Giao Hàng'),
(8, 'Đã Nhận Hàng'),
(9, 'Thành Công'),
(10, 'Hoàn Hàng'),
(11, 'Hủy Đơn');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chuc_vus`
--
ALTER TABLE `chuc_vus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danh_mucs`
--
ALTER TABLE `danh_mucs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `don_hangs`
--
ALTER TABLE `don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tai_khoans`
--
ALTER TABLE `tai_khoans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `chuc_vus`
--
ALTER TABLE `chuc_vus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danh_mucs`
--
ALTER TABLE `danh_mucs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `don_hangs`
--
ALTER TABLE `don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `tai_khoans`
--
ALTER TABLE `tai_khoans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
