---
title: "Blog 3"
date: "`r Sys.Date()`"
weight: 1
chapter: false
pre: " <b> 3.3. </b> "
---


# Accenture mở rộng khả năng phân tích video với Amazon Nova và Amazon Bedrock Agents  
Bởi Ilan Geller, Kamal Mannar, Debasmita Ghosh, Nakul Aggarwal, Aramide Kehinde, và Rajdeep Banerjee – đăng ngày 16 tháng 7 năm 2025 trong chuyên mục [Amazon Bedrock](https://aws.amazon.com/blogs/machine-learning/category/artificial-intelligence/amazon-machine-learning/amazon-bedrock/), [Amazon Bedrock Agents](https://aws.amazon.com/vi/blogs/machine-learning/category/artificial-intelligence/amazon-machine-learning/amazon-bedrock/amazon-bedrock-agents/), [Amazon Nova](https://aws.amazon.com/vi/blogs/machine-learning/category/artificial-intelligence/amazon-machine-learning/amazon-bedrock/amazon-nova/), [Customer Solutions](https://aws.amazon.com/vi/blogs/machine-learning/category/post-types/customer-solutions/)

Bài viết này được thực hiện cùng với Ilan Geller, Kamal Mannar, Debasmita Ghosh và Nakul Aggarwal từ Accenture.

Các đoạn video nổi bật (video highlights) mang đến một cách mạnh mẽ để tăng mức độ tương tác của khán giả và mở rộng giá trị nội dung cho các nhà xuất bản. Những clip ngắn, có sức ảnh hưởng cao này giúp nắm bắt các khoảnh khắc quan trọng, thúc đẩy người xem tiếp tục theo dõi, mở rộng phạm vi lan tỏa trên mạng xã hội, củng cố nhận diện thương hiệu và mở ra những cơ hội kiếm tiền mới. Tuy nhiên, quy trình tạo video highlight theo cách truyền thống lại chậm và tốn nhiều công sức. Biên tập viên phải xem lại toàn bộ cảnh quay, xác định những khoảnh khắc đáng chú ý, cắt ghép clip, thêm hiệu ứng chuyển cảnh hoặc lời dẫn—sau đó là kiểm tra chất lượng thủ công và định dạng cho việc phân phối. Dù cách này đảm bảo kiểm soát biên tập, nhưng nó tạo ra những điểm nghẽn khiến quy trình không thể mở rộng hiệu quả.

Bài viết này trình bày cách [Accenture Spotlight](https://aws.amazon.com/marketplace/pp/prodview-6b26i5zq6ko3e?sr=0-16&ref_=beagle&applicationId=AWSMPContessa) mang đến một giải pháp tạo video highlight có khả năng mở rộng, tiết kiệm chi phí bằng cách sử dụng [Amazon Nova](https://aws.amazon.com/vi/ai/generative-ai/nova/) và [Amazon Bedrock Agents](https://aws.amazon.com/vi/bedrock/agents/). Các nền tảng Amazon Nova foundation models (FMs) cung cấp khả năng phân tích tiên tiến với hiệu năng và chi phí hàng đầu trong ngành. Với Spotlight, các nhà sở hữu nội dung có thể cấu hình các mô hình và agent AI để hỗ trợ nhiều trường hợp sử dụng khác nhau trong lĩnh vực truyền thông, đồng thời cung cấp tùy chọn “human-in-the-loop” (con người trong vòng kiểm soát) để đảm bảo chất lượng và tinh chỉnh kết quả. Giải pháp này duy trì độ chính xác, giám sát biên tập và tuân thủ nguyên tắc thương hiệu—mà không ảnh hưởng đến tốc độ hay khả năng mở rộng.

---
## Các trường hợp sử dụng trong thực tế

* Tạo video ngắn cá nhân hóa – Các agent chuyên biệt của Spotlight phân tích nội dung video ngắn phổ biến (chẳng hạn như video reels và nội dung mạng xã hội) để xác định các mẫu nội dung có hiệu suất cao. Sau đó, các agent này áp dụng hiểu biết đó vào video dài để tạo ra các đoạn clip ngắn được cá nhân hóa, kèm theo các bước kiểm tra tích hợp để đảm bảo phù hợp với thương hiệu và tiêu chuẩn nội dung.

* Biên tập và tạo video nổi bật cho thể thao – Spotlight tự động hóa việc tạo các đoạn highlight thể thao như bóng đá, Công thức 1 (Formula 1\) hay bóng bầu dục (rugby), được tùy chỉnh theo sở thích và mối quan tâm của từng người dùng. Hệ thống cũng xác thực chất lượng và độ chính xác của từng đoạn highlight, từ đó hợp lý hóa quy trình làm việc của đội ngũ biên tập.

* Ghép nội dung phù hợp cho các bên liên quan – Bằng cách sử dụng siêu dữ liệu (metadata) được làm giàu, Spotlight có thể ghép nối nội dung video lưu trữ hoặc phát trực tiếp với nhân khẩu học của khán giả, giúp tối ưu hóa chiến lược phân phối và tối đa hóa giá trị quảng cáo thông qua khả năng nhắm mục tiêu chính xác.

* Tạo ưu đãi bán lẻ theo thời gian thực – Trong các môi trường bán lẻ như trạm xăng, Spotlight xử lý hình ảnh từ CCTV trực tiếp để suy luận hồ sơ khách hàng dựa trên dữ liệu (ví dụ: loại xe hoặc lịch sử giao dịch), sau đó tạo ra các ưu đãi sản phẩm cá nhân hóa một cách động. Các ưu đãi này còn tính đến các yếu tố ngữ cảnh như thời gian trong ngày hoặc thời tiết và được hiển thị với hình ảnh tùy chỉnh gần như theo thời gian thực.

---
## Kiến trúc của Spotlight

Kiến trúc của Spotlight được thiết kế để giải quyết thách thức trong việc xử lý video ở quy mô lớn, cho phép phân tích và tạo nội dung một cách hiệu quả mà vẫn đảm bảo tốc độ và chất lượng. Hệ thống này kết hợp cả các mô hình chuyên biệt theo tác vụ và Amazon Nova FMs, được điều phối bởi các Amazon Bedrock agents chuyên dụng.

Các điểm nổi bật trong kiến trúc:

* Task-driven model selection – Spotlight tự động lựa chọn giữa các mô hình AI truyền thống và Amazon Nova FMs dựa trên độ phức tạp và yêu cầu độ trễ của từng tác vụ. Cách điều phối thông minh này cho phép xử lý suy luận nhanh đối với các tác vụ yêu cầu thời gian thực, đồng thời triển khai khả năng suy luận đa phương thức (multimodal reasoning) sâu hơn khi cần phân tích phức tạp — giúp cân bằng giữa tốc độ và trí tuệ trong các ứng dụng, từ việc tạo ưu đãi bán lẻ theo thời gian thực cho đến xử lý video nâng cao.

* Agent orchestratio – Các agent chuyên biệt, được xây dựng riêng cho từng nhiệm vụ phân tích, hoạt động trong toàn bộ quy trình công việc dưới sự điều khiển của một orchestrator agent trung tâm. Orchestrator agent này chịu trách nhiệm phân tách tác vụ, quản lý luồng dữ liệu và điều phối giao tiếp giữa các agent.

* Scalable and adaptable – Nhờ tận dụng năng lực của AWS, kiến trúc của Spotlight có thể cấu hình để hỗ trợ nhiều loại khối lượng công việc khác nhau — từ việc tạo video highlight với thông lượng cao cho đến cá nhân hóa ưu đãi có độ trễ thấp tại biên (edge).

Spotlight sử dụng một quy trình làm việc nhiều tầng của các agent để tự động hóa việc xử lý và tạo video trong khi vẫn duy trì kiểm soát chất lượng. Ví dụ, để tạo các đoạn video highlight động, Spotlight triển khai ba “super agents” chuyên biệt phối hợp dưới sự giám sát của một orchestrator agent trung tâm. Mỗi super agent được vận hành bởi các mô hình Amazon Nova, và được hỗ trợ bởi một nhóm utility agents (như minh họa trong sơ đồ bên dưới). Các agent này phối hợp để hiểu nội dung video, tạo ra các đoạn highlight chất lượng cao, đồng thời đảm bảo tuân thủ yêu cầu người dùng và tiêu chuẩn thương hiệu.

![Workflow](/images/3-Blog/accenture.png) Workflow bao gồm các super agents và utility agents sau:

* Video Processing Agent – Agent này phân tích video dài (long-form video) và tạo metadata chi tiết để định hướng quá trình tạo video ngắn. Nó sử dụng các utility agents sau:

  * Research Agent – Phân tích các video ngắn phổ biến để xác định những yếu tố chính tạo nên độ lan truyền (virality) và xây dựng “công thức thành công” cho nội dung ngắn. Ví dụ, trong video ca nhạc, agent này có thể nhận diện các phân đoạn vũ đạo nổi bật của ca sĩ chính như những phần quan trọng, đồng thời tạo ra một “công thức” dựa trên những hiểu biết đó.

  * Visual Analysis Agent – Áp dụng các phát hiện từ Research Agent vào nội dung video dài mới. Nó xác định các đoạn phù hợp, gắn thẻ (tag) nhân vật chính, và đánh dấu thời gian (timestamp) cho những khoảnh khắc liên quan. Agent này sử dụng các mô hình AI truyền thống (chẳng hạn như nhận dạng và theo dõi người) để thu thập chi tiết ở mức độ cao, phục vụ cho việc xác định phân đoạn chính xác.

  * Audio Analysis Agent – Thực hiện speech diarization (phân tách người nói) và transcription (chuyển lời nói thành văn bản), nhằm hỗ trợ Research Agent và Visual Analysis Agent với ngữ cảnh sâu hơn được trích xuất từ phần âm thanh của video.

* Short Video Generation Agent – Agent này điều phối việc tạo video ngắn thực tế bằng cách tích hợp các phân đoạn liên quan và tinh chỉnh trình tự. Nó bao gồm các utility agents sau:

  * Section of Interest (SOI) Agent – Xác định các phân đoạn tiềm năng dựa trên thể loại video, độ dài mong muốn, nhân vật chính, và dữ liệu JSON được tạo ra bởi Visual Analysis Agent. Agent này ưu tiên sự liền mạch logic và mức độ thu hút của người xem.

  * Video Generation Agent – Xây dựng video dựa trên các đề xuất phân đoạn và mẫu cấu trúc từ Video Processing Agent. Ví dụ, video của influencer có thể theo cấu trúc gồm phần mở đầu thu hút (hook), thông điệp chính, và lời kêu gọi hành động (call to action). Quá trình này được cải thiện lặp lại dựa trên phản hồi từ Reviewer Agent.

  * Video Postprocessing Agent – Tinh chỉnh sản phẩm cuối cùng để sẵn sàng xuất bản, bằng cách thực hiện các tác vụ như cắt khung hình phù hợp với tỷ lệ hiển thị trên thiết bị di động, thêm phụ đề, nhạc nền, và brand overlay.

* Reviewer Agent – Agent này làm việc lặp lại với Video Generation Agent để duy trì chất lượng và tính phù hợp của video. Nó bao gồm các utility agents sau:

  * Relevance Check Agent – Đánh giá mức độ phù hợp của video so với hướng dẫn nội dung do người dùng định nghĩa, kỳ vọng của khán giả, và chủ đề mong muốn.

  * Abruptness Check Agent – Đảm bảo các chuyển cảnh mượt mà giữa các phân đoạn, tránh cắt cảnh đột ngột, từ đó nâng cao trải nghiệm người xem và tính chuyên nghiệp của video.

---
## Tổng quan giải pháp
Để tương tác với Spotlight, người dùng truy cập vào giao diện frontend, nơi họ cung cấp đầu vào bằng ngôn ngữ tự nhiên để mô tả mục tiêu của mình. Spotlight sau đó sử dụng quy trình tác vụ dạng agent (agentic workflow) được vận hành bởi Amazon Nova để thực hiện nhiệm vụ được giao. Sơ đồ dưới đây minh họa kiến trúc giải pháp cho việc tạo video highlight.

![Solution-Diagram](/images/3-Blog/accenture-solution.png) 
Workflow bao gồm các thành phần chính sau (được đánh số trong sơ đồ trên):


1\. Frontend UI cho tương tác người dùng:

* Người dùng tương tác thông qua web portal được bảo mật bởi Amazon Cognito authentication và phân phối bằng [Amazon CloudFront](https://aws.amazon.com/vi/cloudfront/).

* [Amazon API Gateway](https://aws.amazon.com/vi/api-gateway/) cung cấp một RESTful endpoint cho các dịch vụ xử lý video và tạo video highlight.

2\. Xử lý luồng video trực tiếp (Live video stream processing):

* [AWS Elemental MediaLive](https://aws.amazon.com/medialive/) xử lý luồng video đầu vào và kích hoạt [AWS Lambda](http://aws.amazon.com/lambda) để khởi tạo quy trình làm việc.

* (Spotlight cũng hỗ trợ xử lý nội dung video lưu trữ dưới dạng media files để tạo video highlight.)

3\. Quy trình xử lý video được điều phối bằng [AWS Step Functions](https://aws.amazon.com/vi/step-functions/) 

* Các open-source models được lưu trữ trên Amazon SageMaker hỗ trợ speech analysis và (computer vision cho việc nhận diện người và vật thể.

* Video Processing Agent được vận hành bởi Amazon Nova Pro phân tích video và tạo metadata chi tiết (ví dụ: xác định các mẫu từ video lan truyền – viral videos).

* Reviewer Agent sử dụng Amazon Nova Premier để đảm bảo sự phù hợp với tiêu chuẩn thương hiệu.

* Các open source utility tooling được sử dụng cho các tác vụ pre-analysis task.

4\. Quy trình tạo video highlight được điều phối với Step Functions:

* Amazon Nova Pro phân tích user query để xác định các đoạn video quan trọng, hiểu rõ mục đích và reformulate query cho bước xử lý tiếp theo.

* Short Video Generation Agent sử dụng Amazon Nova Pro để xây dựng video highlight dựa trên các đề xuất phân đoạn.

* Reviewer Agent sử dụng Amazon Nova Premier để đảm bảo rằng video highlight được tạo ra phù hợp với chất lượng, tiêu chuẩn thương hiệu và ngữ cảnh.

* [AWS Elemental MediaConvert](https://aws.amazon.com/mediaconvert/) cùng với các công cụ mã nguồn mở được sử dụng để xây dựng và hậu kỳ video highlight, bao gồm việc thêm phụ đề, thay đổi tỷ lệ khung hình và thêm hiệu ứng chuyển cảnh).

5\. Lưu trữ và giám sát (Storage and Monitoring):

* [Amazon Simple Storage Service](https://aws.amazon.com/pm/serv-s3/) (Amazon S3) lưu trữ metadata được trích xuất từ quy trình xử lý, nội dung tham chiếu (ví dụ: kịch bản, hướng dẫn thương hiệu) và sản phẩm đầu ra đã tạo.

* [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) giám sát tình trạng hệ thống end-to-end và theo dõi hiệu suất tổng thể.

---
## Lợi ích chính

Phương pháp xử lý và tạo video của Spotlight mang lại giá trị linh hoạt và mạnh mẽ. Ngoài ra, thiết kế kỹ thuật của hệ thống – sử dụng Amazon Nova kết hợp với quy trình làm việc agentic workflow – giúp các nhà sở hữu nội dung nâng cao hiệu quả trong việc xử lý video và biên tập nội dung.  
 Những lợi ích nổi bật của Spotlight bao gồm:

* Ứng dụng đa ngành – Thiết kế dạng mô-đun cho phép Spotlight dễ dàng triển khai trong nhiều lĩnh vực khác nhau, từ truyền thông & giải trí cho đến bán lẻ.

* Xử lý theo thời gian thực – Spotlight hỗ trợ cả luồng video trực tiếp và video đã ghi sẵn, cho phép tạo các đoạn highlight tùy chỉnh chỉ trong vài phút — thay vì hàng giờ hoặc thậm chí nhiều ngày như trước.

* Triển khai tiết kiệm chi phí – Toàn bộ hệ thống hoạt động theo mô hình serverless và on-demand, giúp giảm chi phí hạ tầng nhàn rỗi và tối đa hóa hiệu suất sử dụng tài nguyên.

* Hiệu quả vượt trội – Theo đánh giá của Accenture, việc sử dụng các mô hình Amazon Nova cho thấy chi phí tạo highlight bằng Spotlight tiết kiệm hơn hơn 10 lần so với các phương pháp truyền thống.

Bảng sau cung cấp phân tích so sánh giữa phương pháp xử lý video của Spotlight và các cách tiếp cận truyền thống trong việc tạo video highlight.

| Metric                                | Spotlight Performance                                                                             | Conventional Approach                                |
| :------------------------------------ | :------------------------------------------------------------------------------------------------ | :--------------------------------------------------- |
| Độ trễ xử lý video                    | Chỉ mất vài phút cho video dài 2-3 giờ                                                            | Mất từ vài giờ đến vài ngày                          |
| Chi phí đánh giá highlight (3–5 phút) | Thấp hơn 10 lần nhờ sử dụng Amazon Nova                                                           | Chi phí cao khi dùng phương pháp truyền thống        |
| Tổng chi phí tạo highlight            | Thấp hơn 10 lần nhờ kiến trúc serverless và triển khai LLM theo nhu cầu                           | Quy trình thủ công với chi phí vận hành cao          |
| Kiến trúc triển khai                  | Hoàn toàn serverless, có thể mở rộng với lời gọi LLM linh hoạt                                    | Thường tiêu tốn tài nguyên và được cấp phát tĩnh     |
| Tính linh hoạt trong ứng dụng         | Áp dụng được cho nhiều lĩnh vực như thể thao, chỉnh sửa video, cá nhân hóa bán lẻ, và hơn thế nữa | Thường chỉ phù hợp cho một trường hợp sử dụng cụ thể |

---
### Kết luận 

Spotlight đại diện cho một giải pháp tiên tiến dựa trên kiến trúc agent được thiết kế để giải quyết những thách thức phức tạp trong xử lý phương tiện truyền thông và cá nhân hóa trải nghiệm khách hàng bằng generative AI. Với quy trình làm việc đa agent mang tính mô-đun được xây dựng trên Amazon Nova, Spotlight có khả năng tạo ra các video ngắn một cách linh hoạt và tự động. Core framework của giải pháp này cũng có thể mở rộng để áp dụng cho nhiều lĩnh vực khác nhau đòi hỏi phân tích nội dung đa phương tiện ở quy mô lớn.

Là [Premier Tier Services Partner](https://partners.amazonaws.com/partners/001E000000VHBQIIA5/Accenture) và Managed Services Provider  (MSP) của AWS, Accenture mang đến chuyên môn sâu về điện toán đám mây và kiến thức ngành nghề. Trong hơn một thập kỷ hợp tác, Accenture và AWS đã cùng nhau giúp các tổ chức khai thác giá trị từ ứng dụng và dữ liệu của họ. Với đội ngũ chuyên gia về AI sinh và hiểu biết sâu về từng ngành, Accenture xây dựng và tùy chỉnh các giải pháp AI phù hợp với nhu cầu riêng của từng khách hàng.Thông qua Accenture AWS Business Group (AABG), hai bên tiếp tục giúp các doanh nghiệp mở khóa giá trị kinh doanh, thúc đẩy đổi mới, và chuyển đổi trong môi trường đám mây, bằng cách triển khai và mở rộng nhanh chóng các giải pháp AI sinh phù hợp với từng mục tiêu cụ thể.

---
## Giới thiệu về các tác giả 

 ![Ilan Geller ](/images/3-Blog/itan.png)**Ilan Geller** là Giám đốc Điều hành trong lĩnh vực Dữ liệu và Trí tuệ nhân tạo tại Accenture. Ông hiện giữ vai trò Trưởng nhóm đối tác toàn cầu của AWS về Dữ liệu và AI, đồng thời lãnh đạo Trung tâm Trí tuệ nhân tạo Nâng cao. Trong suốt sự nghiệp của mình tại Accenture, ông đã tập trung vào việc thiết kế, phát triển và triển khai các giải pháp dữ liệu, AI/ML và gần đây là Generative AI ở quy mô lớn và phức tạp.

[Dr. Kamal Mannar ](/images/3-Blog/Dr.Kamal-Mannar.jpg)**Tiến sĩ Kamal Mannar** là Trưởng nhóm về Global Computer Vision Lead tại Trung tâm Trí tuệ nhân tạo Nâng cao của Accenture, với hơn 20 năm kinh nghiệm ứng dụng AI trong nhiều lĩnh vực như nông nghiệp, y tế, năng lượng và viễn thông. Ông đã dẫn dắt nhiều chương trình chuyển đổi AI quy mô lớn, xây dựng các giải pháp AI sinh và thị giác máy tính có khả năng mở rộng, và là chủ sở hữu của hơn 10 bằng sáng chế trong các lĩnh vực như deep learning,wearable AI và vision transformers. Trước đây, ông từng là Trưởng bộ phận AI tại Vulcan AI, dẫn đầu đổi mới trong precision agriculture. Ông nhận bằng Tiến sĩ về Kỹ thuật Công nghiệp & Hệ thống từ Đại học Wisconsin–Madison.

![Debasmita Ghosh  ](/images/3-Blog/Deba.jpg)**Debasmita Ghosh** hiện là Giám đốc Liên kết tại Accenture, với 21 năm kinh nghiệm trong lĩnh vực Công nghệ Thông tin, trong đó 8 năm chuyên sâu về AI và Generative AI. Bà hiện lãnh đạo nhóm Thị giác máy tính tại Ấn Độ, đồng thời có nhiều công trình nghiên cứu và bằng sáng chế trong lĩnh vực này. Bà đã trình bày các nghiên cứu về Handwritten Text Recognition tại các hội nghị quốc tế như MCPR 2020 và GHCI 2020, đồng thời nhận giải thưởng Accenture Inventor Award cho bằng sáng chế của mình. Ngoài ra, bà còn có nhiều bài báo quốc tế về trích xuất bảng biểu được công bố tại ComPE 2021 và CCVPR 2021\. Trước đây, bà từng tham gia phát triển các hệ thống Oracle Apps và SAP trong nhiều giai đoạn của vòng đời phát triển phần mềm (SDLC). Bà có bằng Thạc sĩ Khoa học (M.Sc.) chuyên ngành Thống kê từ Đại học Calcutta.

![Nakul Aggarwal  ](/images/3-Blog/Nakul.jpg)**Nakul Aggarwal** là Chuyên gia hàng đầu về Computer Vision và Generative AI tại Accenture, với khoảng 7 năm kinh nghiệm trong việc phát triển và triển khai các giải pháp tiên tiến về multimodal AI và agentic systems. Ông có bằng Thạc sĩ từ Viện Công nghệ Ấn Độ (IIT Delhi), đã công bố nhiều bài báo quốc tế, và nắm giữ hai bằng sáng chế trong lĩnh vực AI. Ngoài công việc kỹ thuật, ông còn hướng dẫn đội ngũ kỹ sư trẻ và kết nối nghiên cứu học thuật với ứng dụng thực tế trong doanh nghiệp.

![Aramide Kehinde](/images/3-Blog/Aramide-Kehinde.jpg)**Aramide Kehinde** là Global Partner Solutions Architect cho Amazon Nova tại AWS. Bà hợp tác với các doanh nghiệp tăng trưởng nhanh để xây dựng và triển khai các giải pháp công nghệ tiên tiến dựa trên AWS Generative AI. Bà có kinh nghiệm làm việc trong nhiều lĩnh vực, bao gồm Truyền thông & Giải trí, Dịch vụ Tài chính và Chăm sóc Sức khỏe. Aramide đặc biệt yêu thích việc kết hợp giữa AI và sáng tạo, cũng như dành thời gian cho gia đình.

![Rajdeep Banerjee  ](/images/3-Blog/Rajdeep.png)**Rajdeep Banerjee** là Senior Partner Solutions Architect tại AWS, hỗ trợ các đối tác chiến lược và khách hàng trong hành trình chuyển đổi số và di chuyển lên đám mây. Ông tập trung vào việc tư vấn kỹ thuật, hiểu nhu cầu chuyên biệt của từng đối tác, và thiết kế các giải pháp tối ưu trên nền tảng AWS. Rajdeep là thành viên của cộng đồng kỹ thuật Serverless và hiện làm việc tại Richmond, Virginia (Hoa Kỳ).

