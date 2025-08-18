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
                                <li class="breadcrumb-item"><a href="<?= BASE_URL ?>"><i class="fa fa-home"></i></a>
                                </li>
                                <li class="breadcrumb-item"><a href="shop.html">Sản Phẩm</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Chi Tiết Sản Phẩm</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb area end -->

    <!-- page main wrapper start -->
    <div class="shop-main-wrapper section-padding pb-0">
        <div class="container">
            <div class="row">
                <!-- product details wrapper start -->
                <div class="col-lg-12 order-1 order-lg-2">
                    <!-- product details inner end -->
                    <div class="product-details-inner">
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="product-large-slider">
                                    <?php foreach ($listAnhSanPham as $key => $anhSanPham): ?>
                                        <div class="pro-large-img img-zoom">
                                            <img src="<?= BASE_URL . ltrim($anhSanPham['link_hinh_anh'], './') ?>"
                                                alt="product-details" 
                                                onerror="this.onerror=null; this.src='<?= BASE_URL ?>uploads/ao.jpg'" />
                                        </div>
                                    <?php endforeach ?>
                                </div>
                                <div class="pro-nav slick-row-10 slick-arrow-style">
                                    <?php foreach ($listAnhSanPham as $key => $anhSanPham): ?>
                                        <div class="pro-nav-thumb">
                                            <img src="<?= BASE_URL . ltrim($anhSanPham['link_hinh_anh'], './') ?>"
                                                alt="product-details" 
                                                onerror="this.onerror=null; this.src='<?= BASE_URL ?>uploads/ao.jpg'" />
                                        </div>
                                    <?php endforeach ?>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <div class="product-details-des">
                                    <div class="manufacturer-name">
                                        <a href="#"><?= $sanPham['ten_danh_muc'] ?></a>
                                    </div>
                                    <h3 class="product-name d-flex align-items-center justify-content-between">
                                        <span><?= $sanPham['ten_san_pham'] ?></span>
                                        <?php 
                                            $hasDiscount = (!empty($sanPham['gia_khuyen_mai']) && (float)$sanPham['gia_khuyen_mai'] > 0 && (float)$sanPham['gia_khuyen_mai'] < (float)$sanPham['gia_san_pham']);
                                            $discountPercent = $hasDiscount ? max(1, round(100 - ($sanPham['gia_khuyen_mai'] / $sanPham['gia_san_pham']) * 100)) : 0;
                                            $savingAmount = $hasDiscount ? ((float)$sanPham['gia_san_pham'] - (float)$sanPham['gia_khuyen_mai']) : 0;
                                        ?>
                                        <?php if ($hasDiscount) { ?>
                                            <span class="badge bg-danger" style="font-size:14px">-<?= $discountPercent ?>%</span>
                                        <?php } ?>
                                    </h3>
                                    <div class="ratings d-flex">
                                        <div class="pro-review">
                                            <?php $countComment = count($listBinhLuan); ?>
                                            <span><?= $countComment . ' Bình Luận' ?> </span>
                                        </div>
                                    </div>
                                    <div class="price-box" style="margin-bottom:10px">
                                        <?php if ($hasDiscount) { ?>
                                            <span class="price-regular" style="font-size:22px; color:#e74c3c; font-weight:700">
                                                <?= fomatPrice($sanPham['gia_khuyen_mai']) . "đ"; ?>
                                            </span>
                                            <span class="price-old" style="margin-left:8px"><del><?= fomatPrice($sanPham['gia_san_pham']) . "đ" ?></del></span>
                                            <div style="font-size:13px; color:#27ae60; margin-top:4px">Tiết kiệm <?= fomatPrice($savingAmount) . "đ"; ?></div>
                                        <?php } else { ?>
                                            <span class="price-regular" style="font-size:22px; font-weight:700">
                                                <?= fomatPrice($sanPham['gia_san_pham']) . "đ"; ?>
                                            </span>
                                        <?php } ?>
                                    </div>
                                    <div class="availability">
                                        <?php if ((int)$sanPham['so_luong'] > 0): ?>
                                            <span class="badge" style="background:#e9f9ee; color:#27ae60; padding:8px 12px; border-radius:20px"><i class="fa fa-check-circle"></i> Còn <?= (int)$sanPham['so_luong'] ?> sản phẩm</span>
                                        <?php else: ?>
                                            <span class="badge" style="background:#fdecea; color:#e74c3c; padding:8px 12px; border-radius:20px"><i class="fa fa-times-circle"></i> Hết hàng</span>
                                        <?php endif; ?>
                                    </div>
                                    <?php 
                                        $moTaRaw = trim($sanPham['mo_ta'] ?? '');
                                        $moTaLines = preg_split("/\r\n|\r|\n/", $moTaRaw);
                                        $moTaLines = array_map('trim', is_array($moTaLines) ? $moTaLines : []);
                                        if (empty(array_filter($moTaLines))) {
                                            $moTaLines = array_map('trim', explode('.', $moTaRaw));
                                        }
                                        $moTaPreview = array_slice(array_values(array_filter($moTaLines, function($s){ return $s !== ''; })), 0, 6);
                                    ?>
                                    <?php if (!empty($moTaPreview)): ?>
                                        <div class="pro-desc" style="background:#f9fbfd;border:1px solid #eef2f7;border-radius:8px;padding:12px 14px;margin-top:10px">
                                            <ul style="margin:0;padding-left:18px;list-style:none">
                                                <?php foreach ($moTaPreview as $item): ?>
                                                    <li style="margin:6px 0;display:flex;align-items:flex-start;gap:8px">
                                                        <i class="fa fa-check-circle" style="color:#27ae60;margin-top:3px"></i>
                                                        <span><?= htmlspecialchars($item) ?></span>
                                                    </li>
                                                <?php endforeach; ?>
                                            </ul>
                                        </div>
                                    <?php elseif (!empty($moTaRaw)): ?>
                                        <p class="pro-desc"><?= htmlspecialchars($moTaRaw) ?></p>
                                    <?php endif; ?>
                                    <form action="<?= BASE_URL . "?act=them-gio-hang" ?>" method="post">
                                        <div class="quantity-cart-box d-flex align-items-center">
                                            <h6 class="option-title">Số Lượng:</h6>
                                            <div class="quantity d-flex align-items-center" style="gap:8px">
                                                <input type="hidden" name="san_pham_id" value="<?= $sanPham['id'] ?>">
                                                <button type="button" class="qty-btn" data-type="minus" style="width:36px;height:36px;border:1px solid #ddd;background:#f9f9f9">-</button>
                                                <input id="qty-input" type="number" min="1" max="<?= (int)$sanPham['so_luong'] ?>" value="1" name="so_luong" style="width:70px;text-align:center" <?= (int)$sanPham['so_luong'] <= 0 ? 'disabled' : '' ?>>
                                                <button type="button" class="qty-btn" data-type="plus" style="width:36px;height:36px;border:1px solid #ddd;background:#f9f9f9">+</button>
                                            </div>
                                            <div class="action_link">
                                                <button class="btn btn-cart2" <?= (int)$sanPham['so_luong'] <= 0 ? 'disabled' : '' ?>>Thêm giỏ hàng</button>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="mt-3" style="display:flex;gap:20px;flex-wrap:wrap">
                                        <div style="display:flex;align-items:center;gap:8px"><i class="fa fa-truck"></i> <span>Giao hàng nhanh 2-4 ngày</span></div>
                                        <div style="display:flex;align-items:center;gap:8px"><i class="fa fa-shield"></i> <span>Bảo hành sức khỏe 7 ngày</span></div>
                                        <div style="display:flex;align-items:center;gap:8px"><i class="fa fa-undo"></i> <span>Đổi trả khi lỗi</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- product details inner end -->

                    <!-- product details reviews start -->
                    <div class="product-details-reviews section-padding pb-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="product-review-info">
                                    <ul class="nav review-tab">
                                        <li>
                                            <a class="active" data-bs-toggle="tab" href="#tab_desc">Chi tiết</a>
                                        </li>
                                        <li>
                                            <a data-bs-toggle="tab" href="#tab_three">Bình Luận (<?= $countComment; ?>)</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content reviews-tab">

                                        <div class="tab-pane fade show active" id="tab_desc">
                                            <div class="p-3" style="background:#f9f9f9;border-radius:8px">
                                                <?= nl2br(htmlspecialchars($sanPham['mo_ta'] ?? '')) ?>
                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="tab_three">
                                            <?php foreach ($listBinhLuan as $binhLuan): ?>
                                                <div class="total-reviews">
                                                    <div class="rev-avatar">
                                                        <img src="<?= $binhLuan['anh_dai_dien'] ?>" alt="">
                                                    </div>
                                                    <div class="review-box">
                                                        <div class="ratings">
                                                            <span class="good"><i class="fa fa-star"></i></span>
                                                            <span class="good"><i class="fa fa-star"></i></span>
                                                            <span class="good"><i class="fa fa-star"></i></span>
                                                            <span class="good"><i class="fa fa-star"></i></span>
                                                            <span><i class="fa fa-star"></i></span>
                                                        </div>
                                                        <div class="post-author">
                                                            <p><span><?= $binhLuan['ho_ten'] ?></span>
                                                                <?= $binhLuan['ngay_dang'] ?></p>
                                                        </div>
                                                        <p><?= $binhLuan['noi_dung'] ?></p>
                                                    </div>
                                                </div>
                                            <?php endforeach; ?>
                                            <form action="#" class="review-form">
                                                <div class="form-group row">
                                                    <div class="col">
                                                        <label class="col-form-label"><span class="text-danger">*</span>
                                                            Nội dung bình luận</label>
                                                        <textarea class="form-control" required></textarea>
                                                    </div>
                                                </div>
                                                <div class="buttons">
                                                    <button class="btn btn-sqr" type="submit">Bình Luận</button>
                                                </div>
                                            </form> <!-- end of review-form -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- product details reviews end -->
                </div>
                <!-- product details wrapper end -->
            </div>
        </div>
    </div>
    <!-- page main wrapper end -->

    <!-- related products area start -->
    <section class="related-products section-padding">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- section title start -->
                    <div class="section-title text-center">
                        <h2 class="title">Sản Phẩm Liên Quan</h2>
                        <p class="sub-title"></p>
                    </div>
                    <!-- section title start -->
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="product-carousel-4 slick-row-10 slick-arrow-style">
                        <!-- product item start -->
                        <?php foreach ($listSanPhamCungDanhMuc as $key => $sanPham): ?>
                            <div class="product-item">
                                <figure class="product-thumb">
                                    <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id']; ?>">
                                        <img class="pri-img" style="object-fit: cover; height: 350px;"
                                            src="<?= BASE_URL . ltrim($sanPham['hinh_anh'], './') ?>" alt="product" onerror="this.onerror=null; this.src='<?= BASE_URL ?>uploads/ao.jpg'">
                                        <img class="sec-img" style="object-fit: cover; height: 350px;"
                                            src="<?= BASE_URL . ltrim($sanPham['hinh_anh'], './') ?>" alt="product" onerror="this.onerror=null; this.src='<?= BASE_URL ?>uploads/ao.jpg'">
                                    </a>
                                    <div class="product-badge">
                                        <?php
                                        $ngayNhap = new DateTime($sanPham['ngay_nhap']);
                                        $ngayHienTai = new DateTime();
                                        $tinhNgay = $ngayHienTai->diff($ngayNhap);

                                        if ($tinhNgay->days <= 7) {
                                            ?>
                                            <div class="product-label new">
                                                <span>Mới</span>
                                            </div>
                                        <?php } ?>

                                        <?php if ($sanPham['gia_khuyen_mai']) { ?>
                                            <div class="product-label discount">
                                                <span>Giảm giá</span>
                                            </div>
                                        <?php } ?>

                                    </div>
                                    <div class="cart-hover">
                                        <button class="btn btn-cart"><a class="btn btn-text text-decoration-none" href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id']; ?>">Xem Chi Tiết</a></button>
                                    </div>
                                </figure>
                                <div class="product-caption text-center">

                                    <h6 class="product-name">
                                        <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id']; ?>"><?= $sanPham['ten_san_pham'] ?></a>
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
                        <?php endforeach ?>
                        <!-- product item end -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- related products area end -->
</main>



<?php require_once "layout/miniCart.php"; ?>
<?php require_once "layout/footer.php"; ?>
<script>
  (function(){
    var minusBtn = document.querySelector('.qty-btn[data-type="minus"]');
    var plusBtn = document.querySelector('.qty-btn[data-type="plus"]');
    var qtyInput = document.getElementById('qty-input');
    if(minusBtn && plusBtn && qtyInput){
      minusBtn.addEventListener('click', function(){
        var min = parseInt(qtyInput.getAttribute('min')||'1',10);
        var val = parseInt(qtyInput.value||'1',10);
        if(val>min){ qtyInput.value = val - 1; }
      });
      plusBtn.addEventListener('click', function(){
        var max = parseInt(qtyInput.getAttribute('max')||'999',10);
        var val = parseInt(qtyInput.value||'1',10);
        if(val<max){ qtyInput.value = val + 1; }
      });
    }
  })();
</script>