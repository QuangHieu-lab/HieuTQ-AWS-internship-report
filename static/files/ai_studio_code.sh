#!/bin/bash

# ==============================================================================
# SCRIPT TẠO GSI CHUẨN THEO CODE BACKEND FLYORA
# ==============================================================================

# 1. Tắt chế độ xem trang (Pager) để script chạy tự động không cần nhấn 'q'
export AWS_PAGER=""

# 2. Định nghĩa lệnh AWS
AWS_CMD="aws dynamodb"

wait_for_table() {
  TABLE_NAME=$1
  echo ">>> Đang đợi bảng $TABLE_NAME hoàn tất tạo Index..."

  while true; do
    STATUS=$($AWS_CMD describe-table --table-name $TABLE_NAME \
        --query "Table.GlobalSecondaryIndexes[*].IndexStatus" --output text 2>/dev/null)

    if [[ "$STATUS" == *"CREATING"* ]]; then
        echo "    -> Index đang tạo... đợi 10 giây..."
        sleep 10
    else
        echo "    -> Tất cả index đã ACTIVE."
        break
    fi
  done
}

echo ">>> BẮT ĐẦU QUÁ TRÌNH CẬP NHẬT INDEX..."

# ==============================================================================
# GIAI ĐOẠN 1: TẠO INDEX CHO CÁC BẢNG (Mỗi bảng 1 Index)
# ==============================================================================

# 1. AccountRepository: table.index("username-index")
# Model: AccountDynamoDB -> @DynamoDbAttribute("username") -> String
echo "--- [1/25] Account: Tạo username-index..."
$AWS_CMD update-table --table-name Account \
    --attribute-definitions AttributeName=username,AttributeType=S \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"username-index\",\"KeySchema\":[{\"AttributeName\":\"username\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Account

# 2. AccessLogRepository: table.index("account_id-index")
# Model: AccessLogDynamoDB -> @DynamoDbAttribute("account_id") -> Number
echo "--- [2/25] AccessLog: Tạo account_id-index..."
$AWS_CMD update-table --table-name AccessLog \
    --attribute-definitions AttributeName=account_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"account_id-index\",\"KeySchema\":[{\"AttributeName\":\"account_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table AccessLog

# 3. AdminRepository: table.index("account_id-index")
# Model: AdminDynamoDB -> @DynamoDbAttribute("account_id") -> Number
echo "--- [3/25] Admin: Tạo account_id-index..."
$AWS_CMD update-table --table-name Admin \
    --attribute-definitions AttributeName=account_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"account_id-index\",\"KeySchema\":[{\"AttributeName\":\"account_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Admin

# 4. ChatBotRepository: table.index("customer_id-index")
# Model: ChatBotDynamoDB -> @DynamoDbAttribute("customer_id") -> Number
echo "--- [4/25] ChatBot: Tạo customer_id-index..."
$AWS_CMD update-table --table-name ChatBot \
    --attribute-definitions AttributeName=customer_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"customer_id-index\",\"KeySchema\":[{\"AttributeName\":\"customer_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table ChatBot

# 5. CustomerRepository: table.index("account_id-index")
# Model: CustomerDynamoDB -> @DynamoDbAttribute("account_id") -> Number
echo "--- [5/25] Customer: Tạo account_id-index..."
$AWS_CMD update-table --table-name Customer \
    --attribute-definitions AttributeName=account_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"account_id-index\",\"KeySchema\":[{\"AttributeName\":\"account_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Customer

# 6. FaqRepository: table.index("updated_by-index")
# Model: FaqDynamoDB -> @DynamoDbAttribute("updated_by") -> Number
echo "--- [6/25] Faq: Tạo updated_by-index..."
$AWS_CMD update-table --table-name Faq \
    --attribute-definitions AttributeName=updated_by,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"updated_by-index\",\"KeySchema\":[{\"AttributeName\":\"updated_by\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Faq

# 7. FoodDetailRepository: table.index("product_id-index")
# Model: FoodDetailDynamoDB -> @DynamoDbAttribute("product_id") -> Number
echo "--- [7/25] FoodDetail: Tạo product_id-index..."
$AWS_CMD update-table --table-name FoodDetail \
    --attribute-definitions AttributeName=product_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"product_id-index\",\"KeySchema\":[{\"AttributeName\":\"product_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table FoodDetail

# 8. FurnitureDetailRepository: table.index("product_id-index")
# Model: FurnitureDetailDynamoDB -> @DynamoDbAttribute("product_id") -> Number
echo "--- [8/25] FurnitureDetail: Tạo product_id-index..."
$AWS_CMD update-table --table-name FurnitureDetail \
    --attribute-definitions AttributeName=product_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"product_id-index\",\"KeySchema\":[{\"AttributeName\":\"product_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table FurnitureDetail

# 9. ToyDetailRepository: table.index("product_id-index")
# Model: ToyDetailDynamoDB -> @DynamoDbAttribute("product_id") -> Number
echo "--- [9/25] ToyDetail: Tạo product_id-index..."
$AWS_CMD update-table --table-name ToyDetail \
    --attribute-definitions AttributeName=product_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"product_id-index\",\"KeySchema\":[{\"AttributeName\":\"product_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table ToyDetail

# 10. IssueReportRepository: table.index("customer_id-index")
# Model: IssueReportDynamoDB -> @DynamoDbAttribute("customer_id") -> Number
echo "--- [10/25] IssueReport: Tạo customer_id-index..."
$AWS_CMD update-table --table-name IssueReport \
    --attribute-definitions AttributeName=customer_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"customer_id-index\",\"KeySchema\":[{\"AttributeName\":\"customer_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table IssueReport

# 11. NotificationRepository: table.index("recipient_id-index")
# Model: NotificationDynamoDB -> @DynamoDbAttribute("recipient_id") -> Number
echo "--- [11/25] Notification: Tạo recipient_id-index..."
$AWS_CMD update-table --table-name Notification \
    --attribute-definitions AttributeName=recipient_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"recipient_id-index\",\"KeySchema\":[{\"AttributeName\":\"recipient_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Notification

# 12. OrderItemRepository: table.index("order_id-index")
# Model: OrderItemDynamoDB -> @DynamoDbAttribute("order_id") -> Number
echo "--- [12/25] OrderItem: Tạo order_id-index..."
$AWS_CMD update-table --table-name OrderItem \
    --attribute-definitions AttributeName=order_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"order_id-index\",\"KeySchema\":[{\"AttributeName\":\"order_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table OrderItem

# 13. OrderRepository: table.index("customer_id-index")
# Model: OrderDynamoDB -> @DynamoDbAttribute("customer_id") -> Number
echo "--- [13/25] Order: Tạo customer_id-index..."
$AWS_CMD update-table --table-name Order \
    --attribute-definitions AttributeName=customer_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"customer_id-index\",\"KeySchema\":[{\"AttributeName\":\"customer_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Order

# 14. PaymentRepository: table.index("customer_id-index")
# Model: PaymentDynamoDB -> @DynamoDbAttribute("customer_id") -> Number
echo "--- [14/25] Payment: Tạo customer_id-index..."
$AWS_CMD update-table --table-name Payment \
    --attribute-definitions AttributeName=customer_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"customer_id-index\",\"KeySchema\":[{\"AttributeName\":\"customer_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Payment

# 15. PolicyRepository: table.index("updated_by-index")
# Model: PolicyDynamoDB -> @DynamoDbAttribute("updated_by") -> Number
echo "--- [15/25] Policy: Tạo updated_by-index..."
$AWS_CMD update-table --table-name Policy \
    --attribute-definitions AttributeName=updated_by,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"updated_by-index\",\"KeySchema\":[{\"AttributeName\":\"updated_by\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Policy

# 16. ProductCategoryRepository: table.index("product_id-index")
# Model: ProductCategoryDynamoDB -> @DynamoDbAttribute("id") ??? 
# Check lại code repo: "findByProductId" -> index("product_id-index")
# Nhưng Model ProductCategoryDynamoDB chỉ có ID và Name. 
# GIẢ ĐỊNH: Bạn có thể đã thiếu field productId trong Model ProductCategoryDynamoDB hoặc code repo nhầm lẫn.
# Tuy nhiên, theo yêu cầu "scan repo", repo gọi "product_id-index", nên ta vẫn tạo.
# Nếu model thiếu field productId, bạn cần thêm vào Java trước. Ở đây ta tạo theo repo.
echo "--- [16/25] ProductCategory: Tạo product_id-index (Cảnh báo: Model cần có field productId)..."
# Lưu ý: Lệnh này sẽ lỗi nếu trong data chưa có cột product_id, nhưng ta vẫn tạo cấu trúc.
# Dựa trên tên Repository "ProductCategoryRepository", thường bảng này chứa danh mục, 
# nhưng hàm findByProductId ngụ ý "Tìm Category của Product"? -> Có thể logic là Product -> Category. 
# Nhưng Repo lại viết: table.index("product_id-index"). Ta cứ tạo theo đúng code Repo.
$AWS_CMD update-table --table-name ProductCategory \
    --attribute-definitions AttributeName=product_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"product_id-index\",\"KeySchema\":[{\"AttributeName\":\"product_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table ProductCategory

# 17. ProductRepository: table.index("shop_owner_id-index")
# Model: ProductDynamoDB -> @DynamoDbAttribute("shop_owner_id") -> Number
echo "--- [17/25] Product: Tạo shop_owner_id-index..."
$AWS_CMD update-table --table-name Product \
    --attribute-definitions AttributeName=shop_owner_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"shop_owner_id-index\",\"KeySchema\":[{\"AttributeName\":\"shop_owner_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Product

# 18. SalesStaffRepository: table.index("account_id-index")
# Model: SalesStaffDynamoDB -> @DynamoDbAttribute("account_id") -> Number
echo "--- [18/25] SalesStaff: Tạo account_id-index..."
$AWS_CMD update-table --table-name SalesStaff \
    --attribute-definitions AttributeName=account_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"account_id-index\",\"KeySchema\":[{\"AttributeName\":\"account_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table SalesStaff

# 19. ShopOwnerRepository: table.index("account_id-index")
# Model: ShopOwnerDynamoDB -> @DynamoDbAttribute("account_id") -> Number
echo "--- [19/25] ShopOwner: Tạo account_id-index..."
$AWS_CMD update-table --table-name ShopOwner \
    --attribute-definitions AttributeName=account_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"account_id-index\",\"KeySchema\":[{\"AttributeName\":\"account_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table ShopOwner

# ==============================================================================
# GIAI ĐOẠN 2: XỬ LÝ CÁC BẢNG CÓ 2 INDEX (Chạy lần 1)
# Các bảng: DeliveryNote, ProductReview, Promotion
# ==============================================================================

echo ">>> Bắt đầu tạo Index thứ nhất cho các bảng có nhiều Index..."

# 20. DeliveryNote: table.index("tracking_number-index")
# Model: DeliveryNoteDynamoDB -> @DynamoDbAttribute("tracking_number") -> String
echo "--- [20/25] DeliveryNote: Tạo tracking_number-index..."
$AWS_CMD update-table --table-name DeliveryNote \
    --attribute-definitions AttributeName=tracking_number,AttributeType=S \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"tracking_number-index\",\"KeySchema\":[{\"AttributeName\":\"tracking_number\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table DeliveryNote

# 21. ProductReview: table.index("product_id-index")
# Model: ProductReviewDynamoDB -> @DynamoDbAttribute("product_id") -> Number
echo "--- [21/25] ProductReview: Tạo product_id-index..."
$AWS_CMD update-table --table-name ProductReview \
    --attribute-definitions AttributeName=product_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"product_id-index\",\"KeySchema\":[{\"AttributeName\":\"product_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table ProductReview

# 22. Promotion: table.index("customer_id-index")
# Model: PromotionDynamoDB -> @DynamoDbAttribute("customer_id") -> Number
echo "--- [22/25] Promotion: Tạo customer_id-index..."
$AWS_CMD update-table --table-name Promotion \
    --attribute-definitions AttributeName=customer_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"customer_id-index\",\"KeySchema\":[{\"AttributeName\":\"customer_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Promotion

# ==============================================================================
# GIAI ĐOẠN 3: ĐỢI VÀ TẠO INDEX THỨ HAI
# ==============================================================================

echo ">>> Bắt đầu tạo Index thứ hai..."

# 23. DeliveryNote: table.index("order_id-index")
# Model: DeliveryNoteDynamoDB -> @DynamoDbAttribute("order_id") -> Number
echo "--- [23/25] DeliveryNote: Tạo order_id-index..."
$AWS_CMD update-table --table-name DeliveryNote \
    --attribute-definitions AttributeName=order_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"order_id-index\",\"KeySchema\":[{\"AttributeName\":\"order_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table DeliveryNote

# 24. ProductReview: table.index("customer_id-index")
# Model: ProductReviewDynamoDB -> @DynamoDbAttribute("customer_id") -> Number
echo "--- [24/25] ProductReview: Tạo customer_id-index..."
$AWS_CMD update-table --table-name ProductReview \
    --attribute-definitions AttributeName=customer_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"customer_id-index\",\"KeySchema\":[{\"AttributeName\":\"customer_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table ProductReview

# 25. Promotion: table.index("product_id-index")
# Model: PromotionDynamoDB -> @DynamoDbAttribute("product_id") -> Number
echo "--- [25/25] Promotion: Tạo product_id-index..."
$AWS_CMD update-table --table-name Promotion \
    --attribute-definitions AttributeName=product_id,AttributeType=N \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"product_id-index\",\"KeySchema\":[{\"AttributeName\":\"product_id\",\"KeyType\":\"HASH\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

wait_for_table Promotion

echo ">>> HOÀN TẤT 100%!"