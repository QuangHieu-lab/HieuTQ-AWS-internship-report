---
title: "Blog 2"
date: "`r Sys.Date()`"
weight: 1
chapter: false
pre: " <b> 3.2. </b> "
---



# Hỗ trợ nén (Compaction) cho các định dạng tệp Avro và ORC trong các bảng Apache Iceberg trên Amazon S3

Do Angel Conde Manjon, Diego Colombatto, và Sandeep Adwankar vào ngày 15 THÁNG 7 NĂM 2025 trong [Amazon Simple Storage Service (S3)](https://aws.amazon.com/blogs/big-data/category/storage/amazon-simple-storage-services-s3/), [Thông báo](https://aws.amazon.com/blogs/big-data/category/post-types/announcements/) [Liên kết](https://aws.amazon.com/blogs/big-data/compaction-support-for-avro-and-orc-file-formats-in-apache-iceberg-tables-in-amazon-s3/)  [Bình luận](https://aws.amazon.com/vi/blogs/big-data/compaction-support-for-avro-and-orc-file-formats-in-apache-iceberg-tables-in-amazon-s3/#Comments) [Chia sẻ](https://aws.amazon.com/vi/blogs/big-data/compaction-support-for-avro-and-orc-file-formats-in-apache-iceberg-tables-in-amazon-s3/#)

Apache Iceberg, một định dạng bảng mở hiệu năng cao (OTF – Open Table Format), đã được các tổ chức quản lý các bảng phân tích quy mô lớn và khối lượng dữ liệu lớn chấp nhận rộng rãi. Iceberg mang lại độ tin cậy và sự đơn giản của các bảng SQL cho data lake trong khi vẫn cho phép các công cụ như Apache Spark, Apache Trino, Apache Flink, Apache Presto, Apache Hive, Apache Impala, và các dịch vụ phân tích AWS như [Amazon Athena](https://aws.amazon.com/vi/athena/) truy cập dữ liệu một cách linh hoạt và an toàn với kiến trúc lakehouse. Mặc dù kiến trúc lakehouse được xây dựng bằng Iceberg đại diện cho một sự phát triển của data lake, nhưng nó vẫn yêu cầu các dịch vụ phải nén và tối ưu hóa các tệp và phân vùng tạo nên các bảng. Việc tự quản lý các bảng Iceberg với khối lượng dữ liệu lớn đặt ra một số thách thức, bao gồm quản lý các giao dịch đồng thời, xử lý các luồng dữ liệu thời gian thực (real-time data streams), xử lý sự tăng sinh tệp nhỏ, duy trì chất lượng và quản trị dữ liệu, và đảm bảo tuân thủ.

Tại re:Invent 2024, Amazon S3 đã giới thiệu Amazon S3 Tables, đánh dấu kho lưu trữ đối tượng đám mây đầu tiên với hỗ trợ Iceberg gốc cho các tệp [Parquet](https://parquet.apache.org/docs/), được thiết kế để hợp lý hóa việc quản lý dữ liệu dạng bảng theo quy mô. Parquet là một trong những kiểu dữ liệu phổ biến nhất và phát triển nhanh nhất trong Amazon S3. Amazon S3 lưu trữ exabyte dữ liệu Parquet và xử lý trung bình hơn 15 triệu yêu cầu mỗi giây đối với dữ liệu này. Mặc dù S3 Tables ban đầu chỉ hỗ trợ kiểu tệp Parquet, như đã thảo luận trong [Blog](https://aws.amazon.com/vi/blogs/aws/new-amazon-s3-tables-storage-optimized-for-analytics-workloads/) Tin tức AWS về S3 Tables, đặc tả Iceberg mở rộng sang các định dạng tệp Avro và ORC để quản lý các bảng phân tích lớn. Giờ đây, S3 Tables đang mở rộng khả năng của mình để bao gồm tính năng automatic compaction cho các kiểu tệp bổ sung này trong các bảng Iceberg. Cải tiến này cũng có sẵn cho các bảng Iceberg trên S3 buckets đa mục đích, sử dụng kiến trúc lakehouse của Amazon SageMaker mà trước đây đã hỗ trợ nén Parquet như đã đề cập trong bài đăng blog [Accelerate queries on Apache Iceberg tables through AWS Glue auto compaction.](https://aws.amazon.com/blogs/big-data/accelerate-queries-on-apache-iceberg-tables-through-aws-glue-auto-compaction/)

Bài đăng blog này sẽ khám phá các lợi ích về hiệu năng của tính năng nén tự động các bảng Iceberg sử dụng các kiểu tệp Avro và ORC trong S3 Tables cho một trường hợp sử dụng nhập dữ liệu (data ingestion use) với hơn 20 tỷ sự kiện.

---
## Các Định Dạng Tệp Parquet, ORC, và Avro

[Parquet](https://parquet.apache.org/docs/) là một trong những kiểu dữ liệu phổ biến nhất và phát triển nhanh nhất trong Amazon S3. Ban đầu được phát triển bởi Twitter và hiện là một phần của hệ sinh thái Apache, nó nổi tiếng vì khả năng tương thích rộng rãi với các công cụ dữ liệu lớn như Spark, Hive, Impala và Drill. Amazon S3 lưu trữ hàng exabyte dữ liệu Apache Parquet và trung bình xử lý hơn 15 triệu yêu cầu mỗi giây đối với dữ liệu này. Parquet sử dụng một lược đồ mã hóa lai (hybrid encoding scheme) và hỗ trợ các cấu trúc dữ liệu lồng nhau phức tạp , làm cho nó trở nên lý tưởng cho các khối lượng công việc chủ yếu đọc và phân tích trên nhiều nền tảng khác nhau. Parquet cũng cung cấp khả năng nén tuyệt vời và I/O hiệu quả bằng cách cho phép đọc cột có chọn lọc, giảm lượng dữ liệu được quét trong quá trình truy vấn.

ORC (Optimized Row Columnar) được thiết kế đặc biệt cho hệ sinh thái Hadoop và được tối ưu hóa cho Hive. Nó thường cung cấp tỷ lệ nén tốt hơn và hiệu năng đọc tốt hơn cho một số loại truy vấn nhất định nhờ vào khả năng lập chỉ mục nhẹ (lightweight indexing) và khả năng đẩy điều kiện lọc tích cực. ORC bao gồm thống kê tích hợp và hỗ trợ chỉ mục nhẹ, điều này có thể tăng tốc đáng kể các thao tác lọc. Trong khi Parquet cung cấp khả năng tương thích công cụ rộng hơn, ORC thường hoạt động vượt trội hơn trong các môi trường tập trung vào Hive, đặc biệt khi xử lý các cấu trúc dữ liệu phẳng và quét tuần tự lớn.

Định dạng tệp [Avro](https://avro.apache.org/docs/) thường được sử dụng trong các kịch bản streaming nhờ khả năng serialization và xử lý lược đồ của nó, cùng với sự tích hợp liền mạch với Apache Kafka, mang lại sự kết hợp mạnh mẽ để xử lý các luồng dữ liệu thời gian thực. Ví dụ: để lưu trữ và xác thực các lược đồ dữ liệu streaming, bạn có thể sử dụng [AWS Glue Schema Registry](https://docs.aws.amazon.com/glue/latest/dg/schema-registry.html) trong AWS. Avro, trái ngược với Parquet và ORC, là một định dạng lưu trữ dựa trên hàng được thiết kế để tuần tự hóa dữ liệu hiệu quả và tiến hóa lược đồ. Avro vượt trội trong các trường hợp sử dụng chủ yếu ghi như nhập dữ liệu và streaming, và thường được sử dụng với Kafka. Không giống như Parquet và ORC được tối ưu hóa cho các truy vấn phân tích, Avro được thiết kế để đọc và ghi nhanh các bản ghi hoàn chỉnh, và nó lưu trữ lược đồ cùng với dữ liệu, cho phép trao đổi và tiến hóa dữ liệu dễ dàng hơn theo thời gian.

|                                  | Parquet                                         | ORC                                     | Avro                                        |
| :------------------------------- | :---------------------------------------------- | :-------------------------------------- | :------------------------------------------ |
| **Định dạng lưu trữ**            | Theo cột                                        | Theo cột                                | Theo dòng                                   |
| **Tốt nhất cho**                 | Phân tích và truy vấn trên các cột, đa nền tảng | Truy vấn tập trung vào Hive, nén tối đa | Nhập dữ liệu, streaming, tuần tự hóa        |
| **Nén**                          | Tốt                                             | Rất tốt (đặc biệt với dữ liệu số)       | Trung bình                                  |
| **Khả năng tương thích công cụ** | Rộng (Spark, Hive, Presto, v.v.)                | Mạnh mẽ với Hive/Hadoop                 | Mạnh mẽ với Kafka, Flink, v.v.              |
| **Hiệu năng truy vấn**           | Rất tốt cho phân tích                           | Rất tốt trong Hive                      | Không tối ưu cho phân tích                  |
| **Tiến hóa lược đồ**             | Được hỗ trợ                                     | Được hỗ trợ                             | Rất tốt (lược đồ được lưu cùng với dữ liệu) |
| **Hỗ trợ dữ liệu lồng nhau**     | Có                                              | Hạn chế                                 | Có                                          |
| **Hiệu quả ghi**                 | Trung bình                                      | Trung bình                              | Cao                                         |
| **Hiệu quả đọc**                 | Cao (cho quét theo cột)                         | Rất cao (trong Hive)                    | Cao (cho việc đọc bản ghi đầy đủ)           |

---

## Tổng quan về Giải pháp

Chúng tôi vận hành hai phiên bản của cùng một kiến trúc: một phiên bản trong đó các bảng được auto compacted, và một phiên bản khác không có quá trình nén, trong trường hợp này sử dụng S3 Tables bằng cách so sánh hai kịch bản này, bài viết này minh họa hiệu quả, hiệu suất truy vấn, và lợi ích chi phí của các bảng được tự động nén so với các bảng không nén trong một pipeline dữ liệu Internet of Things (IoT) mô phỏng.

.![Sơ đồ Solution architecture](/images/3-Blog/architect.jpg)

*Figure 1 – Sơ đồ Solution architecture* 

## Kiểm tra hiệu suất Compaction

Chúng tôi đã mô phỏng quá trình ingestion dữ liệu IoT với hơn 20 tỷ sự kiện và sử dụng MERGE INTO để thực hiện data deduplication trên hai phân vùng theo thời gian, bao gồm các thao tác đọc phân vùng lớn và shuffling sau khi hoàn tất ingestion, chúng tôi chạy các truy vấn (queries) trong Amazon Athena để so sánh hiệu suất (performance) giữa bảng compacted và bảng uncompacted, sử dụng chế độ Merge on Read (MoR) trên cả hai định dạng Avro và ORC.

'write.delete.mode'='merge-on-read'

'write.update.mode'='merge-on-read'

'write.merge.mode'='merge-on-read'

'write.distribution.mode=hash'

Chúng tôi sử dụng ‘write.distribution.mode=hash’ để tạo ra các tệp có kích thước lớn hơn, giúp cải thiện hiệu suất. Lưu ý rằng do chúng tôi đã tạo ra các tệp khá lớn, nên sự khác biệt giữa bảng un-compacted và compacted sẽ không quá đáng kể; tuy nhiên, điều này có thể thay đổi đáng kể tùy theo khối lượng công việc của bạn (ví dụ: partitioning, input rate, batch size) và write distribution mode mà bạn chọn. Để biết thêm chi tiết, vui lòng tham khảo phần Writing Distribution Modes trong tài liệu của Apache Iceberg.

Bảng sau đây hiển thị các metrics về hiệu suất truy vấn trong Athena. Vui lòng tham khảo phần “Query and Join data from these S3 Tables to build insights” để biết chi tiết về truy vấn Tất cả các bảng dữ liệu (tables) được sử dụng để phân tích hiệu suất truy vấn đều có hơn 2 tỷ hàng. Các kết quả này chỉ áp dụng cho bài mô phỏng này, và kết quả của người dùng có thể khác nhau tùy thuộc vào data size và queries mà họ thực hiện.

| Truy vấn (Query) | Thời gian truy vấn Avro          (có compaction) | Thời gian truy vấn Avro  (không compaction) | Thời gian truy vấn ORC (không compaction) | Thời gian truy vấn ORC (có compaction) | % cải thiện Avro | % cải thiện ORC |
| ---------------- | :----------------------------------------------- | :------------------------------------------ | :---------------------------------------- | :------------------------------------- | :--------------- | --------------- |
| Query 1          | 22.45 giây                                       | 26.54 giây                                  | 30.1  6    giây                           | 20.32 giây                             | 15.41%           | 32.63%          |
| Query 2          | 22.68 giây                                       | 25.83 giây                                  | 34.17 giây                                | 20.51 giây                             | 12.20%           | 39.98%          |
| Query 3          | 25.92 giây                                       | 35.65 giây                                  | 29.05 giây                                | 24.95 giây                             | 27.29%           | 14.11 %         |

---
## Điều kiện tiên quyết  
Để thiết lập evaluation environment của riêng bạn và kiểm thử tính năng này, bạn cần chuẩn bị các điều kiện tiên quyết sau:

Tài khoản AWS (AWS account) có quyền truy cập vào các dịch vụ AWS sau:

* [Amazon S3](https://aws.amazon.com/s3/), bao gồm cả [S3 Tables](https://aws.amazon.com/vi/s3/features/tables/).

* [AWS Lake Formation](https://aws.amazon.com/lake-formation/) và AWS Glue Data Catalog.

* [AWS Glue](https://aws.amazon.com/glue/).

* Một Virtual Private Cloud (VPC) với ít nhất hai private subnets. Để biết hướng dẫn, xem [Create a VPC](https://docs.aws.amazon.com/vpc/latest/userguide/create-vpc.html%5d).

* Một EC2 instance loại c5.xlarge chạy Amazon Linux 2023 trên một trong những private subnets này, nơi bạn sẽ khởi chạy data simulator.  
   Đối với security group, bạn có thể sử dụng mặc định của VPC (default for the VPC).  
   Để biết thêm thông tin, xem [Get started with Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html).

* Một [AWS Identity and Access Management](https://aws.amazon.com/iam/) (IAM) user có đầy đủ quyền để tạo và cấu hình tất cả các required resources.

Tạo S3 table bucket và kích hoạt tích hợp với AWS analytics services 

Sau đó, chọn nút Create table bucket, nhập Table bucket name với bất kỳ tên bucket nào bạn muốn, đánh dấu chọn Enable integration, rồi chọn Create table bucket

Thiết lập Amazon S3 storage
s3bucket/  
  /jars  
  /employee.desc   
  /checkpointAvro  
  /checkpointAvroAuto  
  /checkpointORC  
  /checkpointORCAuto

Tải xuống tệp descriptor file  employee.desc từ [GitHub repo](https://github.com/aws-samples/iceberg-streaming-examples/blob/a997a59909203c5c6603e27105c18e16f271af01/src/main/protobuf/Employee.desc) và đặt tệp đó vào S3 bucket mà bạn vừa tạo.

---
## Tải xuống ứng dụng từ releases page  
Tải gói ứng dụng S3Tables-Avro-orc-auto-compaction-benchmark-0.1 từ [GitHub repo](https://github.com/aws-samples/iceberg-streaming-examples/releases/tag/auto-compaction-0.2), sau đó tải tệp JAR lên thư mục “jars” trong S3 bucket. Checkpoint sẽ được sử dụng cho cơ chế Structured Streaming checkpointing. Vì chúng ta sử dụng 4 lần chạy streaming job — một cho dữ liệu đã nén và một cho dữ liệu chưa nén ở mỗi định dạng — nên chúng ta cũng cần tạo một thư mục “checkingpointAuto ” cho cả hai.

---
## Tạo ứng dụng EMR Serverless

Tạo ứng dụng EMR Serverless với các thiết lập sau (tham khảo hướng dẫn chi tiết tại [*Getting started with Amazon EMR Serverless*](https://docs.aws.amazon.com/emr/latest/EMR-Serverless-UserGuide/getting-started.html#gs-console)):

* Type: Spark

* Version: 7.20

* Architecture: x86\_64

* Java Runtime: Java 17

* Metastore Integration: AWS Glue Data Catalog

* Logs: Bật [Amazon CloudWatch Logs](http://aws.amazon.com/cloudwatch) (khuyến nghị nhưng không bắt buộc).

Cấu hình network (VPC, subnets và security group mặc định) để đảm bảo ứng dụng EMR Serverless có thể kết nối với MSK cluster.  
 Ghi lại application-id để sử dụng khi khởi chạy các job.

---
## Tạo MSK cluster

Tạo MSK cluster trên Amazon MSK console. Để biết thêm chi tiết, xem [Get started using Amazon MSK](https://docs.aws.amazon.com/msk/latest/developerguide/getting-started.html). Bạn cần chọn custom create với ít nhất hai brokers sử dụng phiên bản 3.5.1, [Apache Zookeeper](https://zookeeper.apache.org/) mode version, và loại instance kafka.m7g.xlarge. Không sử dụng public access; thay vào đó, hãy chọn hai private subnets để triển khai (mỗi broker trên một subnet hoặc Availability Zone, tổng cộng hai brokers).

Đối với security group, hãy nhớ rằng EMR cluster và Amazon EC2-based producer sẽ cần quyền truy cập vào cluster, vì vậy hãy cấu hình phù hợp.

Về bảo mật , sử dụng PLAINTEXT (lưu ý: trong môi trường production, bạn nên bảo mật truy cập đến cluster). Chọn 200 GB làm dung lượng lưu trữ cho mỗi broker và không bật tiered storage. Đối với network security groups, bạn có thể chọn mặc định của VPC (default of the VPC).

Đối với [MSK cluster configuration](https://docs.aws.amazon.com/msk/latest/developerguide/msk-configuration.html), sử dụng các thiết lập sau:

auto.create.topics.enable=true  
default.replication.factor=2  
min.insync.replicas=2  
num.io.threads=8  
num.network.threads=5  
num.partitions=32  
num.replica.fetchers=2  
replica.lag.time.max.ms=30000  
socket.receive.buffer.bytes=102400  
socket.request.max.bytes=104857600  
socket.send.buffer.bytes=102400  
unclean.leader.election.enable=true  
zookeeper.session.timeout.ms=18000  
compression.type=zstd  
log.retention.hours=2  
log.retention.bytes=10073741824

---
## Cấu hình Data Simulator

Đăng nhập vào EC2 instance của bạn. Vì instance này đang chạy trong private subnet, bạn có thể sử dụng instance endpoint để kết nối. Để tạo endpoint, xem hướng dẫn [Connect to your instances using EC2 Instance Connect Endpoint](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-with-ec2-instance-connect-endpoint.html).

sudo yum install java-17-amazon-corretto-devel  
wget https://archive.apache.org/dist/kafka/3.5.1/kafka\_2.12-3.5.1.tgz  
tar xzvf kafka\_2.12-3.5.1.tgz

---
## Tạo Kafka topics 
Tạo hai Kafka topics — lưu ý rằng bạn cần thay đổi bootstrap server bằng thông tin client tương ứng. Bạn có thể lấy dữ liệu này từ Amazon MSK consol trong details page của cụm MSK cluster của bạn.

**cd kafka\_2.12-3.5.1/bin/**

**./kafka-topics.sh \--topic protobuf-demo-topic-pure \--bootstrap-server kafkaBoostrapString –create**

**Khởi chạy các EMR Serverless Jobs cho Iceberg Tables (Avro/ORC – Compacted & Non-Compacted)**

Bây giờ là lúc để khởi chạy các EMR Serverless streaming jobs cho bốn Iceberg tables khác nhau. Mỗi job sẽ sử dụng một Spark Structured Streaming checkpoint riêng biệt và một Java class cụ thể cho logic ingestion.

Trước khi khởi chạy các job, hãy đảm bảo rằng:

* Bạn đã tắt auto-compaction trong các S3 tables cần thiết (xem phần S3 Tables maintenance). Trong trường hợp này là cho các bảng   employee\_Avro\_uncompacted và   employee\_Avro\_uncompacted

* EMR Serverless IAM role của bạn có quyền đọc/ghi (read/write) từ S3 Tables. Mở AWS Lake Formation [console](https://console.aws.amazon.com/lakeformation), sau đó bạn có thể làm theo [tài liệu](https://docs.aws.amazon.com/lake-formation/latest/dg/s3-tables-grant-permissions.html) hướng dẫn để cấp quyền cho EMR Serverless Role.

Sau khi khởi chạy từng job, hãy khởi chạy data simulator và để nó chạy hoàn tất. Sau đó, bạn có thể hủy job run và khởi chạy job tiếp theo (đồng thời khởi chạy lại data simulator).

---
## Khởi chạy Data Simulator

Tải tệp JAR xuống EC2 instance và chạy producer — lưu ý rằng thao tác này chỉ cần thực hiện một lần.

aws s3 cp s3://s3bucket/jars/streaming-iceberg-ingest-1.0-SNAPSHOT.jar .

Bây giờ bạn có thể khởi động protocol buffer producers bằng cách sử dụng các lệnh sau:  
java \-cp streaming-iceberg-ingest-1.0-SNAPSHOT.jar   
com.aws.emr.proto.kafka.producer.ProtoProducer kafkaBoostrapString

Bạn nên chạy lệnh này cho mỗi bảng (job run), và thực thi lệnh sau khi quá trình ingestion đã bắt đầu.

Table 1: employee\_orc\_uncompacted

Checkpoint: checkpointORC  
Java Class: SparkCustomIcebergIngestMoRS3BucketsORC

aws emr-serverless start-job-run \\  
  \--application-id application-identifier \\  
  \--name employee-orc-uncompacted-job \\  
  \--execution-role-arn arn-of-emrserverless-role \\  
  \--mode 'STREAMING' \\  
  \--job-driver '{  
    "sparkSubmit": {  
      "entryPoint": "s3://s3bucket/jars/streaming-iceberg-ingest-1.0-SNAPSHOT.jar",  
      "entryPointArguments": \["true", "s3://s3bucket/warehouse", "s3://s3bucket/Employee.desc", "s3://s3bucket/checkpointORC", "kafkaBootstrapString", "true"\],  
      "sparkSubmitParameters": "--class com.aws.emr.spark.iot.SparkCustomIcebergIngestMoRS3BucketsORC \--conf spark.executor.cores=16 \--conf spark.executor.memory=64g \--conf spark.driver.cores=4 \--conf spark.driver.memory=16g \--conf spark.dynamicAllocation.minExecutors=3 \--conf spark.dynamicAllocation.maxExecutors=5 \--conf spark.sql.catalog.glue\_catalog.http-client.apache.max-connections=3000 \--conf spark.emr-serverless.executor.disk.type=shuffle\_optimized \--conf spark.emr-serverless.executor.disk=1000G \--conf spark.jars /usr/share/aws/iceberg/lib/iceberg-spark3-runtime.jar \--files s3://s3bucket/Employee.desc \--packages org.apache.spark:spark-sql-kafka-0-10\_2.12:3.5.1"  
    }  
  }'

Table 2: employee\_avro\_uncompacted

Checkpoint: checkpointAvro  
Java Class: SparkCustomIcebergIngestMoRS3BucketsAvro

aws emr-serverless start-job-run \\  
  \--application-id application-identifier \\  
  \--name employee-Avro-uncompacted-job \\  
  \--execution-role-arn arn-of-emrserverless-role \\  
  \--mode 'STREAMING' \\  
  \--job-driver '{  
    "sparkSubmit": {  
      "entryPoint": "s3://s3bucket/jars/streaming-iceberg-ingest-1.0-SNAPSHOT.jar",  
      "entryPointArguments": \["true", "s3://s3bucket/warehouse", "s3://s3bucket/Employee.desc", "s3://s3bucket/checkpointAvro", "kafkaBootstrapString", "true"\],  
      "sparkSubmitParameters": "--class com.aws.emr.spark.iot.SparkCustomIcebergIngestMoRS3BucketsAvro \--conf spark.executor.cores=16 \--conf spark.executor.memory=64g \--conf spark.driver.cores=4 \--conf spark.driver.memory=16g \--conf spark.dynamicAllocation.minExecutors=3 \--conf spark.dynamicAllocation.maxExecutors=5 \--conf spark.sql.catalog.glue\_catalog.http-client.apache.max-connections=3000 \--conf spark.emr-serverless.executor.disk.type=shuffle\_optimized \--conf spark.emr-serverless.executor.disk=1000G \--conf spark.jars  /usr/share/aws/iceberg/lib/iceberg-spark3-runtime.jar \--files s3://s3bucket/Employee.desc \--packages org.apache.spark:spark-sql-kafka-0-10\_2.12:3.5.1"  
    }  
  }'

Table 3: employee\_orc (Tự động nén)

Checkpoint: checkpointORCAuto  
Java Class: SparkCustomIcebergIngestMoRS3BucketsAutoORC

aws emr-serverless start-job-run \\  
  \--application-id application-identifier \\  
  \--name employee-orc-auto-job \\  
  \--execution-role-arn arn-of-emrserverless-role \\  
  \--mode 'STREAMING' \\  
  \--job-driver '{  
    "sparkSubmit": {  
      "entryPoint": "s3://s3bucket/jars/streaming-iceberg-ingest-1.0-SNAPSHOT.jar",  
      "entryPointArguments": \["true", "s3://s3bucket/warehouse", "s3://s3bucket/Employee.desc", "s3://s3bucket/checkpointORCAuto", "kafkaBootstrapString", "true"\],  
      "sparkSubmitParameters": "--class com.aws.emr.spark.iot.SparkCustomIcebergIngestMoRS3BucketsAutoORC \--conf spark.executor.cores=16 \--conf spark.executor.memory=64g \--conf spark.driver.cores=4 \--conf spark.driver.memory=16g \--conf spark.dynamicAllocation.minExecutors=3 \--conf spark.dynamicAllocation.maxExecutors=5 \--conf spark.sql.catalog.glue\_catalog.http-client.apache.max-connections=3000 \--conf spark.emr-serverless.executor.disk.type=shuffle\_optimized \--conf spark.emr-serverless.executor.disk=1000G \--conf spark.jars /usr/share/aws/iceberg/lib/iceberg-spark3-runtime.jar \--files s3://s3bucket/Employee.desc \--packages org.apache.spark:spark-sql-kafka-0-10\_2.12:3.5.1"  
    }  
  }'

Table 4: employee\_avro (Tự động nén)

Checkpoint: checkpointAvroAuto  
Java Class: SparkCustomIcebergIngestMoRS3BucketsAutoAvro

aws emr-serverless start-job-run \\  
  \--application-id application-identifier \\  
  \--name employee-Avro-auto-job \\  
  \--execution-role-arn arn-of-emrserverless-role \\  
  \--mode 'STREAMING' \\  
  \--job-driver '{  
    "sparkSubmit": {  
      "entryPoint": "s3://s3bucket/jars/streaming-iceberg-ingest-1.0-SNAPSHOT.jar",  
      "entryPointArguments": \["true", "s3://s3bucket/warehouse", "s3://s3bucket/Employee.desc", "s3://s3bucket/checkpointAvroAuto", "kafkaBootstrapString", "true"\],  
      "sparkSubmitParameters": "--class com.aws.emr.spark.iot.SparkCustomIcebergIngestMoRS3BucketsAutoAvro \--conf spark.executor.cores=16 \--conf spark.executor.memory=64g \--conf spark.driver.cores=4 \--conf spark.driver.memory=16g \--conf spark.dynamicAllocation.minExecutors=3 \--conf spark.dynamicAllocation.maxExecutors=5 \--conf spark.sql.catalog.glue\_catalog.http-client.apache.max-connections=3000 \--conf spark.emr-serverless.executor.disk.type=shuffle\_optimized \--conf spark.emr-serverless.executor.disk=1000G \--conf spark.jars /usr/share/aws/iceberg/lib/iceberg-spark3-runtime.jar \--files s3://s3bucket/Employee.desc \--packages org.apache.spark:spark-sql-kafka-0-10\_2.12:3.5.1"  
    }  
  }'

---
## Truy vấn và kết hợp dữ liệu từ các bảng S3 để xây dựng thông tin chi tiết

Bạn có thể truy cập [Athena Console](https://ap-southeast-2.signin.aws.amazon.com/oauth?client_id=arn%3Aaws%3Asignin%3A%3A%3Aconsole%2Faws751&code_challenge=jXi0S4m8FDhe5EhIl_yeE_VahmV1j-JnPwQgbG4S8Dg&code_challenge_method=SHA-256&response_type=code&redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fathena%3FhashArgs%3D%2523%26isauthcode%3Dtrue%26oauthStart%3D1759577176516%26state%3DhashArgsFromTB_ap-southeast-2_b74a00833c569c46) và chạy các truy vấn tại đó. Hãy đảm bảo rằng quyền Lake Formation đã được áp dụng trên catalog database và các bảng cho [IAM](https://docs.aws.amazon.com/athena/latest/ug/security-iam-athena.html) role của bạn trên Console. Để biết thêm chi tiết, hãy tham khảo tài liệu [Grant Lake Formation permissions on your table.](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-getting-started.html#s3-tables-tutorial-create-table)

Để đo hiệu năng các truy vấn trong Athena, bạn có thể chạy mỗi truy vấn nhiều lần — thông thường là năm lần cho mỗi truy vấn — để có được ước lượng hiệu suất đáng tin cậy.Trong Athena Console, chỉ cần chạy lại cùng một truy vấn nhiều lần và ghi lại thời gian thực thi cho mỗi lần chạy (được hiển thị trong phần *query history*).Sau khi có năm kết quả thời gian thực thi, hãy tính trung bình để có được giá trị benchmark đại diện.Cách làm này giúp giảm thiểu ảnh hưởng của tải nền (background load), từ đó mang lại kết quả hiệu năng nhất quán và có ý nghĩa hơn.

**Query 1**

SELECT role, team, avg(age) AS average\_age

FROM bigdata."employee\_orc"

GROUP BY role, team

ORDER BY average\_age DESC

**Query 2**

SELECT team, name, min(age) as youngest\_age

FROM "bigdata"."employee\_Avro" 

GROUP BY team, name

ORDER BY youngest\_age ASC

**Query 3** 

SELECT name, age, start\_date, role, team

FROM bigdata."employee\_Avro"

WHERE CAST(start\_date as DATE) \> CAST('2023-01-02' as DATE) and age \> 40

ORDER BY start\_date DESC

limit 100

---
## Kết luận:

AWS đã mở rộng hỗ trợ tối ưu hóa bảng Iceberg để bao gồm tất cả các định dạng tệp mà Iceberg hỗ trợ: Parquet, Avro và ORC. Khả năng nén (compaction) toàn diện này hiện đã khả dụng cho cả Amazon S3 Tables và các bảng Iceberg trong các S3 bucket thông thường, sử dụng kiến trúc lakehouse trong SageMaker với khả năng tối ưu hóa từ Glue Data Catalog. [S3 Tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-regions-quotas.html) mang lại trải nghiệm được quản lý hoàn toàn thông qua việc tối ưu hóa liên tục, tự động duy trì các bảng của bạn bằng cách xử lý việc nén dữ liệu, lưu giữ snapshot và loại bỏ các tệp không được tham chiếu. Những tính năng bảo trì tự động này giúp cải thiện đáng kể hiệu suất truy vấn và giảm chi phí cho các công cụ truy vấn. Hỗ trợ nén cho các định dạng Avro và ORC hiện đã có sẵn tại tất cả các khu vực AWS nơi S3 Tables hoặc tính năng tối ưu hóa với [AWS Glue Data Catalog](https://docs.aws.amazon.com/glue/latest/dg/regions-optimizers.html) được cung cấp. Để tìm hiểu thêm về tính năng nén của S3 Tables, hãy xem [tài liệu](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-maintenance.html) về S3 Tables maintenance. Đối với việc tối ưu hóa trên các bucket thông thường, hãy tham khảo [tài liệu](https://docs.aws.amazon.com/glue/latest/dg/table-optimizers.html) về Glue Data Catalog optimization.

Đặc biệt cảm ơn tất cả những người đã đóng góp cho lần ra mắt này: Matthieu Dufour, Srishti Bhargava, Stylianos Herodotou, Kannan Ratnasingham, Shyam Rathi, và David Lee

## Giới thiệu về các tác giả

![Angel Conde Manjon](/images/3-Blog/Angel.jpeg)**Angel Conde Manjon** là Sr. Partner Solutions Architect \- PSA phụ trách khu vực EMEA (Châu Âu, Trung Đông và Châu Phi) trong lĩnh vực Dữ liệu và Trí tuệ nhân tạo , hiện làm việc tại Madrid, Tây Ban Nha. Trước đây, ông từng tham gia các dự án nghiên cứu châu Âu liên quan đến phân tích dữ liệu  và trí tuệ nhân tạo . Trong vai trò hiện tại, Angel hỗ trợ các đối tác phát triển doanh nghiệp dựa trên các giải pháp về Dữ liệu và AI, giúp họ tận dụng công nghệ AWS để mở rộng năng lực đổi mới và chuyển đổi số.

![Diego Colombatto](/images/3-Blog/Diego.jpeg)**Diego Colombatto** là Principal Partner Solutions Architect tại AWS, với hơn 15 năm kinh nghiệm trong việc thiết kế và triển khai các dự án Digital Transformation cho các doanh nghiệp lớn. Tại AWS, Diego tư vấn cho các đối tác và khách hàng về cách tận dụng công nghệ AWS để chuyển nhu cầu kinh doanh thành các giải pháp kỹ thuật hiệu quả. Ông có niềm đam mê đặc biệt với kiến trúc giải pháp , giao dịch thuật toán và nấu ăn , và luôn sẵn lòng thảo luận về những chủ đề này.

![Sandeep Adwankar](/images/3-Blog/Sandeep.jpeg)**Sandeep Adwankar** là Senior Technical Product Manager tại AWS, hiện làm việc tại Khu vực Vịnh California (California Bay Area). Ông hợp tác với khách hàng trên toàn cầu để chuyển đổi các yêu cầu kỹ thuật và kinh doanh thành sản phẩm cụ thể, giúp khách hàng nâng cao khả năng quản lý, bảo mật và truy cập dữ liệu.

