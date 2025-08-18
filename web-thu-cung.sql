-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th8 15, 2025 lúc 04:58 PM
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
(34, 49, 15, 1600000.00, 1, 1600000.00);

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
(5, 'Mèo Anh (Dài + Ngắn)', ''),
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
(46, 'DH-46743', 8, 'Tuan Anh', 'hiendzml2301@gmail.com', '1234567890', 'Hà nội', '2025-08-15', 1640000.00, 'a', 1, 9),
(47, 'DH-501673', 8, 'Tuan Anh', 'hiendzml2301@gmail.com', '1234567890', 'Hà nội', '2025-08-15', 1640000.00, '', 1, 9),
(48, 'DH-394094', 8, 'Tuan Anh', 'hiendzml2301@gmail.com', '1234567890', 'Hà nội', '2025-08-15', 1640000.00, '123', 1, 5),
(49, 'DH-663125', 8, 'Tuan Anh', 'hiendzml2301@gmail.com', '1234567890', 'Hà nội', '2025-08-15', 1640000.00, 'a', 1, 11);

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
(4, 4),
(27, 8);

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
(21, 13, './uploads/1755154485cho-phoc-soc-mini-mat-gau-mau-trang-ma-PS3267-1510x1133.jpg'),
(22, 13, './uploads/1755154509cho-phoc-soc-mini-mat-gau-mau-trang-ma-PS3267-1510x1133.jpg'),
(25, 14, './uploads/1755154807cho-phoc-soc-mau-vang-cam-ma-PS3229.jpg'),
(26, 15, './uploads/1755155214cho-shiba-Inu-ma-1938-1510x1133.jpg'),
(27, 15, './uploads/1755155214cho-shiba-Inu-mau-vang-trang-ma-1938-1510x1133.jpg'),
(28, 15, './uploads/1755155214cho-shiba-Inu-sieu-beo-ma-1938-1510x1133.jpg');

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
(13, 'Chó Phốc Sóc Vip mini mặt gấu màu trắng', 16000000.00, 15000000.00, './uploads/1755154900cho-phoc-soc-mini-mat-gau-mau-trang-ma-PS3267-1510x1133.jpg', 19, 0, '2025-08-08', 'Tháng tuổi: 2 tháng tuổi\r\nTẩy giun: 1 lần\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nTiêm phòng: 1 mũi vacxin\r\nSức khỏe: Nhanh nhẹn, ăn uống tốt', 8, 1),
(14, 'Chó Phốc sóc màu vàng cam ', 12000000.00, 11500000.00, './uploads/1755154850cho-phoc-soc-ma-PS3229.jpg', 14, 0, '2025-08-11', 'Tháng tuổi:12 tháng tuổi\r\nGiới tính: Cái\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nTẩy giun: 1 lần\r\nĐặc điểm: Nhanh nhẹn', 8, 1),
(15, 'Chó Shiba Inu vàng trắng', 1600000.00, NULL, './uploads/1755155214cho-shiba-Inu-ma-1938-1510x1133.jpg', 24, 0, '2025-08-14', 'Tháng tuổi: 2 tháng tuổi\r\nGiới tính: Đực\r\nMàu: Vàng trắng\r\nTẩy giun: 1 lần\r\nNguồn gốc: Thuần chủng, sinh sản tại Trại Pethouse\r\nĐặc điểm: Lông ngắn, đáng yêu', 9, 1);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
