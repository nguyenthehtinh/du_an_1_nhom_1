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
            echo 'Lỗi' . $e->getMessage();
        }


     }
     // lịch sử đơn hàng 
     public function getDonHangByTaiKhoan($tai_khoan_id)
     {
        try {
            // sắp xếp theo ngày đặt giảm dần
            $sql = "SELECT * FROM don_hangs WHERE tai_khoan_id = :tai_khoan_id ORDER BY ngay_dat DESC";
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
}
