<?php require_once 'views/layout/header.php'; ?>
<?php require_once 'views/layout/menu.php'; ?>

<main>
    <!-- breadcrumb area start -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?= BASE_URL ?>"><i class="fa fa-home"></i></a></li>
                                <li class="breadcrumb-item active" aria-current="page">Register</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb area end -->

    <!-- login register wrapper start -->
    <div class="login-register-wrapper section-padding">
        <div class="container" style="max-width: 40vw;">
            <div class="member-area-from-wrap">
                <div class="row">
                    <!-- Register Content Start -->
                    <div class="col-lg-12">
                        <div class="login-reg-form-wrap">
                            <h5 class="text-center">Đăng Ký Tài Khoản</h5>

                            <!-- Hiển thị thông báo lỗi -->
                            <?php if (isset($_SESSION['error'])): ?>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <i class="fa fa-exclamation-circle"></i>
                                    <?php
                                    if (is_array($_SESSION['error'])) {
                                        echo htmlspecialchars(implode("<br>", $_SESSION['error']));
                                    } elseif (is_object($_SESSION['error'])) {
                                        echo htmlspecialchars((string)$_SESSION['error']);
                                    } else {
                                        echo htmlspecialchars((string)$_SESSION['error']);
                                    }
                                    ?>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                                <?php unset($_SESSION['error']); ?>
                            <?php endif; ?>

                            <!-- Hiển thị thông báo thành công -->
                            <?php if (isset($_SESSION['success'])): ?>
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <i class="fa fa-check-circle"></i> <?= htmlspecialchars($_SESSION['success']) ?>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                                <?php unset($_SESSION['success']); ?>
                            <?php else: ?>
                                <p class="login-box-msg text-center">Vui Lòng Điền Thông Tin</p>
                            <?php endif; ?>

                            <form action="<?= BASE_URL . '?act=check-register' ?>" method="POST">
                                <div class="single-input-item">
                                    <input type="text" placeholder="Họ Tên" name="ho_ten" required />
                                </div>
                                <div class="single-input-item">
                                    <input type="email" placeholder="Email" name="email" required />
                                </div>
                                <div class="single-input-item">
                                    <input type="password" placeholder="Nhập mật khẩu" name="mat_khau" required />
                                </div>
                                <div class="single-input-item">
                                    <input type="password" placeholder="Xác nhận mật khẩu" name="confirm_password" required />
                                </div>
                                <div class="single-input-item">
                                    <button type="submit" class="btn btn-sqr">Đăng Ký</button>
                                    <a href="<?= BASE_URL . "?act=login" ?>" class="btn btn-sqr">Quay Lại Đăng Nhập</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Register Content End -->
                </div>
            </div>
        </div>
    </div>
    <!-- login register wrapper end -->
</main>

<?php require_once 'views/layout/footer.php'; ?>