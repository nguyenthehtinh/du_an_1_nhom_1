-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 26, 2025 lúc 04:47 PM
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
  `id_binh_luan` int NOT NULL,
  `id_san_pham` int DEFAULT NULL,
  `id_tai_khoan` int DEFAULT NULL,
  `noi_dung` text NOT NULL,
  `ngay_dang` date NOT NULL,
  `trang_thai` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_don_hangs`
--

CREATE TABLE `chi_tiet_don_hangs` (
  `id_chi_tiet_don_hang` int NOT NULL,
  `id_don_hang` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  `don_gia` decimal(10,2) NOT NULL,
  `so_luong` int NOT NULL,
  `thanh_tien` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_gio_hangs`
--

CREATE TABLE `chi_tiet_gio_hangs` (
  `id_chi_tiet_gio_hang` int NOT NULL,
  `id_gio_hang` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  `so_luong` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuc_vus`
--

CREATE TABLE `chuc_vus` (
  `id_chuc_vu` int NOT NULL,
  `ten_chuc_vu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_mucs`
--

CREATE TABLE `danh_mucs` (
  `id_danh_muc` int NOT NULL,
  `ten_danh_muc` varchar(255) NOT NULL,
  `mo_ta` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_mucs`
--

INSERT INTO `danh_mucs` (`id_danh_muc`, `ten_danh_muc`, `mo_ta`) VALUES
(1, 'Chó Con', 'Danh mục Chó Con'),
(2, 'Mèo Con', 'Danh mục Mèo Con');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hangs`
--

CREATE TABLE `don_hangs` (
  `id_don_hang` int NOT NULL,
  `ma_don_hang` varchar(50) NOT NULL,
  `id_tai_khoan` int DEFAULT NULL,
  `ten_nguoi_nhan` varchar(255) NOT NULL,
  `email_nguoi_nhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sdt_nguoi_nhan` varchar(15) NOT NULL,
  `dia_chi_nguoi_nhan` text NOT NULL,
  `ngay_dat` date NOT NULL,
  `tong_tien` decimal(10,2) NOT NULL,
  `ghi_chu` text,
  `id_phuong_thuc_thanh_toan` int DEFAULT NULL,
  `id_trang_thai_don_hang` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hangs`
--

CREATE TABLE `gio_hangs` (
  `id_gio_hang` int NOT NULL,
  `id_tai_khoan` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinh_anh_san_phams`
--

CREATE TABLE `hinh_anh_san_phams` (
  `id_hinh_anh` int NOT NULL,
  `id_san_pham` int DEFAULT NULL,
  `link_hinh_anh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `hinh_anh_san_phams`
--

INSERT INTO `hinh_anh_san_phams` (`id_hinh_anh`, `id_san_pham`, `link_hinh_anh`) VALUES
(4, 8, './uploads/1727877258anh-meo-anh-long-dai-01823.jpg'),
(5, 8, './uploads/1727877258anh-meo-anh-long-dai-049202.jpg'),
(9, 3, './uploads/1727877150tải xuống.jpg'),
(10, 3, './uploads/1727877150anh-cho-phoc-huou-9902020207677.jpg'),
(11, 6, './uploads/1727877219C2562-C13098-5.jpg'),
(12, 6, './uploads/1727877219C2562-C13098-2.jpg'),
(13, 6, './uploads/1727877219C2562-C13098-3.jpg'),
(14, 6, './uploads/1727877219C2562-C13098-4.jpg'),
(15, 4, './uploads/1727877189inr5f4qalj068szn2bs34qmv28r2_phoi-giong-meo-munchkin.webp'),
(16, 4, './uploads/1727877189meo-aln-ma-1227.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuong_thuc_thanh_toans`
--

CREATE TABLE `phuong_thuc_thanh_toans` (
  `id_phuong_thuc_thanh_toan` int NOT NULL,
  `ten_phuong_thuc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `phuong_thuc_thanh_toans`
--

INSERT INTO `phuong_thuc_thanh_toans` (`id_phuong_thuc_thanh_toan`, `ten_phuong_thuc`) VALUES
(1, 'COD (Thanh Toán Khi Nhận Hàng)'),
(2, 'Thanh Toán VNPay');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_phams`
--

CREATE TABLE `san_phams` (
  `id_san_pham` int NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `gia_san_pham` decimal(10,2) NOT NULL,
  `gia_khuyen_mai` decimal(10,2) DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `so_luong` int NOT NULL,
  `luot_xem` int DEFAULT '0',
  `ngay_nhap` date NOT NULL,
  `mo_ta` text,
  `id_danh_muc` int DEFAULT NULL,
  `trang_thai` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `san_phams`
--

INSERT INTO `san_phams` (`id_san_pham`, `ten_san_pham`, `gia_san_pham`, `gia_khuyen_mai`, `hinh_anh`, `so_luong`, `luot_xem`, `ngay_nhap`, `mo_ta`, `id_danh_muc`, `trang_thai`) VALUES
(3, 'Chó Phốc', 2000000.00, 1900000.00, './uploads/1727877156tải xuống.jpg', 1, 0, '2024-09-28', 'Chó Phốc dễ thương', 1, 1),
(4, 'Mèo Munchkin', 12000000.00, 40000000.00, './uploads/1727877173meo-aln-ma-1227.jpg', 1, 0, '2024-09-29', 'Mèo chân ngắn dễ thương', 2, 1),
(6, 'Golden Retriever ', 21000000.00, 19000000.00, './uploads/1727877226C2562-C13098-2.jpg', 1, 0, '2024-09-28', 'Golden Retriever là giống chó săn của Scotland có kích thước trung bình. Nó được đặc trưng bởi bản tính hiền lành và tình cảm cùng bộ lông vàng nổi bật.', 1, 1),
(8, 'Mèo Anh Lông Đài', 5000000.00, 4900000.00, './uploads/1727877267anh-meo-anh-long-dai-049202.jpg', 1, 0, '2024-09-24', 'Nguồn gốc của nòi mèo này là một giống mèo Anh có lông dài. Giống mèo thủy tổ này sau nhiều đời lai với những giống mèo lông dài ngoại nhập khác đã hấp thu nhiều yếu tố di truyền của các nòi mèo lông dài ở Ba Tư và hình thành kiểu hình với bộ lông dài và dày đặc trưng - thậm chí còn dày hơn cả những con mèo Ba Tư nguyên thủy.', 2, 1),
(99, 'Sản phẩm tạm để tạo khóa ngoại', 100000.00, NULL, NULL, 1, 0, '2025-07-26', 'Tạo để tránh lỗi FOREIGN KEY', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_khoans`
--

CREATE TABLE `tai_khoans` (
  `id_tai_khoan` int NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gioi_tinh` tinyint(1) NOT NULL DEFAULT '1',
  `dia_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_chuc_vu` int DEFAULT NULL,
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trang_thai_don_hangs`
--

CREATE TABLE `trang_thai_don_hangs` (
  `id_trang_thai_don_hang` int NOT NULL,
  `ten_trang_thai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `trang_thai_don_hangs`
--

INSERT INTO `trang_thai_don_hangs` (`id_trang_thai_don_hang`, `ten_trang_thai`) VALUES
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
  ADD PRIMARY KEY (`id_binh_luan`),
  ADD KEY `fk_binh_luans_id_san_pham` (`id_san_pham`),
  ADD KEY `fk_binh_luans_id_tai_khoan` (`id_tai_khoan`);

--
-- Chỉ mục cho bảng `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  ADD PRIMARY KEY (`id_chi_tiet_don_hang`),
  ADD KEY `fk_chi_tiet_don_hangs_id_don_hang` (`id_don_hang`),
  ADD KEY `fk_chi_tiet_don_hangs_id_san_pham` (`id_san_pham`);

--
-- Chỉ mục cho bảng `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  ADD PRIMARY KEY (`id_chi_tiet_gio_hang`),
  ADD KEY `fk_chi_tiet_gio_hangs_id_gio_hang` (`id_gio_hang`);

--
-- Chỉ mục cho bảng `chuc_vus`
--
ALTER TABLE `chuc_vus`
  ADD PRIMARY KEY (`id_chuc_vu`);

--
-- Chỉ mục cho bảng `danh_mucs`
--
ALTER TABLE `danh_mucs`
  ADD PRIMARY KEY (`id_danh_muc`);

--
-- Chỉ mục cho bảng `don_hangs`
--
ALTER TABLE `don_hangs`
  ADD PRIMARY KEY (`id_don_hang`),
  ADD KEY `fk_don_hangs_id_tai_khoan` (`id_tai_khoan`),
  ADD KEY `fk_don_hangs_id_phuong_thuc_thanh_toan` (`id_phuong_thuc_thanh_toan`),
  ADD KEY `fk_don_hangs_id_trang_thai` (`id_trang_thai_don_hang`);

--
-- Chỉ mục cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  ADD PRIMARY KEY (`id_gio_hang`),
  ADD KEY `fk_gio_hangs_id_tai_khoan` (`id_tai_khoan`);

--
-- Chỉ mục cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  ADD PRIMARY KEY (`id_hinh_anh`),
  ADD KEY `fk_hinh_anh_san_phams_id_san_pham` (`id_san_pham`);

--
-- Chỉ mục cho bảng `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  ADD PRIMARY KEY (`id_phuong_thuc_thanh_toan`);

--
-- Chỉ mục cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  ADD PRIMARY KEY (`id_san_pham`),
  ADD KEY `fk_san_phams_id_danh_muc` (`id_danh_muc`);

--
-- Chỉ mục cho bảng `tai_khoans`
--
ALTER TABLE `tai_khoans`
  ADD PRIMARY KEY (`id_tai_khoan`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_tai_khoans_id_chuc_vu` (`id_chuc_vu`);

--
-- Chỉ mục cho bảng `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  ADD PRIMARY KEY (`id_trang_thai_don_hang`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  MODIFY `id_binh_luan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  MODIFY `id_chi_tiet_don_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  MODIFY `id_chi_tiet_gio_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `chuc_vus`
--
ALTER TABLE `chuc_vus`
  MODIFY `id_chuc_vu` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danh_mucs`
--
ALTER TABLE `danh_mucs`
  MODIFY `id_danh_muc` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `don_hangs`
--
ALTER TABLE `don_hangs`
  MODIFY `id_don_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  MODIFY `id_gio_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  MODIFY `id_hinh_anh` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  MODIFY `id_phuong_thuc_thanh_toan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  MODIFY `id_san_pham` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT cho bảng `tai_khoans`
--
ALTER TABLE `tai_khoans`
  MODIFY `id_tai_khoan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  MODIFY `id_trang_thai_don_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD CONSTRAINT `fk_binh_luans_id_san_pham` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`),
  ADD CONSTRAINT `fk_binh_luans_id_tai_khoan` FOREIGN KEY (`id_tai_khoan`) REFERENCES `tai_khoans` (`id_tai_khoan`);

--
-- Ràng buộc cho bảng `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  ADD CONSTRAINT `fk_chi_tiet_don_hangs_id_don_hang` FOREIGN KEY (`id_don_hang`) REFERENCES `don_hangs` (`id_don_hang`),
  ADD CONSTRAINT `fk_chi_tiet_don_hangs_id_san_pham` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`),
  ADD CONSTRAINT `fk_ctdh_san_pham` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`);

--
-- Ràng buộc cho bảng `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  ADD CONSTRAINT `fk_chi_tiet_gio_hangs_id_gio_hang` FOREIGN KEY (`id_gio_hang`) REFERENCES `gio_hangs` (`id_gio_hang`);

--
-- Ràng buộc cho bảng `don_hangs`
--
ALTER TABLE `don_hangs`
  ADD CONSTRAINT `fk_don_hangs_id_phuong_thuc_thanh_toan` FOREIGN KEY (`id_phuong_thuc_thanh_toan`) REFERENCES `phuong_thuc_thanh_toans` (`id_phuong_thuc_thanh_toan`),
  ADD CONSTRAINT `fk_don_hangs_id_tai_khoan` FOREIGN KEY (`id_tai_khoan`) REFERENCES `tai_khoans` (`id_tai_khoan`),
  ADD CONSTRAINT `fk_don_hangs_id_trang_thai` FOREIGN KEY (`id_trang_thai_don_hang`) REFERENCES `trang_thai_don_hangs` (`id_trang_thai_don_hang`);

--
-- Ràng buộc cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  ADD CONSTRAINT `fk_gio_hangs_id_tai_khoan` FOREIGN KEY (`id_tai_khoan`) REFERENCES `tai_khoans` (`id_tai_khoan`);

--
-- Ràng buộc cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  ADD CONSTRAINT `fk_hinh_anh_san_phams_id_san_pham` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`);

--
-- Ràng buộc cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  ADD CONSTRAINT `fk_san_phams_id_danh_muc` FOREIGN KEY (`id_danh_muc`) REFERENCES `danh_mucs` (`id_danh_muc`);

--
-- Ràng buộc cho bảng `tai_khoans`
--
ALTER TABLE `tai_khoans`
  ADD CONSTRAINT `fk_tai_khoans_id_chuc_vu` FOREIGN KEY (`id_chuc_vu`) REFERENCES `chuc_vus` (`id_chuc_vu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
