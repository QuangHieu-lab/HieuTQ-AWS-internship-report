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
| 2   | - Học về Hybrid DNS với Route 53 <br> - Thực hành: <br> + Thiết lập Hybrid DNS với Route 53 <br> + Tạo cặp khóa (Key pair) <br> + Khởi tạo CloudFormation <br> + Cấu hình Security Group <br> | 15/09/2025   | 16/09/2025      |
| 3   | - Thiết lập VPC peering <br>    - **Thực hành:**   <br>&emsp; + Tạo kết nối peering  <br>&emsp;  + Bật DNS giữa các peer                                                                      | 09/16/2025   | 09/17/2025      | <https://cloudjourney.awsstudygroup.com/> |
| 4   | - Tạo AWS Free Tier account <br> - Tìm hiểu AWS Console & AWS CLI <br> - **Thực hành:** <br>&emsp; + Tạo AWS account <br>&emsp; + Cài AWS CLI & cấu hình <br> &emsp; + Cách sử dụng AWS CLI   | 13/08/2025   | 13/08/2025      | <https://cloudjourney.awsstudygroup.com/> |
| 5   | - Học về Amazon Elastic Compute Cloud (EC2): <br>&emsp; + AMI <br>&emsp; + AMI <br>&emsp; + Sao lưu (Backup) <br>&emsp; + ... - Tìm hiểu Elastic IP   <br>                                    | 14/08/2025   | 15/08/2025      | <https://cloudjourney.awsstudygroup.com/> |
| 6   | - **Thực hành:** <br>&emsp; + Tạo EC2 instance <br>&emsp; + Kết nối SSH <br>&emsp; + Gắn EBS volume                                                                                           | 15/08/2025   | 15/08/2025      | <https://cloudjourney.awsstudygroup.com/> |


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


