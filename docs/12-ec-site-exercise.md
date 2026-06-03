# 12. ECサイト演習

## 目的

Strutsを使って、小規模なECサイトを設計・実装します。

## 機能一覧

| 機能 | 説明 |
|---|---|
| 商品一覧 | 商品を一覧表示する |
| 商品詳細 | 商品の詳細を表示する |
| カート追加 | 商品をカートへ追加する |
| カート表示 | カート内商品を表示する |
| 数量変更 | カート内数量を変更する |
| 注文確認 | 注文内容を確認する |
| 注文確定 | 注文を登録する |
| 注文履歴 | 過去の注文を表示する |
| 管理者商品登録 | 管理者が商品を登録する |

## 画面一覧

| 画面 | URL | JSP |
|---|---|---|
| 商品一覧 | /product/list | product-list.jsp |
| 商品詳細 | /product/detail | product-detail.jsp |
| カート | /cart | cart.jsp |
| 注文確認 | /order/confirm | order-confirm.jsp |
| 注文完了 | /order/complete | order-complete.jsp |
| 注文履歴 | /order/history | order-history.jsp |
| 商品管理 | /admin/product/list | admin-product-list.jsp |

## テーブル設計

### products

| カラム | 型 | 説明 |
|---|---|---|
| id | int | 主キー |
| name | varchar | 商品名 |
| description | text | 商品説明 |
| price | int | 価格 |
| stock | int | 在庫数 |
| status | varchar | 販売中 / 停止 |

### orders

| カラム | 型 | 説明 |
|---|---|---|
| id | int | 主キー |
| member_id | int | 会員ID |
| total_amount | int | 合計金額 |
| status | varchar | 注文状態 |
| ordered_at | timestamp | 注文日時 |

### order_items

| カラム | 型 | 説明 |
|---|---|---|
| id | int | 主キー |
| order_id | int | 注文ID |
| product_id | int | 商品ID |
| quantity | int | 数量 |
| price | int | 注文時価格 |

## 設計ポイント

### カートはどこに保存するか

学習用ではセッションに保持します。

```text
session.cart
```

実務では、ログイン済みユーザーのカートをDBに保存する設計もあります。

### 注文確定時の注意

- 在庫数を確認する
- 注文テーブルに登録する
- 注文明細を登録する
- 在庫数を減らす
- すべてを1トランザクションで行う

## 実装順序

1. 商品一覧を作成する
2. 商品詳細を作成する
3. セッションカートを作成する
4. カート追加を実装する
5. 注文確認を作成する
6. 注文確定処理を実装する
7. 在庫チェックを追加する
8. 管理者用商品登録を追加する

## 発展課題

- ページング
- 商品検索
- カテゴリ管理
- 画像アップロード
- 注文キャンセル
- 売上集計
- 管理者権限
- 決済API連携の設計
