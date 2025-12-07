---
title: "Blog 1"
date: "13/09/2025"
weight: 1
chapter: false
pre: " <b> 3.1. </b> "
---


# Amazon EKS hỗ trợ workload AI/ML ở mức ultra scale với 100K nodes mỗi cluster

Được viết bởi ramadit vào ngày 16 tháng 7 năm 2025 trong [Amazon Elastic Kubernetes Service](https://aws.amazon.com/vi/blogs/containers/category/compute/amazon-kubernetes-service/), [Thông báo](https://aws.amazon.com/vi/blogs/containers/category/post-types/announcements/), [Trí tuệ nhân tạo,](https://aws.amazon.com/vi/blogs/containers/category/artificial-intelligence/) [AWS Trainium](https://aws.amazon.com/vi/blogs/containers/category/artificial-intelligence/aws-trainium/), [Generative AI](https://aws.amazon.com/blogs/containers/category/artificial-intelligence/generative-ai/), [Tư tưởng Lãnh đạo](https://aws.amazon.com/vi/blogs/containers/category/post-types/thought-leadership/).*

Chúng tôi rất vui mừng thông báo rằng [**Amazon Elastic Kubernetes Service (Amazon EKS)**](https://aws.amazon.com/eks/) hiện đã hỗ trợ lên đến 100.000 worker nodes trong một cluster duy nhất, cho phép khách hàng mở rộng tới 1,6 triệu [**AWS Trainium**](https://aws.amazon.com/ai/machine-learning/trainium/) accelerators hoặc 800.000 NVIDIA GPUs để huấn luyện và vận hành các mô hình AI/ML lớn nhất. Năng lực này giúp khách hàng theo đuổi những mục tiêu AI tham vọng nhất, từ việc huấn luyện các mô hình có hàng nghìn tỷ tham số cho đến thúc đẩy artificial general intelligence (AGI). Amazon EKS cung cấp khả năng mở rộng dẫn đầu ngành này với Kubernetes conformance, đảm bảo rằng khách hàng có thể đạt được những đột phá này cùng với sự lựa chọn các công cụ và framework mã nguồn mở.

Kubernetes đã trở thành một yếu tố then chốt giúp khách hàng vận hành các AI/ML workloads ở quy mô lớn nhờ khả năng mở rộng linh hoạt để đáp ứng các nhu cầu tính toán thay đổi, cùng bộ sưu tập phong phú các AI/ML frameworks và tools. Tuy nhiên, khi các mô hình AI/ML tiếp tục phát triển về độ phức tạp, chúng yêu cầu những năng lực cao cấp vượt ra ngoài ranh giới truyền thống của Kubernetes. Bằng cách tận dụng các năng lực hàng đầu của AWS về resilience, security, và availability, được tăng cường với những đổi mới kỹ thuật và sự hợp tác cộng đồng mã nguồn mở, Amazon EKS đã tạo ra những cải tiến mang tính chuyển đổi để cung cấp cho khách hàng khả năng mở rộng, hiệu năng và độ tin cậy cần thiết cho các AI/ML workloads tiên tiến và quy mô lớn nhất, đồng thời vẫn giữ trải nghiệm Kubernetes quen thuộc.

---

## Thúc đẩy cơ sở hạ tầng AI quy mô siêu lớn, hiệu năng cao với Amazon EKS

Các mô hình state-of-the-art (SOTA) tuân theo các quy luật mở rộng thực nghiệm – khi chúng tăng kích thước với nhiều dữ liệu huấn luyện hơn, chúng thể hiện năng lực được cải thiện đáng kể trong việc hiểu ngữ cảnh, reasoning và tự động giải quyết các tác vụ phức tạp. Những nhà phát triển hàng đầu của các mô hình tiên phong này – Anthropic, với Claude, và Amazon, với [Amazon Nova](https://aws.amazon.com/ai/generative-ai/nova/), đã áp dụng Amazon EKS và khả năng ultra scale của nó để mở rộng một cluster lên đến 100K nodes. Với các loại [Amazon EC2](https://aws.amazon.com/vi/pm/ec2/) accelerated computing instances, điều này đồng nghĩa với việc tận dụng hiệu năng của đến 1,6 triệu [Trn2 instances](https://aws.amazon.com/vi/ec2/instance-types/trn2/) hoặc 800.000 NVIDIA H200/Blackwell GPUs với [P5e/P6](https://aws.amazon.com/vi/ec2/instance-types/p5/) instances. Mức độ mở rộng này, trong một cluster Amazon EKS duy nhất, mang lại cho khách hàng những lợi ích độc đáo:

* **Tăng tốc đổi mới AI/ML:** Khả năng chạy các công việc đào tạo AI/ML lớn nhất đòi hỏi quy mô chưa từng có bằng cách điều phối hiệu quả hàng trăm nghìn GPU và bộ tăng tốc AI như một hệ thống đơn lẻ.  
    
* **Giảm chi phí:** Hợp nhất các khối lượng công việc đa dạng, từ đào tạo quy mô lớn đến tinh chỉnh và suy luận trong một môi trường thống nhất để giảm chi phí vận hành và cải thiện tổng thể việc sử dụng tài nguyên. Điều này giúp tối ưu hóa các khoản đầu tư vào các bộ tăng tốc AI đắt đỏ.  
    
* **Cung cấp sự lựa chọn và linh hoạt:** Tự do sử dụng các framework, quy trình làm việc và công cụ AI/ML ưa thích, cả độc quyền và mã nguồn mở, theo nhu cầu cụ thể trong khi vẫn duy trì khả năng tương thích hoàn toàn với các API Kubernetes tiêu chuẩn.

Amazon EKS đã triển khai các thay đổi kiến trúc trên toàn bộ stack, bao gồm các cải tiến đối với các thành phần cốt lõi của Kubernetes, để hỗ trợ AI/ML workloads ở mức ultra scale này. Với etcd storage layer được tái thiết kế để quản lý state hiệu quả và control plane được tối ưu hóa để xử lý hàng triệu operations, Amazon EKS hiện có thể cung cấp hiệu năng cao hơn một cách nhất quán. Những cải tiến này cũng cho phép điều phối tài nguyên hiệu quả hơn bằng cách hỗ trợ hàng nghìn hoạt động pod đồng thời và khả năng giám sát, phục hồi nâng cao, mang lại độ bền vững cao ở quy mô ultra scale.

## Trao quyền cho thế hệ mô hình AI tiếp theo với Anthropic

Nhà sáng tạo AI hàng đầu và đối tác AWS, Anthropic, vận hành dòng Claude foundation models trên Amazon EKS và quản lý một số cluster EKS lớn nhất trong sản xuất, bao gồm AWS Trainium (trn2) instances và NVIDIA GPUs cho workloads AI cùng với [AWS Graviton processors](https://aws.amazon.com/vi/ec2/graviton/) cho các tác vụ xử lý dữ liệu chuyên sâu về CPU. Môi trường hợp nhất này cho phép họ chuyển đổi workloads giữa các use case AI/ML khác nhau và tối ưu hóa việc phân bổ tài nguyên cho các nhóm nghiên cứu.

Việc đạt được hoạt động ổn định ở quy mô rất lớn với multi-cluster architecture đã đặt ra một số thách thức độc đáo cho Anthropic trong các lĩnh vực networking, control plane operations và resource management. Bằng cách tận dụng các khả năng ultra scale mới của Amazon EKS, bao gồm các tối ưu hóa ở tầng networking và trong Kubernetes control plane, Anthropic đã đạt được những cải thiện hiệu suất đáng kể, với các chỉ số end user latency KPIs tăng từ mức trung bình 35% lên ổn định trên 90%.

“Làm việc với AWS, chúng tôi đã nâng cao năng lực hạ tầng AI của mình với Amazon EKS hỗ trợ cluster lên đến 100K nodes. Sự kết hợp giữa quy mô dẫn đầu ngành của EKS và các tùy chọn accelerated compute của AWS giúp củng cố nền tảng cho một AI an toàn và có thể mở rộng” – Nova DasSarma, Technical Lead for Anthropic Infrastructure

---


![**Hình 1:** Tỷ lệ các write API calls hoàn thành trong vòng 15ms tăng từ 35% lên 90% với khả năng ultra scale của EKS.](/images/3-Blog/Titan-blog-image.png) 

**Hình 1:** Tỷ lệ các write API calls hoàn thành trong vòng 15ms tăng từ 35% lên 90% với khả năng ultra scale của EKS.

## Thúc đẩy Trí tuệ Nhân tạo Tổng quát (AGI) trong Amazon

Đội AGI infrastructure của Amazon xây dựng và vận hành hạ tầng cho dòng Nova foundation models. Các use case của họ bao gồm từ các massive training jobs điều phối hàng nghìn nodes song song đến các quy trình hậu huấn luyện phức tạp như model evaluation, distillation, và reinforcement learning. Những workloads này yêu cầu khả năng điều phối hạ tầng tinh vi ở quy mô rất lớn và năng lực phục hồi nhanh để duy trì độ tin cậy và hiệu suất cao.

Để đáp ứng những nhu cầu này, nhóm sử dụng kết hợp Amazon EKS và [Amazon SageMaker HyperPod](https://aws.amazon.com/sagemaker-ai/hyperpod/), giúp nâng cao khả năng chạy các training jobs kéo dài với giám sát tình trạng tự động và khôi phục sự cố, dẫn đến giảm downtime và hiệu suất cao. Nhóm cũng tận dụng khả năng ultra scale của Amazon EKS và sự tích hợp với các dịch vụ AWS quan trọng về bảo mật và giám sát để duy trì hiệu năng ổn định trên toàn bộ các workflows huấn luyện và inference chuyên sâu về tính toán.

“Amazon EKS và SageMaker HyperPod đóng vai trò then chốt trong việc giúp chúng tôi vượt qua các rào cản của việc đào tạo mô hình AI nền tảng ở quy mô chưa từng có, đồng thời mang lại độ bền vững cao mà khối lượng công việc của chúng tôi yêu cầu. Nền tảng công nghệ này không chỉ thúc đẩy tiến trình đổi mới của chúng tôi mà còn trở thành nền tảng chiến lược để xây dựng thế hệ khả năng AGI tiếp theo, vốn sẽ làm thay đổi cách thế giới tương tác với AI.” – Rohit Prasad, Phó Chủ tịch cấp cao & Nhà khoa học Trưởng, AGI

---
## Xây dựng cho Tương lai

Các công nghệ AI/ML đang phát triển với tốc độ chưa từng thấy, nhưng tính hiệu quả của chúng bị ảnh hưởng trực tiếp bởi sức mạnh tính toán mà chúng có thể khai thác một cách hiệu quả. Với sự hỗ trợ cho các cụm quy mô siêu lớn, Amazon EKS đã phát triển nhiều khả năng nền tảng trên toàn bộ stack tính toán để cho phép khách hàng tiếp tục nâng cao quy mô hoạt động của họ trong khi thúc đẩy hiệu năng, độ bền vững, bảo mật và hiệu quả cao hơn. Với những tiến bộ này, khách hàng có thể sử dụng sức mạnh của Kubernetes và tận dụng bộ khả năng đám mây rộng nhất và sâu nhất của AWS để xây dựng các ứng dụng tinh vi và thông minh nhất của họ.

Để khám phá đầy đủ các tiến bộ kỹ thuật cho phép quy mô này, vui lòng đọc bài [blog chuyên sâu](https://aws.amazon.com/vi/blogs/containers/under-the-hood-amazon-eks-ultra-scale-clusters/) chi tiết về các quyết định kiến trúc, thách thức triển khai và các giải pháp đã được phát triển. Vui lòng liên hệ với nhóm tài khoản AWS của bạn để tìm hiểu thêm về khả năng mới này.

---