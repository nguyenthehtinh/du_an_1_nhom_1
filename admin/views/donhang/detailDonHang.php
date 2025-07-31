<!-- Hader  -->
<?php include 'views/layout/header.php'; ?>
<!-- End Header  -->
<!-- Navbar -->
<?php include 'views/layout/navbar.php'; ?>
<!-- End Navbar -->
<!-- Main Slidebar container -->
<?php include 'views/layout/sidebar.php'; ?>
<!-- content wapper. contains page content -->
<div class="content-wrapper">
    <!-- content Header (Page header) -->
    <section class = "content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-9">
                    <h1>Quản Lý Danh Sách Đơn Hàng - Đơn Hàng: <?= $donHang['ma_don_hang']?></h1>
                </div>
                    <div class="col-sm-3">
                        <form action="<?= BASE_URL_ADMIN .'?act=sua-don-hang'?> "method="POST">
                            <div class="d-flex justifi-content-betwen align-items-center">
                            <div class="d-flex justify-content-betwen me-4">
                                <div>
                                    <input type="hidden" name="don_hang_id" value="<?= $donHang['id']?>">
                                    <select name="trang_thai_id" class="form-control">
                                        <?php foreach ($listTrangThaiDonHang as $trangThai): ?>
                                            <option value="<?= $trangThai['id'] ?>" 
                                                <?= $donHang['trang_thai_id'] > $trangThai['id'] || in_array($donHang['trang_thai_id'],[9,10,11]) ? 'hidden' : '' ?>>
                                                <?= $trangThai['id'] == $donHang['trang_thai_id'] ? 'selected' : ''?>
                                                <option value="<?= $trangThai['id'] ?>" <?= $trangThai['id'] == $donHang['trang_thai_id'] ? 'selected' : '' ?> <?= $donHang['trang_thai_id']>$trangThai['id'] || in_array($donHang['trang_thai_id'], [9,10,11]) ? 'hidden' : ''?>>
                                                <?= $trangThai['ten_trang_thai'] ?>
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div>
                                    <button type="submit" class="btn btn-secondary" style="margin-left:20px"> Cập Nhật</button>
                                    <button type="submit" class="btn btn-secondary"> Cập Nhật</button>
                                </div>    
                            </div>
                        </form>
                </div>
            </div>
        </div > <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="cotainer-fluid">
            <div class="row">
                <div class = "col-12"></div>
            </div>
        </div>
    </section>

</div>
















