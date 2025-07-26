<?php require_once './views/layout/header.php'; ?>

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Thông tin cá nhân</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?php echo BASE_URL_ADMIN; ?>">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Thông tin cá nhân</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Thông tin cá nhân</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h5>Thông tin cơ bản</h5>
                                    <table class="table table-borderless">
                                        <tr>
                                            <th width="150">Tên quản trị:</th>
                                            <td><?php echo $quanTri['ten_quan_tri']; ?></td>
                                        </tr>
                                        <tr>
                                            <th>Email:</th>
                                            <td><?php echo $quanTri['email']; ?></td>
                                        </tr>
                                    </table>
                                </div>
                                
                                <div class="col-md-6">
                                    <h5>Đổi mật khẩu</h5>
                                    <form method="POST" action="<?php echo BASE_URL_ADMIN; ?>?act=sua-mat-khau-ca-nhan-quan-tri">
                                        <div class="form-group">
                                            <label for="mat_khau_cu">Mật khẩu cũ</label>
                                            <input type="password" class="form-control" id="mat_khau_cu" name="mat_khau_cu" required>
                                            <?php if (isset($error['mat_khau_cu'])): ?>
                                                <div class="text-danger"><?php echo $error['mat_khau_cu']; ?></div>
                                            <?php endif; ?>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="mat_khau_moi">Mật khẩu mới</label>
                                            <input type="password" class="form-control" id="mat_khau_moi" name="mat_khau_moi" required>
                                            <?php if (isset($error['mat_khau_moi'])): ?>
                                                <div class="text-danger"><?php echo $error['mat_khau_moi']; ?></div>
                                            <?php endif; ?>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="xac_nhan_mat_khau_moi">Xác nhận mật khẩu mới</label>
                                            <input type="password" class="form-control" id="xac_nhan_mat_khau_moi" name="xac_nhan_mat_khau_moi" required>
                                            <?php if (isset($error['xac_nhan_mat_khau_moi'])): ?>
                                                <div class="text-danger"><?php echo $error['xac_nhan_mat_khau_moi']; ?></div>
                                            <?php endif; ?>
                                        </div>
                                        
                                        <button type="submit" class="btn btn-primary">Cập nhật mật khẩu</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php require_once './views/layout/footer.php'; ?>
