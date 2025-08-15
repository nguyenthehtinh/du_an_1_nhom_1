<?php require_once 'views/layout/header.php'; ?>
<?php require_once 'views/layout/menu.php'; ?>



<div class="order-detail-wrapper section-padding">
    <div class="container">
        <div class="section-bg-color">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Hiển thị thông báo thành công/lỗi -->
                    <?php if (isset($_SESSION['success']) && $_SESSION['success'] !== '' && $_SESSION['success'] !== 0): ?>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="fa fa-check-circle"></i> <?= htmlspecialchars($_SESSION['success']) ?>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                        <?php unset($_SESSION['success']); ?>
                    <?php endif; ?>

                    <?php if (isset($_SESSION['error']) && $_SESSION['error'] !== '' && $_SESSION['error'] !== 0 && $_SESSION['error'] !== []): ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fa fa-exclamation-circle"></i> 
                            <?php 
                            // Xử lý hiển thị lỗi an toàn
                            if (is_array($_SESSION['error'])) {
                                if (empty($_SESSION['error'])) {
                                    echo "Không có thông tin lỗi cụ thể";
                                } else {
                                    echo htmlspecialchars(implode("<br>", $_SESSION['error']));
                                }
                            } elseif (is_object($_SESSION['error'])) {
                                echo htmlspecialchars((string)$_SESSION['error']);
                            } elseif (is_numeric($_SESSION['error']) && $_SESSION['error'] == 0) {
                                echo "Không có lỗi xảy ra";
                            } elseif (is_numeric($_SESSION['error'])) {
                                echo "Mã lỗi: " . htmlspecialchars((string)$_SESSION['error']);
                            } else {
                                echo htmlspecialchars((string)$_SESSION['error']);
                            }
                            ?>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                        <?php unset($_SESSION['error']); ?>
                    <?php endif; ?>
                    


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
								<div class="mb-3 p-3 order-info-box">
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
									<div class="mt-2">
										<strong>Trạng Thái:</strong> 
										<span class="badge <?php 
											switch ($donHang['trang_thai_id'] ?? 0) {
												case 1: echo 'bg-warning'; break;
												case 2: echo 'bg-info'; break;
												case 3: echo 'bg-secondary'; break;
												case 4: echo 'bg-primary'; break;
												case 5: echo 'bg-info'; break;
												case 6: echo 'bg-primary'; break;
												case 7: echo 'bg-success'; break;
												case 8: echo 'bg-success'; break;
												case 9: echo 'bg-success'; break;
												case 10: echo 'bg-warning'; break;
												case 11: echo 'bg-danger'; break;
												default: echo 'bg-secondary'; break;
											}
										?> fs-6">
											<?php
											switch ($donHang['trang_thai_id'] ?? 0) {
												case 1:
													echo 'Chưa Xác Nhận';
													break;
												case 2:
													echo 'Đã Xác Nhận';
													break;
												case 3:
													echo 'Chưa Thanh Toán';
													break;
												case 4:
													echo 'Đã Thanh Toán';
													break;
												case 5:
													echo 'Đang Chuẩn Bị Hàng';
													break;
												case 6:
													echo 'Đang Giao Hàng';
													break;
												case 7:
													echo 'Đã Giao Hàng';
													break;
												case 8:
													echo 'Đã Nhận Hàng';
													break;
												case 9:
													echo 'Thành Công';
													break;
												case 10:
													echo 'Hoàn Hàng';
													break;
												case 11:
													echo 'Hủy Đơn';
													break;
												default:
													echo 'Đang xử lý';
													break;
											}
											?>
										</span>
									</div>
								</div>
								<div class="cart-table table-responsive">
									<table class="table table-bordered align-middle">
										<thead class="table-light">
											<tr>
																					<th class="pro-thumbnail">Hình Ảnh</th>
									<th class="pro-title">Tên Sản Phẩm</th>
									<th class="pro-price">Đơn Giá</th>
									<th class="pro-quantity">Số Lượng</th>
									<th class="pro-subtotal">Thành Tiền</th>
											</tr>
										</thead>
										<tbody>
											<?php if (!empty($sanPhamDetails)): ?>
												<?php foreach ($sanPhamDetails as $detail): ?>
													<tr>
														<td class="pro-thumbnail">
															<img src="<?= BASE_URL . ltrim(($detail['san_pham']['hinh_anh'] ?? ''), './') ?>" onerror="this.onerror=null; this.src='<?= BASE_URL ?>uploads/ao.jpg'" alt="product" />
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
								<div class="p-3 order-summary-box">
									<h5 class="mb-3">Tổng kết</h5>
									<div class="d-flex justify-content-between mb-2"><span>Tạm tính</span><strong><?= fomatPrice($tam_tinh) . 'đ' ?></strong></div>
									<div class="d-flex justify-content-between mb-2"><span>Phí vận chuyển</span><strong><?= fomatPrice(40000) . 'đ' ?></strong></div>
									<hr class="order-summary-divider" />
									<div class="d-flex justify-content-between mb-3"><span>Tổng cộng</span><strong class="order-total-price"><?= fomatPrice($tam_tinh + 40000) . 'đ' ?></strong></div>
									

									
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