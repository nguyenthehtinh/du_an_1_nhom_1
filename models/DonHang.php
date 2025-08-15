<?php 

class DonHang
{
    public $conn;
    public function __construct()
    {
        $this->conn = connectDB();
    }
     public function addDonHang($tai_khoan_id, $ten_nguoi_nhan, $email_nguoi_nhan, $sdt_nguoi_nhan, $dia_chi_nguoi_nhan, $ghi_chu, $tong_tien, $phuong_thuc_thanh_toan_id, $ngay_dat, $ma_don_hang, $trang_thai_id)
     {
        try {
            $sql = "INSERT INTO don_hangs(tai_khoan_id, ten_nguoi_nhan, email_nguoi_nhan, sdt_nguoi_nhan, dia_chi_nguoi_nhan, ghi_chu, tong_tien, phuong_thuc_thanh_toan_id, ngay_dat,ma_don_hang , trang_thai_id) 
            VALUES(:tai_khoan_id, :ten_nguoi_nhan, :email_nguoi_nhan, :sdt_nguoi_nhan, :dia_chi_nguoi_nhan, :ghi_chu, :tong_tien, :phuong_thuc_thanh_toan_id, :ngay_dat,:ma_don_hang , :trang_thai_id)";

            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                'tai_khoan_id' => $tai_khoan_id,
                'ten_nguoi_nhan' => $ten_nguoi_nhan,
                'email_nguoi_nhan' => $email_nguoi_nhan,
                'sdt_nguoi_nhan' => $sdt_nguoi_nhan,
                'dia_chi_nguoi_nhan' => $dia_chi_nguoi_nhan,
                'ghi_chu' => $ghi_chu,
                'tong_tien' => $tong_tien,
                'phuong_thuc_thanh_toan_id' => $phuong_thuc_thanh_toan_id,
                'ngay_dat' => $ngay_dat,
                'ma_don_hang' => $ma_don_hang,
                'trang_thai_id' => $trang_thai_id
            ]);


            return $this->conn->lastInsertId();
        } catch (Exception $e) {
            $message = $e->getMessage();
            error_log('[AddDonHang] ' . $message);
            return $message; // trả về thông báo lỗi để controller xử lý
        }


     }

     public function addChiTietDonHang($don_hang_id, $san_pham_id, $don_gia, $so_luong, $thanh_tien)
     {
        try {
            $sql = "INSERT INTO chi_tiet_don_hangs(don_hang_id, san_pham_id, don_gia, so_luong, thanh_tien) 
            VALUES(:don_hang_id, :san_pham_id, :don_gia, :so_luong, :thanh_tien)";

            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                'don_hang_id' => $don_hang_id,
                'san_pham_id' => $san_pham_id,
                'don_gia' => $don_gia,
                'so_luong' => $so_luong,
                'thanh_tien' => $thanh_tien
            ]);

            return true;
        } catch (Exception $e) {
            $message = $e->getMessage();
            error_log('[AddChiTietDonHang] ' . $message);
            return $message;
        }
     }
     // lịch sử đơn hàng 
     public function getDonHangByTaiKhoan($tai_khoan_id)
     {
        try {
            // sắp xếp theo ngày đặt giảm dần, ẩn các đơn đã hủy
            $sql = "SELECT * FROM don_hangs 
                    WHERE tai_khoan_id = :tai_khoan_id 
                      AND trang_thai_id <> 11 
                    ORDER BY ngay_dat DESC";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([':tai_khoan_id' => $tai_khoan_id]);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Lỗi truy vấn đơn hàng" . $e->getMessage());
            return[];
        }
     }

        public function getDonHangById($id)
        {
            try {
                $sql = "SELECT * FROM don_hangs WHERE id = :id";
                $stmt = $this->conn->prepare($sql);
                $stmt->execute([':id' => $id]);

                return $stmt->fetch(PDO::FETCH_ASSOC);
            } catch(Exception $e) {
                // ghi lại lỗi trả về null
                error_log('Lỗi: ' . $e->getMessage());
                    return null;
            }
        }

        public function getDetailSanPhamCuaDonHang($don_hang_id)
        {
            try {
                $sql = "SELECT chi_tiet_don_hangs.*, 
            san_phams.ten_san_pham, 
            san_phams.gia_san_pham 
             FROM chi_tiet_don_hangs
             INNER JOIN san_phams ON chi_tiet_don_hangs.san_pham_id = san_phams.id
             WHERE chi_tiet_don_hangs.don_hang_id = :don_hang_id";

            $stmt = $this->conn->prepare($sql);
            $stmt->execute([':don_hang_id' => $don_hang_id]);
            
            return $stmt->fetchAll();
            } catch (Exception $e) {
                echo 'Lỗi: ' . $e->getMessage();
            }
        }

        public function updateDonHang($id, $trang_thai_id) 
        {
            try {
                 $sql = "UPDATE don_hangs
                SET trang_thai_id = :trang_thai_id
                WHERE id = :id";

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ':trang_thai_id' => $trang_thai_id,
                ':id' => $id
            ]);

            return true;
        } catch (\Exception $e) {
            // Log lỗi hoặc hiển thị thông báo lỗi
            echo 'Lỗi: ' . $e->getMessage();
            }
        }

        public function deleteDonHang($id, $tai_khoan_id)
        {
            try {
                // Kiểm tra xem đơn hàng có thuộc về tài khoản này không
                $sql = "SELECT trang_thai_id FROM don_hangs WHERE id = :id AND tai_khoan_id = :tai_khoan_id";
                $stmt = $this->conn->prepare($sql);
                $stmt->execute([
                    ':id' => $id,
                    ':tai_khoan_id' => $tai_khoan_id
                ]);
                
                $donHang = $stmt->fetch(PDO::FETCH_ASSOC);
                
                if (!$donHang) {
                    return false; // Không tìm thấy đơn hàng hoặc không thuộc về tài khoản này
                }
                
                // Chỉ cho phép xóa đơn hàng đã thành công (trang_thai_id = 9)
                if ($donHang['trang_thai_id'] != 9) {
                    return false;
                }
                
                // Bắt đầu transaction
                $this->conn->beginTransaction();
                
                try {
                    // Xóa chi tiết đơn hàng trước
                    $sql = "DELETE FROM chi_tiet_don_hangs WHERE don_hang_id = :don_hang_id";
                    $stmt = $this->conn->prepare($sql);
                    $stmt->execute([':don_hang_id' => $id]);
                    
                    // Xóa đơn hàng
                    $sql = "DELETE FROM don_hangs WHERE id = :id";
                    $stmt = $this->conn->prepare($sql);
                    $stmt->execute([':id' => $id]);
                    
                    // Commit transaction
                    $this->conn->commit();
                    return true;
                    
                } catch (Exception $e) {
                    // Rollback nếu có lỗi
                    $this->conn->rollBack();
                    throw $e;
                }
                
            } catch (Exception $e) {
                error_log('Lỗi xóa đơn hàng: ' . $e->getMessage());
                return false;
            }
        }
}
