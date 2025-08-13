<?php require_once 'views/layout/header.php'; ?>
<?php require_once 'views/layout/menu.php'; ?>

<style>
/* Fix hiển thị chữ/ảnh trong bảng chi tiết đơn hàng */
.order-detail-wrapper .cart-table .table tbody tr td,
.order-detail-wrapper .cart-table .table tbody tr td a,
.order-detail-wrapper .cart-table .table tbody tr td *,
.order-detail-wrapper .table tbody td,
.order-detail-wrapper .table tbody td a,
.order-detail-wrapper .table tbody td * { color: #2c3e50 !important; background:#fff; }
.order-detail-wrapper .pro-title { color: #2c3e50 !important; }
.order-detail-wrapper .pro-thumbnail img { display: block; opacity: 1 !important; }
/* ưu tiên tuyệt đối: nếu theme đặt color: #fff ở td/th */
.order-detail-wrapper .cart-table .table tbody tr td,
.order-detail-wrapper .cart-table .table tbody tr td a,
.order-detail-wrapper .cart-table .table tbody tr td * {
    color: #2c3e50 !important;
    -webkit-text-fill-color: #2c3e50 !important; /* fix Safari */
    mix-blend-mode: normal !important;
}
</style>

<div class="order-detail-wrapper section-padding">
    <div class="container">
        <div class="section-bg-color">
            <div class="row">
                <div class="col-lg-12">
						<h2 class="mb-3">Chi Tiết Đơn Hàng</h2>
						<?php 
							$ngayDat = isset($donHang['ngay_dat']) ? fomatDate($donHang['ngay_dat']) : '';
							$tam_tinh = 0; 
							if (!empty($sanPhamDetails)) {
								foreach ($sanPhamDetails as $d) {
									$tt = $d['thanh_tien'] ?? (($d['gia'] ?? 0) * ($d['so_luong'] ?? 0));
									$tam_tinh += (int)$tt;
								}
							}
							$tong_cong = $tam_tinh; 
						?>
						<div class="row">
							<div class="col-lg-8">
								<div class="mb-3 p-3" style="background:#f9fbff;border:1px solid #e6eefc;border-radius:8px;">
									<div class="d-flex justify-content-between flex-wrap gap-2">
										<div><strong>Mã Đơn:</strong> <?= htmlspecialchars($donHang['ma_don_hang'] ?? '') ?></div>
										<div><strong>Ngày Đặt:</strong> <?= htmlspecialchars($ngayDat) ?></div>
									</div>
									<div class="mt-2">
										<strong>Người Nhận:</strong> <?= htmlspecialchars($donHang['ten_nguoi_nhan'] ?? '') ?>
										<span class="mx-2">|</span>
										<strong>SĐT:</strong> <?= htmlspecialchars($donHang['sdt_nguoi_nhan'] ?? '') ?>
										<div class="mt-1"><strong>Địa Chỉ:</strong> <?= htmlspecialchars($donHang['dia_chi_nguoi_nhan'] ?? '') ?></div>
									</div>
								</div>
								<div class="cart-table table-responsive">
									<table class="table table-bordered align-middle">
										<thead class="table-light">
											<tr>
												<th class="pro-thumbnail" style="width:110px">Hình Ảnh</th>
												<th class="pro-title">Tên Sản Phẩm</th>
												<th class="pro-price" style="width:160px">Đơn Giá</th>
												<th class="pro-quantity" style="width:120px">Số Lượng</th>
												<th class="pro-subtotal" style="width:180px">Thành Tiền</th>
											</tr>
										</thead>
										<tbody>
											<?php if (!empty($sanPhamDetails)): ?>
												<?php foreach ($sanPhamDetails as $detail): ?>
													<tr>
														<td class="pro-thumbnail">
															<img style="width:90px;height:90px;object-fit:cover;border-radius:6px" src="<?= BASE_URL . ltrim(($detail['san_pham']['hinh_anh'] ?? ''), './') ?>" onerror="this.onerror=null; this.src='<?= BASE_URL ?>uploads/ao.jpg'" alt="product" />
														</td>
														<td class="pro-title"><?= htmlspecialchars($detail['san_pham']['ten_san_pham'] ?? '') ?></td>
														<td class="pro-price"><span class="fw-bold text-dark"><?= fomatPrice($detail['gia'] ?? 0) . 'đ' ?></span></td>
														<td class="pro-quantity"><?= htmlspecialchars($detail['so_luong'] ?? 0) ?></td>
														<td class="pro-subtotal"><span class="fw-bold">
															<?= fomatPrice($detail['thanh_tien'] ?? (($detail['gia'] ?? 0) * ($detail['so_luong'] ?? 0))) . 'đ' ?>
														</span></td>
													</tr>
												<?php endforeach; ?>
											<?php else: ?>
												<tr>
													<td colspan="5" class="text-center">Không có sản phẩm nào trong đơn hàng này.</td>
												</tr>
											<?php endif; ?>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="p-3" style="background:#fff7ec;border:1px solid #ffe2b9;border-radius:8px;">
									<h5 class="mb-3">Tổng kết</h5>
									<div class="d-flex justify-content-between mb-2"><span>Tạm tính</span><strong><?= fomatPrice($tam_tinh) . 'đ' ?></strong></div>
									<div class="d-flex justify-content-between mb-2"><span>Phí vận chuyển</span><strong><?= fomatPrice(40000) . 'đ' ?></strong></div>
									<hr style="margin:10px 0" />
									<div class="d-flex justify-content-between mb-3"><span>Tổng cộng</span><strong style="font-size:18px;"><?= fomatPrice($tam_tinh + 40000) . 'đ' ?></strong></div>
									<a href="<?= BASE_URL . '?act=tai-khoan' ?>" class="btn btn-sqr w-100">Trở về</a>
								</div>
							</div>
						</div>

                    <a href="<?= BASE_URL . '?act=tai-khoan' ?>" class="btn btn-sqr d-block">Trở về</a>
                </div>
            </div>
        </div>
    </div>
</div>

<?php require_once "views/layout/footer.php"; ?>