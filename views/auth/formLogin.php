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
                                <li class="breadcrumb-item active" aria-current="page">Login/Register</li>
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
                    <!-- Login Content Start -->
                    <div class="col-lg-12">
                        <div class="login-reg-form-wrap">
                            <h5 class="text-center">Đăng Nhập</h5>

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
                            <?php else: ?>
                                <p class="login-box-msg text-center">Vui Lòng Đăng Nhập</p>
                            <?php endif; ?>

                            <form action="<?= BASE_URL . '?act=check-login' ?>" method="POST">
                                <div class="single-input-item">
                                    <input type="email" placeholder="Email" name="email" required />
                                </div>
                                <div class="single-input-item">
                                    <input type="password" placeholder="Nhập mật khẩu" name="password" required />
                                </div>
                                <div class="single-input-item">
                                    <div class="login-reg-form-meta d-flex align-items-center justify-content-between">
                                        <a href="#" class="forget-pwd">Quên Mật Khẩu?</a>
                                    </div>
                                </div>
                                <div class="single-input-item">
                                    <button class="btn btn-sqr">Đăng Nhập</button>
                                    <a href="<?= BASE_URL . "?act=register" ?>" class="btn btn-sqr">Đăng Kí Tài Khoản Mới</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Login Content End -->
                </div>
            </div>
        </div>
    </div>
    <!-- login register wrapper end -->
</main>

<?php require_once 'views/layout/footer.php'; ?>