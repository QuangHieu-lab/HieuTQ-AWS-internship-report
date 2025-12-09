---
title: "Worklog Tuần 9"
date: "`r Sys.Date()`"
weight: 1
chapter: false
pre: " <b> 1.9. </b> "
---



### Mục tiêu tuần 9:

* Học cách triển khai, cấu hình, bảo mật và dọn dẹp tài nguyên AWS thuộc nhóm Compute, Database và Storage.
* Xây dựng kinh nghiệm thực hành với:
   - VPC networking, security groups và subnet groups
   - Khởi tạo EC2, kết nối và công cụ quản lý EC2
   - Thiết lập và cấu hình RDS, thực hiện backup/restore
   - Migration cơ sở dữ liệu (SQL Server, Oracle → Aurora MySQL)
   - Quy trình phân tích dữ liệu (S3 → Firehose → Glue → Athena → QuickSight)
   - DynamoDB, backup, mô hình thiết kế nâng cao và tích hợp serverless
* Hiểu chiến lược phân bổ chi phí (cost allocation), tagging và nguyên tắc cấu hình database.
* Phát triển kỹ năng xử lý lỗi qua các tình huống migration và serverless thực tế.
### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc                                                                                                                                                                                                                                                                                                                                                                                                                                                           | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                      |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | ----------------------------------- |
| 2   | - **Thực hành:** <br>&emsp; + Tạo VPC <br>&emsp; + Tạo security group cho EC2 <br>&emsp; + Tạo security group cho RDS <br>&emsp; + Tạo DB subnet group <br>&emsp; + Tạo EC2 instance <br>&emsp; + Tạo RDS database instance <br>&emsp; + Triển khai ứng dụng <br>&emsp; + Backup và restore <br>&emsp; + Dọn dẹp tài nguyên                                                                                                                                         | 03/11/2025   | 04/11/2025      | <https://000005.awsstudygroup.com/> |
| 3   | - **Thực hành:** <br>&emsp; + Kết nối EC2 bằng RDP Client <br>&emsp; + Sử dụng Fleet Manager <br>&emsp; + Cấu hình SQL Server Source DB <br>&emsp; + Kết nối Oracle Source DB <br>&emsp; + Cấu hình Oracle Source DB <br>&emsp; + Xóa (Drop) Constraint <br>&emsp; + Tạo project migration MSSQL → Aurora MySQL <br>&emsp; + Tạo Migration Task và Endpoint <br>&emsp; + Kiểm tra S3 <br>&emsp; + Tạo Serverless Migration <br>&emsp; + Xử lý lỗi các kịch bản test | 04/11/2025   | 05/11/2025      | <https://000043.awsstudygroup.com/> |
| 4   | - **Thực hành:** <br>&emsp; + Tạo S3 <br>&emsp; + Tạo Firehose Delivery Stream <br>&emsp; + Tạo dữ liệu mẫu <br>&emsp; + Tạo Glue Crawler <br>&emsp; + Kiểm tra dữ liệu <br>&emsp; + Lưu output vào S3 <br>&emsp; + Thiết lập Session connect <br>&emsp; + Phân tích với Athena <br>&emsp; + Trực quan hóa bằng QuickSight <br>&emsp; + Dọn dẹp tài nguyên                                                                                                          | 05/11/2025   | 06/11/2025      | <https://000035.awsstudygroup.com/> |
| 5   | - **Thực hành:** <br>&emsp; + Hands-on Labs cho Amazon DynamoDB <br>&emsp; + Khám phá DynamoDB <br>&emsp; + Tạo backup <br>&emsp; + Dọn dẹp tài nguyên <br> - Thực hành mô hình thiết kế nâng cao cho DynamoDB <br> - Xây dựng và deploy serverless với DynamoDB <br>&emsp; + Thêm event driver                                                                                                                                                                     | 06/11/2025   | 07/11/2025      | <https://000039.awsstudygroup.com/> |
| 6   | - **Thực hành:** <br>&emsp; + Tạo database <br>&emsp; + Xây dựng database <br>&emsp; + Tagging và phân bổ chi phí                                                                                                                                                                                                                                                                                                                                                   | 07/11/2025   | 08/11/2025      | <https://000040.awsstudygroup.com/> |


### Kết quả đạt được tuần 9:

* Tạo thành công các tài nguyên AWS cốt lõi:
  * VPC, security group cho EC2 và RDS, DB subnet group
  * EC2 instance và RDS database instance
* Triển khai ứng dụng và thực hiện backup/restore.
* Dọn dẹp tài nguyên để tránh phát sinh chi phí không cần thiết.
* Kết nối EC2 bằng RDP và sử dụng Fleet Manager để quản lý.
* Cấu hình SQL Server Source DB và Oracle Source DB, bao gồm xử lý constraint.
* Tạo project migration và thực hiện migration MSSQL → Aurora MySQL với endpoint & migration task.
* Kiểm tra S3 và xây dựng workflow Serverless Migration.
* Thực hành xử lý lỗi trong các tình huống migration.


