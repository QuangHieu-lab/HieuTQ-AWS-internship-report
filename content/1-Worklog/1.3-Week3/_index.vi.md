---
title: "Worklog Tuần 3"
date: "`r Sys.Date()`"
weight: 1
chapter: false
pre: " <b> 1.3. </b> "
---



### Mục tiêu tuần 3:

  * Làm việc cùng các thành viên trong nhóm để quyết định ý tưởng dự án.  
  * Tìm hiểu về các dịch vụ lưu trữ AWS (S3, Storage Gateway, Glacier, Snow Family).  
  * Thực hành tạo và quản lý S3 buckets.  
  * Học cách triển khai website tĩnh bằng S3.  
  * Thử nghiệm Amazon CloudFront và sao chép dữ liệu giữa các bucket.  
  * Làm quen với Access Point, Storage Class, và CORS của S3.  

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc                                                                                                                                                                                                                                                                                                         | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                            |
| --- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | ----------------------------------------- |
| 2   | Họp nhóm về ý tưởng dự án <br> - Đọc và ghi chú các ý tưởng đã thảo luận và đưa ra quyết định về dự án.                                                                                                                                                                                                           | 22/09/2025   | 22/09/2025      |
| 3   | - Tìm hiểu về S3 Bucket, Storage Gateway <br> **Thực hành:** <br>&emsp; + Tạo S3 bucket <br>&emsp; + Tạo EC2 cho Storage Gateway <br>&emsp; + Tạo Storage Gateway <br>&emsp; + Tạo File Share                                                                                                                     | 23/09/2025   | 23/09/2025      | <https://cloudjourney.awsstudygroup.com/> |
| 4   | - Tạo thêm dịch vụ S3 Bucket <br> - Tìm hiểu cách tải (load) dữ liệu và cách bật tính năng website tĩnh (Static Website) <br> - **Thực hành:** <br>&emsp; + Cấu hình quyền truy cập công khai (Public Access) <br>&emsp; + Cấu hình public object <br>&emsp; + Kiểm tra website và chạy thành công | 24/09/2025 | 25/09/2025 | <https://000057.awsstudygroup.com/> |
| 5   | - **Thực hành:** <br>&emsp; + Chặn toàn bộ public access <br>&emsp; + Cấu hình Amazon CloudFront <br>&emsp; + Kiểm tra Amazon CloudFront <br>&emsp; + Bật versioning cho bucket <br>&emsp; + Di chuyển objects <br>&emsp; + Sao chép đối tượng đa vùng (Multi-Region Replication) <br>&emsp; + Dọn dẹp tài nguyên | 25/09/2025 | 26/09/2025 | <https://000057.awsstudygroup.com/> |
| 6   | - Tìm hiểu Amazon Simple Storage Service (S3) <br> - Access Point và Storage Class <br> - Học về S3 Static Website & CORS <br> - Kiểm soát truy cập (Access Control) <br> - Object Key & Hiệu năng (Performance) <br> - Glacier <br> - Tìm hiểu Snow Family và cách hoạt động | 26/09/2025 | 27/09/2025 | <https://www.youtube.com/watch?v=hsCfP0IXoaM&list=PLahN4TLWtox2a3vE1knwzU_urND8hLn1i&index=103> |
### Kết quả đạt được tuần 3:

* Tham gia họp nhóm và thống nhất ý tưởng dự án.  

* Tạo các S3 Bucket và thực hành tải lên, di chuyển, và quản lý phiên bản của Object.  

* Học cách cấu hình Public Access trong S3 và triển khai website tĩnh thành công.  

* Cấu hình Amazon CloudFront để phân phối nội dung và kiểm thử thành công.  

* Thực hành sao chép Object S3 giữa nhiều vùng (Multi-Region Replication).  

* Hiểu rõ hơn về các tính năng khác của S3: Storage Class, Access Point, CORS, Glacier và Snow Family.  

* Tự tin hơn khi sử dụng AWS Console và thực hành các bài lab.  


