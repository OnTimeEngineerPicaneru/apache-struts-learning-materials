# ER図

この資料では、総合演習で扱う3つの業務システムのER設計を整理します。

## 1. 会員管理システム

```mermaid
erDiagram
    MEMBERS {
        int id PK
        varchar name
        varchar email UK
        varchar phone
        varchar status
        timestamp created_at
        timestamp updated_at
    }

    USERS {
        int id PK
        varchar login_id UK
        varchar password_hash
        varchar role
        varchar status
        timestamp created_at
        timestamp updated_at
    }

    OPERATION_LOGS {
        int id PK
        int user_id FK
        varchar operation_type
        varchar target_table
        int target_id
        timestamp operated_at
    }

    USERS ||--o{ OPERATION_LOGS : records
```

## 2. ECサイト

```mermaid
erDiagram
    MEMBERS ||--o{ ORDERS : places
    ORDERS ||--o{ ORDER_ITEMS : contains
    PRODUCTS ||--o{ ORDER_ITEMS : ordered_as
    PRODUCTS }o--|| CATEGORIES : belongs_to

    MEMBERS {
        int id PK
        varchar name
        varchar email UK
        varchar status
    }

    CATEGORIES {
        int id PK
        varchar name
    }

    PRODUCTS {
        int id PK
        int category_id FK
        varchar name
        text description
        int price
        int stock
        varchar status
    }

    ORDERS {
        int id PK
        int member_id FK
        int total_amount
        varchar status
        timestamp ordered_at
    }

    ORDER_ITEMS {
        int id PK
        int order_id FK
        int product_id FK
        int quantity
        int price
    }
```

## 3. 在庫管理システム

```mermaid
erDiagram
    PRODUCTS ||--o{ STOCKS : has
    WAREHOUSES ||--o{ STOCKS : stores
    PRODUCTS ||--o{ STOCK_MOVEMENTS : moved
    WAREHOUSES ||--o{ STOCK_MOVEMENTS : from_or_to
    USERS ||--o{ OPERATION_LOGS : records

    PRODUCTS {
        int id PK
        varchar code UK
        varchar name
        varchar status
    }

    WAREHOUSES {
        int id PK
        varchar code UK
        varchar name
        varchar address
    }

    STOCKS {
        int id PK
        int product_id FK
        int warehouse_id FK
        int quantity
        int version
    }

    STOCK_MOVEMENTS {
        int id PK
        int product_id FK
        int from_warehouse_id FK
        int to_warehouse_id FK
        int quantity
        varchar movement_type
        timestamp moved_at
    }

    USERS {
        int id PK
        varchar login_id UK
        varchar role
    }

    OPERATION_LOGS {
        int id PK
        int user_id FK
        varchar operation_type
        timestamp operated_at
    }
```

## 設計上の注意

- 業務データは物理削除ではなく論理削除を検討する
- 更新履歴が必要な業務では履歴テーブルを持つ
- 在庫や注文など整合性が重要な処理はトランザクション境界を明確にする
- 外部キー、ユニーク制約、インデックスを設計段階で決める
- 個人情報を含むテーブルはアクセス権限とログを設計する
