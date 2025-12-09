---
title: "Worklog Tuần 2"
date: "`r Sys.Date()`"
weight: 1
chapter: false
pre: " <b> 1.2. </b> "
---



### Mục tiêu tuần 2:

* Thực hành các dịch vụ mạng AWS (Route 53, VPC Peering, Transit Gateway).
* Thiết lập kết nối an toàn với Key Pairs, Security Groups và DNS.
* Học cách sử dụng Amazon EC2 (AMI, Backup, EBS volumes).
* Dùng AWS Backup để bảo vệ và khôi phục dữ liệu

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc                                                                                                                                                                                     | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                            |
| --- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | ----------------------------------------- |
| 2   | - Học Hybrid DNS với Route 53 <br> - **Thực hành:** <br>&emsp; + Thiết lập Hybrid DNS với Route 53 <br>&emsp; + Tạo cặp khóa (Key pair) <br>&emsp; + Khởi tạo CloudFormation <br>&emsp; + Cấu hình Security Group <br>&emsp; + Kết nối tới RDGW (Remote Desktop Gateway) <br>&emsp; + Tạo Route 53 Outbound Endpoint <br>&emsp; + Tạo Route 53 Inbound Endpoints <br>&emsp; + Kiểm tra kết quả <br>&emsp; + Dọn dẹp tài nguyên | 15/09/2025 | 16/09/2025 | <https://000010.awsstudygroup.com/> |
| 3   | - Thiết lập VPC Peering <br> - **Thực hành:** <br>&emsp; + Tạo kết nối Peering <br>&emsp; + Bật Cross-peering DNS <br>&emsp; + Dọn dẹp tài nguyên | 16/09/2025 | 17/09/2025 | <https://000019.awsstudygroup.com/> |
| 4   | - Học và thiết lập AWS Transit Gateway <br> - **Thực hành:** <br>&emsp; + Tạo Transit Gateway <br>&emsp; + Tạo các Transit Gateway Attachments <br>&emsp; + Tạo bảng định tuyến Transit Gateway | 17/09/2025 | 18/09/2025 | <https://000020.awsstudygroup.com/> |
| 5   |  - Tìm hiểu Amazon Elastic Compute Cloud (EC2): <br>&emsp; + AMI <br>&emsp; + Sao lưu (Backup) <br>&emsp; + EBS | 19/09/2025 | 20/09/2025 | <https://www.youtube.com/watch?v=e7XeKdOVq40&list=PLahN4TLWtox2a3vE1knwzU_urND8hLn1i&index=73> |
| 6   | **Thực hành:** <br>&emsp; + Triển khai AWS Backup <br>&emsp; + Triển khai hạ tầng (Infrastructure) <br>&emsp; + Tạo kế hoạch sao lưu (Backup Plan) <br>&emsp; + Kiểm tra khôi phục (Test Restore) <br>&emsp; + Dọn dẹp tài nguyên | 20/09/2025 | 21/09/2025 | <https://000013.awsstudygroup.com/> |


### Kết quả đạt được tuần 2:

* **Hybrid DNS với Route 53:**
  * Tìm hiểu khái niệm về Hybrid DNS
  * Thiết lập thành công Hybrid DNS với Route 53
  * Tạo và sử dụng Key Pairs cho kết nối an toàn
  * Khởi tạo CloudFormation templates
  * Cấu hình Security Groups để kiểm soát truy cập

* **VPC Peering:**
  * Tạo kết nối VPC peering
  * Kích hoạt phân giải DNS giữa các VPC
  * Kiểm tra thành công việc giao tiếp giữa các VPC đã peering

* **AWS Transit Gateway:**
  * Tìm hiểu vai trò của Transit Gateway trong kiến trúc mạng
  * Tạo và cấu hình Transit Gateway
  * Gắn các VPC vào Transit Gateway
  * Thiết lập định tuyến cho kết nối tập trung

* **Amazon EC2:**
  * Khám phá các khái niệm EC2: AMI, Backup và EBS volumes
  * Khởi tạo và quản lý các EC2 instances
  * Thực hành tạo AMI và gắn EBS volumes

* **AWS Backup:**
  * Triển khai dịch vụ AWS Backup
  * Xây dựng hạ tầng để kiểm thử backup và khôi phục dữ liệu
  * Tạo và quản lý Key Pairs


