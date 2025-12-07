---
title: "Worklog Tuần 6"
date: "`r Sys.Date()`"
weight: 1
chapter: false
pre: " <b> 1.6. </b> "
---


### Mục tiêu tuần 6:

* Củng cố hiểu biết về dịch vụ AWS Identity and Access Management (IAM) thông qua việc tạo chính sách giới hạn quyền (restriction policy) và người dùng hạn chế (limited user).
* Tìm hiểu về hạ tầng toàn cầu của AWS, bao gồm các Khu vực (Region), Vùng khả dụng (Availability Zone - AZ) và Điểm biên (Edge Location).
* Khám phá các dịch vụ lưu trữ của AWS như EC2 Instance Store, Amazon Elastic Block Store (EBS), Amazon Elastic File System (EFS) và Amazon FSx.
* Nghiên cứu các dịch vụ cơ sở dữ liệu của AWS, bao gồm Amazon RDS, Amazon Aurora, Amazon DynamoDB và Amazon ElastiCache.
* Tìm hiểu các dịch vụ Trí tuệ nhân tạo (AI), Học máy (ML) và Phân tích dữ liệu (Data Analytics) của AWS, bao gồm Amazon Comprehend, Polly, Transcribe, Translate, Rekognition, Textract, Lex, Kendra, Personalize, Bedrock, Q Business và Q Developer.
* Tiếp tục thực hành sử dụng cả AWS Management Console và AWS Command Line Interface (CLI) để quản lý và cấu hình tài nguyên.

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc                                                                                                                                                                                   | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                            |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | ----------------------------------------- |
| 2   | - **Thực hành** <br> - Tạo chính sách giới hạn quyền (Restriction Policy) <br> - Tạo người dùng IAM hạn chế (Limited User) <br> - Kiểm tra giới hạn người dùng IAM <br> - Dọn dẹp tài nguyên sau khi thử nghiệm                                                                                                     | 13/10/2025 | 13/10/2025 | <https://000030.awsstudygroup.com/> |
| 3   |  - Tìm hiểu về phạm vi toàn cầu của AWS (Going Global) <br>&emsp; + Tuân thủ (Compliance) <br>&emsp; + Vị trí gần người dùng (Proximity) <br>&emsp; + Khả năng cung cấp tính năng (Feature Availability) <br>&emsp; + Định giá (Pricing) <br>&emsp; + Tài nguyên đa vùng và đa vùng khả dụng (Multi-Region & Multi-AZ) <br>&emsp; + Điểm biên (Edge Location) <br>&emsp; + CloudFormation | 14/10/2025 | 15/10/2025 | <https://render.skillbuilder.aws/?module_id=VEE8JSBK3Z%3A001.000.000&product_id=8D79F3AVR7%3A002.000.000&registration_id=7180ba42-ac1f-560b-8b6b-a28ec10a9d43&navigation=digital> |
| 4   |  - Tìm hiểu thêm về lưu trữ <br>&emsp; + EC2 Instance Store và Amazon Elastic Block Store (EBS) <br>&emsp; + Vòng đời dữ liệu EBS (EBS Data Lifecycle) <br> - Tìm hiểu về lưu trữ dạng tệp (File Storage) <br>&emsp; + Amazon Elastic File System (EFS) <br>&emsp; + Amazon FSx       | 15/10/2025 | 16/10/2025 | <https://render.skillbuilder.aws/?module_id=18SQAPSR8X%3A001.000.000&product_id=8D79F3AVR7%3A002.000.000&registration_id=7180ba42-ac1f-560b-8b6b-a28ec10a9d43&navigation=digital> |
| 5   | - Tìm hiểu về Cơ sở dữ liệu (Database) <br> - Cơ sở dữ liệu quan hệ (Relational Database Service) <br>&emsp; + Amazon Aurora <br>&emsp; + Amazon RDS <br> - Cơ sở dữ liệu NoSQL <br>&emsp; + Amazon DynamoDB <br> - Dịch vụ bộ nhớ đệm trong bộ nhớ (In-memory Caching) <br>&emsp; + Amazon ElastiCache                | 17/10/2025 | 18/10/2025 | <https://render.skillbuilder.aws/?module_id=B1DGAV8S16%3A001.000.000&product_id=8D79F3AVR7%3A002.000.000&registration_id=7180ba42-ac1f-560b-8b6b-a28ec10a9d43&navigation=digital> |
| 6   |  - Tìm hiểu về AI/ML và Phân tích dữ liệu <br>&emsp; + Amazon Comprehend <br>&emsp; + Amazon Polly <br>&emsp; + Amazon Transcribe <br>&emsp; + Amazon Translate <br>&emsp; + Amazon Kendra <br>&emsp; + Amazon Rekognition <br>&emsp; + Amazon Textract <br>&emsp; + Amazon Lex <br>&emsp; + Amazon Personalize <br>&emsp; + Amazon Bedrock <br>&emsp; + Amazon Q Business <br>&emsp; + Amazon Q Developer | 18/10/2025 | 19/10/2025 | <https://render.skillbuilder.aws/?module_id=NUYARVB13G%3A001.000.000&product_id=8D79F3AVR7%3A002.000.000&registration_id=7180ba42-ac1f-560b-8b6b-a28ec10a9d43&navigation=digital> |


### Kết quả đạt được tuần 6:
* Đã tạo và kiểm thử thành công các chính sách giới hạn quyền và tài khoản người dùng IAM hạn chế, thể hiện khả năng hiểu và quản lý quyền truy cập trong AWS.
* Hiểu rõ thiết kế hạ tầng toàn cầu của AWS, bao gồm khái niệm đa vùng (multi-region), đa vùng khả dụng (multi-AZ) và các điểm biên (Edge Location) giúp đảm bảo độ sẵn sàng cao và độ trễ thấp.
* Nắm được sự khác biệt giữa các loại lưu trữ EC2 Instance Store, EBS, EFS và FSx, cũng như ứng dụng của từng loại trong các tình huống khác nhau.
* Tìm hiểu và phân biệt các dịch vụ cơ sở dữ liệu của AWS, bao gồm:
  * Amazon RDS và Aurora cho cơ sở dữ liệu quan hệ.
  * Amazon DynamoDB cho cơ sở dữ liệu NoSQL.
  * Amazon ElastiCache cho bộ nhớ đệm trong bộ nhớ.
* Khám phá các dịch vụ AI/ML của AWS và hiểu được cách chúng hỗ trợ tự động hóa, xử lý ngôn ngữ tự nhiên và phân tích dữ liệu chuyên sâu.
* Cấu hình và sử dụng AWS CLI để thực hiện các thao tác như xem thông tin tài khoản, liệt kê danh sách vùng, quản lý cặp khóa EC2 và kiểm tra các dịch vụ đang chạy.