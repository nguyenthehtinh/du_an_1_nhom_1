<?php

class TaiKhoan
{
    public $conn;

    public function __construct()
    {
        $this->conn = connectDB();
    }

    public function checkLogin($email, $mat_khau)
    {
        try {
            $sql = 'SELECT * FROM tai_khoans WHERE email = :email';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute(['email' => $email]);
            $user = $stmt->fetch();

            if ($user && password_verify($mat_khau, $user['mat_khau'])) {

                if ($user['chuc_vu_id'] == 2) {
                    if ($user['trang_thai'] == 1) {
                        //sửa  return $user['email']-> return $user thay vì trả lại 1 chuổi email thì trả lại 1 đối tượng user
                        return $user; // Trường Hợp đăng nhập thành công
                    } else {
                        return "Tài Khoản Bị Cấm";
                    }
                } else {
                    return "Tài Khoản Không Có Quyền Đăng Nhập";
                }
            } else {
                return "Bạn Nhập Sai Thông Tin Email Hoặc Mật Khẩu";
            }
        } catch (\Exception $e) {
            echo 'Lỗi' . $e->getMessage();
            return false;
        }
    }
    public function getTaiKhoanFromEmail($email)
    {
        try {
            $sql = "SELECT * FROM tai_khoans WHERE email = :email";

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ':email' => $email
            ]);

            return $stmt->fetch();
        } catch (\Exception $e) {
            echo 'Lỗi' . $e->getMessage();
        }
    }
 
  



    public function registerUser($ho_ten, $email, $mat_khau)
    {
        try {
            // Kiểm tra xem email đã tồn tại trong cơ sở dữ liệu chưa
            $sql = 'SELECT * FROM tai_khoans WHERE email = :email';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute(['email' => $email]);
            $user = $stmt->fetch();

            if ($user) {
                return "Email này đã được sử dụng."; // Trường hợp email đã tồn tại
            } else {
                // Mã hóa mật khẩu trước khi lưu
                $hashedPassword = password_hash($mat_khau, PASSWORD_BCRYPT);

                // Tạo tài khoản mới
                $sql = 'INSERT INTO tai_khoans (ho_ten, email, mat_khau, chuc_vu_id, trang_thai) 
                    VALUES (:ho_ten, :email, :mat_khau, :chuc_vu_id, :trang_thai)';
                $stmt = $this->conn->prepare($sql);

                // Chức vụ là 2 (khách hàng) và trạng thái là 1 (kích hoạt)
                $stmt->execute([
                    ':ho_ten' => $ho_ten,
                    ':email' => $email,
                    ':mat_khau' => $hashedPassword,
                    ':chuc_vu_id' => 2,
                    ':trang_thai' => 1
                ]);

                // Trả về thông báo thành công
                return "Đăng ký thành công";
            }
        } catch (\Exception $e) {
            error_log('Lỗi đăng ký: ' . $e->getMessage());
            return false;
        }
    }

    public function updatePassword($tai_khoan_id, $new_password)
    {
        try {
            $hashedPassword = password_hash($new_password, PASSWORD_BCRYPT);
            
            $sql = "UPDATE tai_khoans SET mat_khau = :mat_khau WHERE id = :id";
            $stmt = $this->conn->prepare($sql);
            
            $stmt->execute([
                ':mat_khau' => $hashedPassword,
                ':id' => $tai_khoan_id
            ]);
            
            return true;
        } catch (\Exception $e) {
            error_log('Lỗi cập nhật mật khẩu: ' . $e->getMessage());
            return false;
        }
    }

    public function verifyPassword($tai_khoan_id, $current_password)
    {
        try {
            $sql = "SELECT mat_khau FROM tai_khoans WHERE id = :id";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([':id' => $tai_khoan_id]);
            
            $user = $stmt->fetch();
            if ($user && password_verify($current_password, $user['mat_khau'])) {
                return true;
            }
            return false;
        } catch (\Exception $e) {
            error_log('Lỗi xác thực mật khẩu: ' . $e->getMessage());
            return false;
        }
    }

    public function updateProfile($tai_khoan_id, $ho_ten, $email)
    {
        try {
            $sql = "UPDATE tai_khoans SET ho_ten = :ho_ten, email = :email WHERE id = :id";
            $stmt = $this->conn->prepare($sql);
            
            $stmt->execute([
                ':ho_ten' => $ho_ten,
                ':email' => $email,
                ':id' => $tai_khoan_id
            ]);
            
            return true;
        } catch (\Exception $e) {
            error_log('Lỗi cập nhật thông tin: ' . $e->getMessage());
            return false;
        }
    }
}
