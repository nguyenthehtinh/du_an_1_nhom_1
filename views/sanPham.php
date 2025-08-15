<?php require_once 'layout/header.php'; ?>
<?php require_once 'layout/menu.php'; ?>
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
                                <li class="breadcrumb-item active" aria-current="page">
                                    <?php if (isset($_GET['tu_khoa']) && !empty($_GET['tu_khoa'])): ?>
                                        Tìm kiếm: "<?= htmlspecialchars($_GET['tu_khoa']) ?>"
                                    <?php else: ?>
                                        Shop
                                    <?php endif; ?>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb area end -->

    <!-- page main wrapper start -->
    <div class="shop-main-wrapper section-padding">
        <div class="container">
            <div class="row">
                <!-- sidebar area start -->
                <div class="col-lg-3 order-2 order-lg-1">
                    <aside class="sidebar-wrapper">
                        <!-- single sidebar start -->
                        <div class="sidebar-single">
                            <h5 class="sidebar-title">Danh Mục</h5>
                            <div class="sidebar-body">
                                <ul class="shop-categories h6">
                                    <li>
                                        <a href="<?= BASE_URL . '?act=san-pham' ?>">
                                            Tất cả sản phẩm
                                        </a>
                                    </li>
                                    <?php foreach ($listDanhMuc as $danhMuc): ?>
                                        <li>
                                            <a href="<?= BASE_URL . '?act=tim-kiem&tu_khoa=' . urlencode($_GET['tu_khoa'] ?? '') . '&id_danh_muc=' . $danhMuc['id'] ?>">
                                                <?= $danhMuc['ten_danh_muc'] ?>
                                            </a>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        </div>
                        <!-- single sidebar end -->

                        <!-- single sidebar start -->
                        <div class="sidebar-banner mt-5">
                            <div class="img-container">
                                <a href="#">
                                    <img style="height: 288px; object-fit:cover" src="assets/img/banner/chomeo.jpg" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- single sidebar end -->
                    </aside>
                </div>
                <!-- sidebar area end -->

                <!-- shop main wrapper start -->
                <div class="col-9 order-1">
                    <div class="shop">
                        <!-- Hiển thị thông tin tìm kiếm -->
                        <?php if (isset($_GET['tu_khoa']) && !empty($_GET['tu_khoa'])): ?>
                            <div class="search-results-header mb-4">
                                <h4>Kết quả tìm kiếm cho: "<?= htmlspecialchars($_GET['tu_khoa']) ?>"</h4>
                                <p>Tìm thấy <?= count($listSanPham) ?> sản phẩm</p>
                                <a href="<?= BASE_URL . '?act=san-pham' ?>" class="btn btn-outline-secondary btn-sm">
                                    <i class="fa fa-arrow-left"></i> Xem tất cả sản phẩm
                                </a>
                            </div>
                        <?php endif; ?>

                        <!-- product item list wrapper start -->
                        <div class="row mbn-30 d-flex">
                            <?php if (empty($listSanPham)): ?>
                                <div class="col-12 text-center">
                                    <div class="no-results">
                                        <i class="fa fa-search fa-3x text-muted mb-3"></i>
                                        <h5>Không tìm thấy sản phẩm nào</h5>
                                        <p class="text-muted">
                                            <?php if (isset($_GET['tu_khoa']) && !empty($_GET['tu_khoa'])): ?>
                                                Không có sản phẩm nào phù hợp với từ khóa "<?= htmlspecialchars($_GET['tu_khoa']) ?>"
                                            <?php else: ?>
                                                Không có sản phẩm nào trong danh mục này
                                            <?php endif; ?>
                                        </p>
                                        <a href="<?= BASE_URL . '?act=san-pham' ?>" class="btn btn-primary">
                                            Xem tất cả sản phẩm
                                        </a>
                                    </div>
                                </div>
                            <?php else: ?>
                                <!-- product single item start -->
                                <?php foreach ($listSanPham as $sanPham): ?>
                                    <div class="col-md-3 col-sm-6 d-flex align-items-stretch">
                                        <!-- product grid start -->
                                        <div class="product-item">
                                            <figure class="product-thumb">
                                                <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id']; ?>">
                                                    <img class="pri-img" style="object-fit: cover; height: 300px;" 
                                                         src="<?= BASE_URL . ltrim($sanPham['hinh_anh'], './') ?>" 
                                                         alt="product"
                                                         onerror="this.onerror=null; this.src='<?= BASE_URL ?>uploads/ao.jpg'">
                                                </a>
                                                <div class="product-badge">
                                                    <?php if ($sanPham['gia_khuyen_mai']) { ?>
                                                        <div class="product-label discount">
                                                            <span>Giảm giá</span>
                                                        </div>
                                                    <?php } ?>
                                                </div>
                                            </figure>
                                            <div class="product-caption text-center">
                                                <h6 class="product-name">
                                                    <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id']; ?>"><?= htmlspecialchars($sanPham['ten_san_pham']) ?></a>
                                                </h6>
                                                <div class="price-box">
                                                    <?php if ($sanPham['gia_khuyen_mai']) { ?>
                                                        <span class="price-regular"><?= fomatPrice($sanPham['gia_khuyen_mai']) . "đ"; ?></span>
                                                        <span class="price-old"><del><?= fomatPrice($sanPham['gia_san_pham']) . "đ" ?></del></span>
                                                    <?php } else { ?>
                                                        <span class="price-regular"><?= fomatPrice($sanPham['gia_san_pham']) . "đ"; ?></span>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- product grid end -->
                                    </div>
                                <?php endforeach; ?>
                                <!-- product single item end -->
                            <?php endif; ?>
                        </div>
                        <!-- product item list wrapper end -->
                    </div>
                    <!-- shop main wrapper end -->
                </div>
            </div>
        </div>
    </div>
    <!-- page main wrapper end -->
</main>
<?php require_once "layout/miniCart.php"; ?>

<?php require_once "layout/footer.php"; ?>