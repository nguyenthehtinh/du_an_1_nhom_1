<?php

// Biến môi trường, dùng chung toàn hệ thống
// Khai báo dưới dạng HẰNG SỐ để không phải dùng $GLOBALS

define('BASE_URL', 'http://localhost/du_an_1_nhom_1/'); // Đường vào client
define('BASE_URL_ADMIN', 'http://localhost/du_an_1_nhom_1/admin/'); // Đường vào admin

define('DB_HOST', 'localhost');
define('DB_PORT', 3306);
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'web-thu-cung');  // Tên database

define('PATH_ROOT', __DIR__ . '/../');
